// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_sub_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSubTaskModelAdapter extends HiveBaseTypeAdapter<HiveSubTaskModel> {
  @override
  final int typeId = 6;

  @override
  HiveSubTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSubTaskModel(
      id: fields[0] as String?,
      order: fields[100] as int,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      creatorId: fields[1] as String?,
      mainTaskId: fields[4] as String,
      title: fields[6] as String,
      priority: fields[5] as int,
      status: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSubTaskModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(4)
      ..write(obj.mainTaskId)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.title)
      ..writeByte(7)
      ..write(obj.status)
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
      other is HiveSubTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
