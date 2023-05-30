import 'package:cleanpokes/app/modules/home/domain/repositories/get_pokemons_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/response/response_presentation.dart';
import 'get_pokemons_usecase.dart';

final $GetPokemonsUseCaseImpl =
    Bind.singleton((i) => GetPokemonsUseCaseImpl(i()));

class GetPokemonsUseCaseImpl implements GetPokemonsUseCase {
  final GetPokemonsRepository _getPokemonsRepository;

  GetPokemonsUseCaseImpl(this._getPokemonsRepository);
  @override
  Future<ResponsePresentation> call() async {
    try {
      var res = await _getPokemonsRepository();
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }

  @override
  Future<ResponsePresentation> next() async {
    try {
      var res = await _getPokemonsRepository.next();
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
