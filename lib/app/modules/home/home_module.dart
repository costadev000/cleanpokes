import 'package:cleanpokes/app/modules/home/data/repositories/get_pokemons_repository_impl.dart';
import 'package:cleanpokes/app/modules/home/domain/usecases/get_pokemons_usecase_impl.dart';
import 'package:cleanpokes/app/modules/home/external/datasources/get_pokemons_datasource_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home/home_page.dart';
import 'presentation/home/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    $GetPokemonsDataSourceImpl,
    $GetPokemonsRepositoryImpl,
    $GetPokemonsUseCaseImpl,
    Bind.lazySingleton((i) => HomeStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
