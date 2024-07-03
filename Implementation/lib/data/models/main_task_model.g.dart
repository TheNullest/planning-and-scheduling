// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainTaskModelAdapter extends TypeAdapter<MainTaskModel> {
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
      creator: fields[1] as UserModel,
      title: fields[2] as String,
      memberOfGroup: fields[13] as GroupModel,
      creationDate: fields[3] as DateTime,
      color: fields[4] as Color,
      icon: fields[5] as IconData,
      importance: fields[6] as Importance,
      timeFrames: (fields[12] as List?)?.cast<TaskDoingTimeFrameModel>(),
      fixedTags: (fields[14] as List?)?.cast<TagModel>(),
      tags: (fields[15] as List?)?.cast<TagModel>(),
      subtasks: (fields[10] as List?)?.cast<SubTaskModel>(),
      contributorsId: (fields[16] as List?)?.cast<UserModel>(),
      description: fields[7] as String?,
      parentMainTask: fields[17] as MainTaskModel?,
      deadline: fields[8] as DateTime?,
      repeat: fields[9] as RepetitionInterval?,
      repititionOnWeekDays:
          (fields[18] as List?)?.cast<SelectedWeekDaysModel>(),
      totalSpentTime: fields[19] as Duration?,
      scheduledTimeFrames:
          (fields[11] as List?)?.cast<ScheduledTaskTimeFrame>(),
      goal: fields[20] as GoalModel?,
    )..isDone = fields[21] as bool?;
  }

  @override
  void write(BinaryWriter writer, MainTaskModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creator)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.creationDate)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.icon)
      ..writeByte(6)
      ..write(obj.importance)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.deadline)
      ..writeByte(9)
      ..write(obj.repeat)
      ..writeByte(10)
      ..write(obj.subtasks)
      ..writeByte(11)
      ..write(obj.scheduledTimeFrames)
      ..writeByte(12)
      ..write(obj.timeFrames)
      ..writeByte(13)
      ..write(obj.memberOfGroup)
      ..writeByte(14)
      ..write(obj.fixedTags)
      ..writeByte(15)
      ..write(obj.tags)
      ..writeByte(16)
      ..write(obj.contributorsId)
      ..writeByte(17)
      ..write(obj.parentMainTask)
      ..writeByte(18)
      ..write(obj.repititionOnWeekDays)
      ..writeByte(19)
      ..write(obj.totalSpentTime)
      ..writeByte(20)
      ..write(obj.goal)
      ..writeByte(21)
      ..write(obj.isDone);
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
