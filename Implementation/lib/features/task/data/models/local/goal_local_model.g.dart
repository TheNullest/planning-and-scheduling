// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalLocalModelAdapter extends HiveBaseTypeAdapter<GoalLocalModel> {
  @override
  final int typeId = 3;

  @override
  GoalLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalLocalModel(
      mainTaskId: fields[4] as String,
      measurementUnitId: fields[6] as String,
      measurementValue: fields[7] as int,
      id: fields[0] as String?,
      updatedAt: fields[100] as DateTime?,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      userId: fields[1] as String?,
      subTaskId: fields[5] as String?,
      perActiveHour: fields[8] as double,
      perActiveDay: fields[9] as double,
      perActiveWeek: fields[10] as double,
      perActiveMonth: fields[11] as double,
      perActiveYear: fields[12] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GoalLocalModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(4)
      ..write(obj.mainTaskId)
      ..writeByte(5)
      ..write(obj.subTaskId)
      ..writeByte(6)
      ..write(obj.measurementUnitId)
      ..writeByte(7)
      ..write(obj.measurementValue)
      ..writeByte(8)
      ..write(obj.perActiveHour)
      ..writeByte(9)
      ..write(obj.perActiveDay)
      ..writeByte(10)
      ..write(obj.perActiveWeek)
      ..writeByte(11)
      ..write(obj.perActiveMonth)
      ..writeByte(12)
      ..write(obj.perActiveYear)
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
      other is GoalLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
