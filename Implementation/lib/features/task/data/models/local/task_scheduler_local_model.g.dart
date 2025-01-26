// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_scheduler_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskSchedulerLocalModelAdapter
    extends HiveBaseTypeAdapter<TaskSchedulerLocalModel> {
  @override
  final int typeId = 5;

  @override
  TaskSchedulerLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskSchedulerLocalModel(
      mainTaskId: fields[4] as String,
      id: fields[0] as String?,
      updatedAt: fields[100] as DateTime?,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      userId: fields[1] as String?,
      goalId: fields[5] as String?,
      willStartAt: fields[6] as DateTime?,
      endAt: fields[10] as DateTime?,
      repetitionType: fields[7] as int?,
      timeUnit: fields[8] as int?,
      specificTimes: (fields[9] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskSchedulerLocalModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(4)
      ..write(obj.mainTaskId)
      ..writeByte(5)
      ..write(obj.goalId)
      ..writeByte(6)
      ..write(obj.willStartAt)
      ..writeByte(7)
      ..write(obj.repetitionType)
      ..writeByte(8)
      ..write(obj.timeUnit)
      ..writeByte(9)
      ..write(obj.specificTimes)
      ..writeByte(10)
      ..write(obj.endAt)
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
      other is TaskSchedulerLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
