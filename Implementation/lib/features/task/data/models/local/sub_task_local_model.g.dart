// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTaskLocalModelAdapter extends HiveBaseTypeAdapter<SubTaskLocalModel> {
  @override
  final int typeId = 6;

  @override
  SubTaskLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubTaskLocalModel(
      mainTaskId: fields[4] as String,
      title: fields[6] as String,
      id: fields[0] as String?,
      updatedAt: fields[100] as DateTime?,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      userId: fields[1] as String?,
      priority: fields[5] as int?,
      status: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SubTaskLocalModel obj) {
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
      other is SubTaskLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
