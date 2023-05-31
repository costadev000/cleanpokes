// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionsDtoAdapter extends TypeAdapter<OptionsDto> {
  @override
  final int typeId = 2;

  @override
  OptionsDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionsDto(
      nextPage: fields[1] as String?,
      lastUpdate: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, OptionsDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.nextPage)
      ..writeByte(2)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionsDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
