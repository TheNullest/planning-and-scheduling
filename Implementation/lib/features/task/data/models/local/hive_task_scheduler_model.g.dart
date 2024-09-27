// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_task_scheduler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTaskSchedulerModelAdapter
    extends HiveBaseTypeAdapter<HiveTaskSchedulerModel> {
  @override
  final int typeId = 5;

  @override
  HiveTaskSchedulerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTaskSchedulerModel(
      id: fields[0] as String?,
      order: fields[100] as int,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      creatorId: fields[1] as String?,
      mainTaskId: fields[4] as String,
      willStartAt: fields[6] as DateTime?,
      endAt: fields[10] as DateTime?,
      repetitionType: fields[7] as int?,
      timeUnit: fields[8] as int?,
      specificTimes: (fields[9] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveTaskSchedulerModel obj) {
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
      ..writeByte(100)
      ..write(obj.order)
      ..writeByte(1)
      ..write(obj.creatorId)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTaskSchedulerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
