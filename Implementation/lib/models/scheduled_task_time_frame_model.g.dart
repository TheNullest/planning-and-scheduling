// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_task_time_frame_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledTaskTimeIntervalModelAdapter extends BaseTypeAdapterAbstract<
    TypeAdapter<ScheduledTaskTimeIntervalModel>,
    ScheduledTaskTimeIntervalModel> {
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
      creatorId: fields[1] as String,
      mainTaskId: fields[2] as String,
      subTask: fields[3] as String,
      startDateTime: fields[4] as DateTime,
      endDateTime: fields[5] as DateTime?,
      isDone: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledTaskTimeIntervalModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.creatorId)
      ..writeByte(2)
      ..write(obj.mainTaskId)
      ..writeByte(3)
      ..write(obj.subTask)
      ..writeByte(4)
      ..write(obj.startDateTime)
      ..writeByte(5)
      ..write(obj.endDateTime)
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
      other is ScheduledTaskTimeIntervalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
