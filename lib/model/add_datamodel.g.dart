// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class adddataModelAdapter extends TypeAdapter<add_dataModel> {
  @override
  final int typeId = 1;

  @override
  add_dataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return add_dataModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as DateTime,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, add_dataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.moneytype)
      ..writeByte(1)
      ..write(obj.CategoryItem)
      ..writeByte(2)
      ..write(obj.Amount)
      ..writeByte(3)
      ..write(obj.explain)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is adddataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
