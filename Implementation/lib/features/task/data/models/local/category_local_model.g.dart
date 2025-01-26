// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryLocalModelAdapter
    extends HiveBaseTypeAdapter<CategoryLocalModel> {
  @override
  final int typeId = 2;

  @override
  CategoryLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryLocalModel(
      title: fields[4] as String,
      colorCode: fields[5] as int,
      iconCode: fields[6] as int,
      id: fields[0] as String?,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      updatedAt: fields[100] as DateTime?,
      userId: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryLocalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.colorCode)
      ..writeByte(6)
      ..write(obj.iconCode)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(100)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
