// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_task_time_interval_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledTaskTimeIntervalModelAdapter
    extends BaseTypeAdapterAbstraction<ScheduledTaskTimeIntervalModel> {
  @override
  final int typeId = 5;

  @override
  ScheduledTaskTimeIntervalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledTaskTimeIntervalModel(
      id: fields[0] as String,
      creatorId: fields[24] as String?,
      description: fields[25] as String?,
      mainTaskId: fields[2] as String,
      subTaskId: fields[3] as String,
      startDateTime: fields[4] as DateTime,
      endDateTime: fields[5] as DateTime?,
      completed: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledTaskTimeIntervalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(2)
      ..write(obj.mainTaskId)
      ..writeByte(3)
      ..write(obj.subTaskId)
      ..writeByte(4)
      ..write(obj.startDateTime)
      ..writeByte(5)
      ..write(obj.endDateTime)
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
      other is ScheduledTaskTimeIntervalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
