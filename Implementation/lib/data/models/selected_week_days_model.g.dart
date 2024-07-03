// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_week_days_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedWeekDaysModelAdapter extends TypeAdapter<SelectedWeekDaysModel> {
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
      mainTask: fields[1] as MainTaskModel,
      selectedWeekDays: (fields[2] as List).cast<WeekDays>(),
    );
  }

  @override
  void write(BinaryWriter writer, SelectedWeekDaysModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mainTask)
      ..writeByte(2)
      ..write(obj.selectedWeekDays);
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
