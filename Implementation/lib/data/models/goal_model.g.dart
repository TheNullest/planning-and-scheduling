// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalModelAdapter extends TypeAdapter<GoalModel> {
  @override
  final int typeId = 8;

  @override
  GoalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalModel(
      id: fields[0] as String,
      mainTaskModel: fields[1] as MainTaskModel,
      subTaskModel: fields[2] as SubTaskModel?,
      custom: fields[7] as bool,
      daily: fields[3] as Duration,
      weekly: fields[4] as Duration,
      monthly: fields[5] as Duration,
      yearly: fields[6] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, GoalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mainTaskModel)
      ..writeByte(2)
      ..write(obj.subTaskModel)
      ..writeByte(3)
      ..write(obj.daily)
      ..writeByte(4)
      ..write(obj.weekly)
      ..writeByte(5)
      ..write(obj.monthly)
      ..writeByte(6)
      ..write(obj.yearly)
      ..writeByte(7)
      ..write(obj.custom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
