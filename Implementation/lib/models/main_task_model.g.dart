// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainTaskModelAdapter
    extends BaseTypeAdapterAbstract<TypeAdapter<MainTaskModel>, MainTaskModel> {
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
      creatorId: fields[1] as String,
      title: fields[2] as String,
      taskCategoriesId: (fields[13] as List?)?.cast<String>(),
      creationDate: fields[3] as DateTime,
      colorCode: fields[4] as int,
      iconCode: fields[5] as int,
      importance: fields[6] as int,
      fixedTagsId: (fields[14] as List?)?.cast<String>(),
      tagsId: (fields[15] as List?)?.cast<String>(),
      contributorsId: (fields[16] as List?)?.cast<String>(),
      description: fields[7] as String?,
      deadline: fields[8] as DateTime?,
      repeat: fields[9] as int?,
      totalSpentTime: fields[19] as int?,
      completed: fields[21] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MainTaskModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(1)
      ..write(obj.creatorId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.creationDate)
      ..writeByte(4)
      ..write(obj.colorCode)
      ..writeByte(5)
      ..write(obj.iconCode)
      ..writeByte(6)
      ..write(obj.importance)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.deadline)
      ..writeByte(9)
      ..write(obj.repeat)
      ..writeByte(10)
      ..write(obj.taskCategoriesId)
      ..writeByte(11)
      ..write(obj.fixedTagsId)
      ..writeByte(12)
      ..write(obj.tagsId)
      ..writeByte(15)
      ..write(obj.contributorsId)
      ..writeByte(13)
      ..write(obj.totalSpentTime)
      ..writeByte(14)
      ..write(obj.completed)
      ..writeByte(0)
      ..write(obj.id);
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
