// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_time_interval_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTimeIntervalModelAdapter
    extends BaseTypeAdapterAbstraction<TaskTimeIntervalModel> {
  @override
  final int typeId = 3;

  @override
  TaskTimeIntervalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskTimeIntervalModel(
      id: fields[0] as String,
      creatorId: fields[24] as String?,
      description: fields[25] as String?,
      mainTaskId: fields[7] as String,
      subTaskId: fields[3] as String?,
      startAt: fields[4] as DateTime,
      spentTime: fields[6] as int,
      endAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskTimeIntervalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(7)
      ..write(obj.mainTaskId)
      ..writeByte(3)
      ..write(obj.subTaskId)
      ..writeByte(4)
      ..write(obj.startAt)
      ..writeByte(5)
      ..write(obj.endAt)
      ..writeByte(6)
      ..write(obj.spentTime)
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
      other is TaskTimeIntervalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
