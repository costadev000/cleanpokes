import 'package:hive/hive.dart';

part 'pokemon_dto.g.dart';

@HiveType(typeId: 1)
class PokemonDto {
  @HiveField(1)
  final List<dynamic>? abilities;
  @HiveField(2)
  final int? base_experience;
  @HiveField(3)
  final List<dynamic>? forms;
  @HiveField(4)
  final List<dynamic>? game_indices;
  @HiveField(5)
  final int? height;
  @HiveField(6)
  final List<dynamic>? held_items;
  @HiveField(7)
  final int? id;
  @HiveField(8)
  final bool? is_default;
  @HiveField(9)
  final String? location_area_encounters;
  @HiveField(10)
  final List<dynamic>? moves;
  @HiveField(11)
  final String name;
  @HiveField(12)
  final int? order;
  @HiveField(13)
  final List<dynamic>? past_types;
  @HiveField(14)
  final Map<dynamic, dynamic>? species;
  @HiveField(15)
  final Map<dynamic, dynamic>? sprites;
  @HiveField(16)
  final List<dynamic>? stats;
  @HiveField(17)
  final List<dynamic>? types;
  @HiveField(18)
  final int? weight;

  PokemonDto({
    this.abilities,
    this.base_experience,
    this.forms,
    this.game_indices,
    this.height,
    this.held_items,
    this.id,
    this.is_default,
    this.location_area_encounters,
    this.moves,
    required this.name,
    this.order,
    this.past_types,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });
  factory PokemonDto.fromMap(Map map) => PokemonDto(
        abilities: map['abilities'],
        base_experience: map['base_experience'],
        forms: map['forms'],
        game_indices: map['game_indices'],
        height: map['height'],
        held_items: map['held_items'],
        id: map['id'],
        is_default: map['is_default'],
        location_area_encounters: map['location_area_encounters'],
        moves: map['moves'],
        name: map['name'],
        order: map['order'],
        past_types: map['past_types'],
        species: map['species'],
        sprites: map['sprites'],
        stats: map['stats'],
        types: map['types'],
        weight: map['weight'],
      );
  Map<String, dynamic> toMap() => {
        "abilities": abilities,
        "base_experience": base_experience,
        "forms": forms,
        "game_indices": game_indices,
        "height": height,
        "held_items": held_items,
        "id": id,
        "is_default": is_default,
        "location_area_encounters": location_area_encounters,
        "moves": moves,
        "name": name,
        "order": order,
        "past_types": past_types,
        "species": species,
        "sprites": sprites,
        "stats": stats,
        "types": types,
        "weight": weight,
      };
}
