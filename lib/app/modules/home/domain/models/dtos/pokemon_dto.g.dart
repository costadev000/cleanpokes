// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonDtoAdapter extends TypeAdapter<PokemonDto> {
  @override
  final int typeId = 1;

  @override
  PokemonDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonDto(
      abilities: (fields[1] as List?)?.cast<dynamic>(),
      base_experience: fields[2] as int?,
      forms: (fields[3] as List?)?.cast<dynamic>(),
      game_indices: (fields[4] as List?)?.cast<dynamic>(),
      height: fields[5] as int?,
      held_items: (fields[6] as List?)?.cast<dynamic>(),
      id: fields[7] as int?,
      is_default: fields[8] as bool?,
      location_area_encounters: fields[9] as String?,
      moves: (fields[10] as List?)?.cast<dynamic>(),
      name: fields[11] as String,
      order: fields[12] as int?,
      past_types: (fields[13] as List?)?.cast<dynamic>(),
      species: (fields[14] as Map?)?.cast<dynamic, dynamic>(),
      sprites: (fields[15] as Map?)?.cast<dynamic, dynamic>(),
      stats: (fields[16] as List?)?.cast<dynamic>(),
      types: (fields[17] as List?)?.cast<dynamic>(),
      weight: fields[18] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonDto obj) {
    writer
      ..writeByte(18)
      ..writeByte(1)
      ..write(obj.abilities)
      ..writeByte(2)
      ..write(obj.base_experience)
      ..writeByte(3)
      ..write(obj.forms)
      ..writeByte(4)
      ..write(obj.game_indices)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.held_items)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.is_default)
      ..writeByte(9)
      ..write(obj.location_area_encounters)
      ..writeByte(10)
      ..write(obj.moves)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.order)
      ..writeByte(13)
      ..write(obj.past_types)
      ..writeByte(14)
      ..write(obj.species)
      ..writeByte(15)
      ..write(obj.sprites)
      ..writeByte(16)
      ..write(obj.stats)
      ..writeByte(17)
      ..write(obj.types)
      ..writeByte(18)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
