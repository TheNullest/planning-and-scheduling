// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTaskModelAdapter
    extends BaseTypeAdapterAbstract<TypeAdapter<SubTaskModel>, SubTaskModel> {
  @override
  final int typeId = 6;

  @override
  SubTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubTaskModel(
      id: fields[0] as String,
      creatorId: fields[1] as String,
      maintTaskId: fields[2] as String,
      subTaskName: fields[4] as String,
      description: fields[5] as String?,
      importance: fields[3] as int,
      isDone: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SubTaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.creatorId)
      ..writeByte(2)
      ..write(obj.maintTaskId)
      ..writeByte(3)
      ..write(obj.importance)
      ..writeByte(4)
      ..write(obj.subTaskName)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.isDone)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
