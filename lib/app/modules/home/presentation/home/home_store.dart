import 'package:cleanpokes/app/modules/home/domain/models/dtos/pokemon_dto.dart';
import 'package:cleanpokes/app/modules/home/domain/usecases/get_pokemons_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

// ignore: library_private_types_in_public_api
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPokemonsUseCase _getPokemonsUseCase;

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  var resPokemon = ObservableList<PokemonDto>();

  _HomeStoreBase(this._getPokemonsUseCase);

  Future<void> getPokemons() async {
    var res = await _getPokemonsUseCase();
    if (!res.success) {
      print(res.message);
    }
    resPokemon.addAll(res.body);
  }

  @action
  Future<void> nextPage() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      var res = await _getPokemonsUseCase.next();
      if (!res.success) {
        print(res.message);
      }
      resPokemon.addAll(res.body);
    }
  }
}
