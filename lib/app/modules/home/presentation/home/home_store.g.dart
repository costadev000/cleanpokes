// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$scrollControllerAtom =
      Atom(name: '_HomeStoreBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$resPokemonAtom =
      Atom(name: '_HomeStoreBase.resPokemon', context: context);

  @override
  ObservableList<PokemonDto> get resPokemon {
    _$resPokemonAtom.reportRead();
    return super.resPokemon;
  }

  @override
  set resPokemon(ObservableList<PokemonDto> value) {
    _$resPokemonAtom.reportWrite(value, super.resPokemon, () {
      super.resPokemon = value;
    });
  }

  late final _$nextPageAsyncAction =
      AsyncAction('_HomeStoreBase.nextPage', context: context);

  @override
  Future<void> nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  @override
  String toString() {
    return '''
scrollController: ${scrollController},
resPokemon: ${resPokemon}
    ''';
  }
}
