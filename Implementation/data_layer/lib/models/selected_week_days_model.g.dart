// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_week_days_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedWeekDaysModelAdapter
    extends BaseTypeAdapterAbstraction<SelectedWeekDaysModel> {
  @override
  final int typeId = 4;

  @override
  SelectedWeekDaysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedWeekDaysModel(
      id: fields[0] as String,
      creatorId: fields[24] as String?,
      description: fields[25] as String?,
      mainTaskId: fields[4] as String,
      selectedWeekDays: (fields[3] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, SelectedWeekDaysModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(4)
      ..write(obj.mainTaskId)
      ..writeByte(3)
      ..write(obj.selectedWeekDays)
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
      other is SelectedWeekDaysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
