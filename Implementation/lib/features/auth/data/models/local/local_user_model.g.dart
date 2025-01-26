// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserModelAdapter extends HiveBaseTypeAdapter<LocalUserModel> {
  @override
  final int typeId = 0;

  @override
  LocalUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUserModel(
      userName: fields[4] as String,
      password: fields[5] as String,
      firstName: fields[6] as String,
      lastName: fields[7] as String,
      emailAddress: fields[8] as String,
      id: fields[0] as String?,
      description: fields[3] as String?,
      createdAt: fields[2] as DateTime?,
      updatedAt: fields[100] as DateTime?,
      birthDate: fields[9] as DateTime?,
      avatarPath: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUserModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.firstName)
      ..writeByte(7)
      ..write(obj.lastName)
      ..writeByte(8)
      ..write(obj.emailAddress)
      ..writeByte(9)
      ..write(obj.birthDate)
      ..writeByte(10)
      ..write(obj.avatarPath)
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
      other is LocalUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
