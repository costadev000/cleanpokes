import 'dart:convert';

import 'package:cleanpokes/app/modules/home/domain/models/dtos/pokemon_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/get_pokemons_datasource.dart';

final $GetPokemonsDataSourceImpl =
    Bind.singleton((i) => GetPokemonsDataSourceImpl());

class GetPokemonsDataSourceImpl implements GetPokemonsDataSource {
  final httpClient = Dio();
  final int daystoRefresh = 1;
  GetPokemonsDataSourceImpl() {
    httpClient.options.connectTimeout = const Duration(minutes: 1);
    httpClient.options.receiveTimeout = const Duration(seconds: 30);
    Hive.registerAdapter(PokemonDtoAdapter());
  }
  Future<bool> doRefresh() async {
    var box = await Hive.openBox<PokemonDto>('pokemons');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('lastUpdate') == null) {
      return true;
    }
    DateTime lastUpdate =
        DateTime.parse(prefs.getString('lastUpdate').toString());
    if (lastUpdate.difference(DateTime.now()).inDays >= daystoRefresh) {
      box.deleteFromDisk();
      return true;
    } else {
      print('get from Collection');
      return false;
    }
  }

  Future<List<PokemonDto>> savePokemon(String url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<PokemonDto> pokelist = [];
    var box = await Hive.openBox<PokemonDto>('pokemons');
    var res = await httpClient.get(url);
    Map<String, dynamic> decodeRes = jsonDecode(res.toString());
    prefs.setString("next", decodeRes['next']);
    for (var pokemon in decodeRes['results']) {
      var getPoke = await httpClient.get(pokemon['url']);
      Map<String, dynamic> decodedPokemon = jsonDecode(getPoke.toString());
      PokemonDto newPokemon = PokemonDto.fromMap(decodedPokemon);
      box.add(newPokemon);
      pokelist.add(newPokemon);
    }
    return pokelist;
  }

  @override
  Future<List<PokemonDto>> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<PokemonDto> pokelist = [];
    if (await doRefresh()) {
      pokelist = await savePokemon('https://pokeapi.co/api/v2/pokemon');
      prefs.setString('lastUpdate', DateTime.now().toString());
    } else {
      var box = await Hive.openBox<PokemonDto>('pokemons');
      for (var pokemon in box.values) {
        pokelist.add(pokemon);
      }
    }
    return pokelist;
  }

  @override
  Future<List<PokemonDto>> next() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<PokemonDto> pokeList = [];
    if (prefs.getString('next') != null) {
      print(prefs.getString('next'));
      pokeList = await savePokemon(prefs.getString('next').toString());
    }
    return pokeList;
  }
}
