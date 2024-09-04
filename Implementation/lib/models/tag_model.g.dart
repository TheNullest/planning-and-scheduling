// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagModelAdapter extends BaseTypeAdapterAbstract<TagModel> {
  @override
  final int typeId = 7;

  @override
  TagModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagModel(
      id: fields[0] as String,
      creatorId: fields[24] as String?,
      description: fields[25] as String?,
      title: fields[3] as String,
      colorCode: fields[4] as int,
      iconCode: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TagModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.colorCode)
      ..writeByte(5)
      ..write(obj.iconCode)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(24)
      ..write(obj.creatorId)
      ..writeByte(25)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
