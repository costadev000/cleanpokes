import '../../../shared/response/response_presentation.dart';

abstract class GetPokemonsUseCase {
  Future<ResponsePresentation> call();
  Future<ResponsePresentation> next();
}
