// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'image_file_adaptor.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class ImageFileAdaptorAdapter extends TypeAdapter<ImageFileAdaptor> {
//   @override
//   final int typeId = 0;
//
//   @override
//   ImageFileAdaptor read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ImageFileAdaptor(
//       name: fields[0] as String,
//       description: fields[1] as String,
//       file: fields[2] as Uint8List?,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, ImageFileAdaptor obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.name)
//       ..writeByte(1)
//       ..write(obj.description)
//       ..writeByte(2)
//       ..write(obj.file);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ImageFileAdaptorAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
