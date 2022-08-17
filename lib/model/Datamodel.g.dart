// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Datamodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordsAdapter extends TypeAdapter<Records> {
  @override
  final int typeId = 0;

  @override
  Records read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Records(
      courseTitle: fields[0] as String?,
      absentee: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Records obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.courseTitle)
      ..writeByte(1)
      ..write(obj.absentee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      name: fields[0] as String?,
      semester: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.semester);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
