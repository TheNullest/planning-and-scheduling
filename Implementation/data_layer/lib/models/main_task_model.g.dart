// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainTaskModelAdapter extends BaseTypeAdapterAbstraction<MainTaskModel> {
  @override
  final int typeId = 1;

  @override
  MainTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainTaskModel(
      id: fields[0] as String,
      creatorId: fields[24] as String?,
      description: fields[25] as String?,
      title: fields[2] as String,
      taskCategoriesId: (fields[10] as List?)?.cast<String>(),
      creationDate: fields[3] as DateTime,
      colorCode: fields[4] as int,
      iconCode: fields[5] as int,
      priority: fields[6] as int,
      contributorsId: (fields[15] as List?)?.cast<String>(),
      superMainTaskId: fields[16] as String?,
      fixedTagsId: (fields[11] as List?)?.cast<String>(),
      tagsId: (fields[12] as List?)?.cast<String>(),
      dueTime: fields[8] as DateTime?,
      repetitionInterval: fields[9] as int?,
      totalSpentTime: fields[13] as int?,
      completed: fields[14] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MainTaskModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.creationDate)
      ..writeByte(4)
      ..write(obj.colorCode)
      ..writeByte(5)
      ..write(obj.iconCode)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(8)
      ..write(obj.dueTime)
      ..writeByte(9)
      ..write(obj.repetitionInterval)
      ..writeByte(10)
      ..write(obj.taskCategoriesId)
      ..writeByte(11)
      ..write(obj.fixedTagsId)
      ..writeByte(12)
      ..write(obj.tagsId)
      ..writeByte(13)
      ..write(obj.totalSpentTime)
      ..writeByte(14)
      ..write(obj.completed)
      ..writeByte(15)
      ..write(obj.contributorsId)
      ..writeByte(16)
      ..write(obj.superMainTaskId)
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
      other is MainTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
