import 'dart:convert';

import 'package:cleanpokes/app/modules/home/domain/models/dtos/pokemon_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../../data/datasources/get_pokemons_datasource.dart';
import '../../domain/models/dtos/options_dto.dart';

final $GetPokemonsDataSourceImpl =
    Bind.singleton((i) => GetPokemonsDataSourceImpl());

class GetPokemonsDataSourceImpl implements GetPokemonsDataSource {
  final httpClient = Dio();
  final int daystoRefresh = 1;
  GetPokemonsDataSourceImpl() {
    httpClient.options.connectTimeout = const Duration(minutes: 1);
    httpClient.options.receiveTimeout = const Duration(seconds: 30);
    Hive.registerAdapter(PokemonDtoAdapter());
    Hive.registerAdapter(OptionsDtoAdapter());
  }
  Future<bool> doRefresh() async {
    var box = await Hive.openBox<PokemonDto>('pokemons');
    var optionsBox = await Hive.openBox<OptionsDto>('options');
    DateTime? lastUpdate = optionsBox.get('lastUpdate')?.lastUpdate;
    //check if we hava any last update
    if (lastUpdate == null) {
      return true;
    }
    //check if we can refresh the data on database
    if (lastUpdate.difference(DateTime.now()).inDays >= daystoRefresh) {
      //clean pokemon cache database;
      box.clear();
      return true;
    }
    //get pokemon list from cache
    else {
      print('get from Cache');
      return false;
    }
  }

  Future<List<PokemonDto>> savePokemon(String url) async {
    List<PokemonDto> pokelist = [];
    var box = await Hive.openBox<PokemonDto>('pokemons');
    var optionsBox = await Hive.openBox<OptionsDto>('options');
    var res = await httpClient.get(url);
    //clean Options database data
    await optionsBox.clear();
    Map<String, dynamic> decodeRes = jsonDecode(res.toString());
    OptionsDto newOptions =
        OptionsDto(nextPage: decodeRes['next'], lastUpdate: DateTime.now());
    //new OptionsDatabase data
    optionsBox.add(newOptions);
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
    List<PokemonDto> pokelist = [];
    if (await doRefresh()) {
      pokelist = await savePokemon('https://pokeapi.co/api/v2/pokemon');
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
    var optionsBox = await Hive.openBox<OptionsDto>('options');
    List<PokemonDto> pokeList = [];
    OptionsDto option = OptionsDto();
    for (var cacheOptions in optionsBox.values) {
      option = cacheOptions;
    }
    if (option.nextPage != null) {
      print(option.nextPage);
      pokeList = await savePokemon(option.nextPage.toString());
    }
    return pokeList;
  }
}
