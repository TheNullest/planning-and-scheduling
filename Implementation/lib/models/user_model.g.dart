// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter
    extends BaseTypeAdapterAbstract<TypeAdapter<UserModel>, UserModel> {
  @override
  final int typeId = 8;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String,
      userName: fields[1] as String,
      password: fields[2] as String,
      firstName: fields[3] as String,
      lastName: fields[4] as String,
      birthDate: fields[5] as DateTime,
      emailAddress: fields[6] as String,
      profileImagePath: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.birthDate)
      ..writeByte(6)
      ..write(obj.emailAddress)
      ..writeByte(7)
      ..write(obj.profileImagePath)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
