import 'package:cleanpokes/app/modules/home/presentation/home/home_store.dart';
import 'package:cleanpokes/app/modules/home/presentation/home/widgets/custom_loading_widget.dart';
import 'package:cleanpokes/app/modules/home/presentation/home/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();
  @override
  void initState() {
    super.initState();
    controller.scrollController.addListener(controller.scrollListener);
    setState(() {
      getData();
    });
  }

  @override
  void dispose() {
    controller.scrollController.dispose();
    super.dispose();
  }

  void getData() async {
    await controller.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Stack(
          children: [
            CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  title: Text("Pokedex"),
                  backgroundColor: Colors.red,
                ),
                SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 10),
                  itemCount: controller.resPokemon.length,
                  itemBuilder: (_, index) {
                    return PokemonCard(context, controller.resPokemon[index]);
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width * .5,
              child: controller.loading ? CustomLoading() : Container(),
            ),
          ],
        );
      }),
    );
  }
}
