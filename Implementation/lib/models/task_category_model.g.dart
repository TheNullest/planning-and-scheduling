// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategoryModelAdapter
    extends BaseTypeAdapterAbstract<TaskCategoryModel> {
  @override
  final int typeId = 2;

  @override
  TaskCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskCategoryModel(
      id: fields[0] as String,
      creatorId: fields[24] as String?,
      title: fields[3] as String?,
      description: fields[25] as String?,
      colorCode: fields[4] as int,
      iconCode: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TaskCategoryModel obj) {
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
      other is TaskCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
