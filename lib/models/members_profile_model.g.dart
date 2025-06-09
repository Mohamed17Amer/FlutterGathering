// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberProfileModelAdapter extends TypeAdapter<MemberProfileModel> {
  @override
  final int typeId = 0;

  @override
  MemberProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberProfileModel(
      img: fields[0] as String?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      fromAddress: fields[3] as String?,
      livingAddress: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MemberProfileModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.img)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.fromAddress)
      ..writeByte(4)
      ..write(obj.livingAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
