// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decks_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DecksAdapter extends TypeAdapter<Decks> {
  @override
  final int typeId = 1;

  @override
  Decks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Decks(
      name: fields[1] as String,
      id: fields[0] as String,
      cards: (fields[2] as List).cast<Card>(),
    );
  }

  @override
  void write(BinaryWriter writer, Decks obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cards);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
