// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_interval_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeIntervalLocalModelAdapter
    extends HiveBaseTypeAdapter<TimeIntervalLocalModel> {
  @override
  final int typeId = 8;

  @override
  TimeIntervalLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeIntervalLocalModel(
      mainTaskId: fields[4] as String,
      subTaskId: fields[5] as String,
      startAt: fields[6] as DateTime,
      id: fields[0] as String?,
      updatedAt: fields[100] as DateTime?,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      userId: fields[1] as String?,
      endAt: fields[7] as DateTime?,
      spentTime: fields[8] as Duration?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeIntervalLocalModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(4)
      ..write(obj.mainTaskId)
      ..writeByte(5)
      ..write(obj.subTaskId)
      ..writeByte(6)
      ..write(obj.startAt)
      ..writeByte(7)
      ..write(obj.endAt)
      ..writeByte(8)
      ..write(obj.spentTime)
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
      other is TimeIntervalLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
