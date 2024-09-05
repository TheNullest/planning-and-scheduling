// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTaskModelAdapter extends BaseTypeAdapterAbstraction<SubTaskModel> {
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
      creatorId: fields[24] as String?,
      mainTaskId: fields[3] as String,
      title: fields[5] as String,
      description: fields[25] as String?,
      priority: fields[4] as int,
      completed: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SubTaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.mainTaskId)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.completed)
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
      other is SubTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
