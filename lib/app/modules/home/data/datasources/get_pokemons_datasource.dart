import 'package:cleanpokes/app/modules/home/domain/models/dtos/pokemon_dto.dart';

abstract class GetPokemonsDataSource {
  Future<List<PokemonDto>> call();
  Future<List<PokemonDto>> next();
}
