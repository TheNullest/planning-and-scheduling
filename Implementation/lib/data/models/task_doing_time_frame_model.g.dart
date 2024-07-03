// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_doing_time_frame_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDoingTimeFrameModelAdapter
    extends TypeAdapter<TaskDoingTimeFrameModel> {
  @override
  final int typeId = 3;

  @override
  TaskDoingTimeFrameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDoingTimeFrameModel(
      id: fields[0] as String,
      creator: fields[1] as UserModel,
      mainTask: fields[2] as MainTaskModel,
      subTask: fields[3] as SubTaskModel?,
      startAt: fields[4] as DateTime,
      spentTime: fields[6] as Duration,
      endAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskDoingTimeFrameModel obj) {
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
      ..write(obj.startAt)
      ..writeByte(5)
      ..write(obj.endAt)
      ..writeByte(6)
      ..write(obj.spentTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDoingTimeFrameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
