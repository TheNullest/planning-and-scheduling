// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_main_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMainTaskModelAdapter extends HiveBaseTypeAdapter<HiveMainTaskModel> {
  @override
  final int typeId = 1;

  @override
  HiveMainTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMainTaskModel(
      id: fields[0] as String?,
      order: fields[100] as int,
      creatorId: fields[1] as String?,
      description: fields[3] as String?,
      title: fields[4] as String,
      categoryIds: (fields[11] as List?)?.cast<String>(),
      createdAt: fields[2] as DateTime?,
      colorCode: fields[5] as int,
      iconCode: fields[6] as int,
      priority: fields[7] as int?,
      status: fields[15] as int?,
      fixedTagIds: (fields[12] as List?)?.cast<String>(),
      tagIds: (fields[13] as List?)?.cast<String>(),
      dueDate: fields[8] as DateTime?,
      totalSpentTime: fields[14] as Duration?,
      taskSchedulerId: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMainTaskModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.colorCode)
      ..writeByte(6)
      ..write(obj.iconCode)
      ..writeByte(7)
      ..write(obj.priority)
      ..writeByte(8)
      ..write(obj.dueDate)
      ..writeByte(11)
      ..write(obj.categoryIds)
      ..writeByte(12)
      ..write(obj.fixedTagIds)
      ..writeByte(13)
      ..write(obj.tagIds)
      ..writeByte(14)
      ..write(obj.totalSpentTime)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.taskSchedulerId)
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
      other is HiveMainTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
