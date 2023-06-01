import 'package:cleanpokes/app/modules/home/domain/models/dtos/pokemon_dto.dart';
import 'package:flutter/material.dart';

Widget PokemonCard(BuildContext context, PokemonDto pokemonDto) {
  final double maxHeight = MediaQuery.of(context).size.height;
  final double maxWidth = MediaQuery.of(context).size.width;
  return Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: constraints.maxHeight * .6,
                child: Image.network(pokemonDto.sprites!['front_default']),
              ),
              Container(
                height: constraints.maxHeight * .2,
                child: Text("#${pokemonDto.order} ${pokemonDto.name}"),
              ),
            ],
          );
        },
      ),
    ),
  );
}
