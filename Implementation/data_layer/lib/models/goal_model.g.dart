// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalModelAdapter extends BaseTypeAdapterAbstraction<GoalModel> {
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
      mainTaskId: fields[5] as String,
      creatorId: fields[24] as String?,
      description: fields[25] as String?,
      perDay: fields[1] as int?,
      perWeek: fields[2] as int?,
      perMonth: fields[3] as int?,
      perYear: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GoalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(5)
      ..write(obj.mainTaskId)
      ..writeByte(1)
      ..write(obj.perDay)
      ..writeByte(2)
      ..write(obj.perWeek)
      ..writeByte(3)
      ..write(obj.perMonth)
      ..writeByte(4)
      ..write(obj.perYear)
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
      other is GoalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
