// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStorageAdapter extends TypeAdapter<UserStorage> {
  @override
  final int typeId = 1;

  @override
  UserStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return  UserStorage(
      name: fields[0] as String,
      funds: fields[1].toInt() as int, 
    );
  }

  @override
  void write(BinaryWriter writer, UserStorage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.funds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReceiverStorageAdapter extends TypeAdapter<ReceiverStorage> {
  @override
  final int typeId = 2;

  @override
  ReceiverStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReceiverStorage(
      receiverName: fields[0] as String,
      receiverAmount1: fields[1] as String,
      receiverNumber: fields[2] as String,
      timeSent: fields[3] as String,
      dateSent: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReceiverStorage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.receiverName)
      ..writeByte(1)
      ..write(obj.receiverAmount1)
      ..writeByte(2)
      ..write(obj.receiverNumber)
      ..writeByte(3)
      ..write(obj.timeSent)
      ..writeByte(4)
      ..write(obj.dateSent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceiverStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserStorageImageAdapter extends TypeAdapter<UserStorageImage> {
  @override
  final int typeId = 3;

  @override
  UserStorageImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStorageImage(
      userImage: fields[0] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, UserStorageImage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.userImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStorageImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
