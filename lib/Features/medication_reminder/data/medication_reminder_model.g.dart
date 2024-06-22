// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_reminder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationReminderAdapter extends TypeAdapter<MedicationReminder> {
  @override
  final int typeId = 0;

  @override
  MedicationReminder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicationReminder(
      name: fields[0] as String,
      portion: fields[1] as String,
      type: fields[2] as String,
      time: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MedicationReminder obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.portion)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationReminderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
