import 'package:cleanpokes/app/modules/home/presentation/home/home_store.dart';
import 'package:cleanpokes/app/modules/home/presentation/home/widgets/custom_loading_widget.dart';
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
      appBar: AppBar(title: Text("Titulo")),
      body: Stack(
        children: [
          Observer(builder: (_) {
            return ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.resPokemon.length,
              itemBuilder: (_, index) {
                final pokemon = controller.resPokemon[index];
                return ListTile(
                  leading: Image.network(
                      pokemon.sprites!['front_default'].toString(),
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CustomLoading();
                    }
                  }),
                  title: Text("#${pokemon.order} ${pokemon.name}"),
                );
              },
            );
          }),
          Observer(builder: (_) {
            return Positioned(
              bottom: 50,
              left: MediaQuery.of(context).size.height * .5,
              child: controller.loading ? CustomLoading() : Container(),
            );
          }),
        ],
      ),
    );
  }
}
