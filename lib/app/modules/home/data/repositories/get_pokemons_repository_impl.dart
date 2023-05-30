import 'package:cleanpokes/app/modules/home/data/datasources/get_pokemons_datasource.dart';
import 'package:cleanpokes/app/modules/home/domain/models/dtos/pokemon_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/repositories/get_pokemons_repository.dart';

final $GetPokemonsRepositoryImpl =
    Bind.singleton((i) => GetPokemonsRepositoryImpl(i()));

class GetPokemonsRepositoryImpl implements GetPokemonsRepository {
  final GetPokemonsDataSource _getPokemonsDataSource;

  GetPokemonsRepositoryImpl(this._getPokemonsDataSource);

  @override
  Future<List<PokemonDto>> call() async {
    try {
      var res = await _getPokemonsDataSource();
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PokemonDto>> next() async {
    try {
      var res = await _getPokemonsDataSource.next();
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
