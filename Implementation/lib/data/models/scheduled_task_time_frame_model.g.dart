// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_task_time_frame_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledTaskTimeFrameAdapter
    extends TypeAdapter<ScheduledTaskTimeFrame> {
  @override
  final int typeId = 5;

  @override
  ScheduledTaskTimeFrame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledTaskTimeFrame(
      id: fields[0] as String,
      creator: fields[1] as UserModel,
      mainTask: fields[2] as MainTaskModel,
      subTask: fields[3] as SubTaskModel,
      startDateTime: fields[4] as DateTime,
      endDateTime: fields[5] as DateTime?,
      isDone: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledTaskTimeFrame obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creator)
      ..writeByte(2)
      ..write(obj.mainTask)
      ..writeByte(3)
      ..write(obj.subTask)
      ..writeByte(4)
      ..write(obj.startDateTime)
      ..writeByte(5)
      ..write(obj.endDateTime)
      ..writeByte(6)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledTaskTimeFrameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
