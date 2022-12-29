// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBStudentListAdapter extends TypeAdapter<DBStudentList> {
  @override
  final int typeId = 1;

  @override
  DBStudentList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBStudentList(
      name: fields[0] as String,
      address: fields[1] as String,
      subject: fields[2] as String,
      mobilenumber: fields[3] as String,
      image: fields[4] as String?,
      email: fields[5] as String?,
      pincode: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DBStudentList obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.subject)
      ..writeByte(3)
      ..write(obj.mobilenumber)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.pincode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBStudentListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
