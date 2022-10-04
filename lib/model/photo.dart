// Dart imports:
import 'dart:typed_data';

const String tablePhotos = 'photos';

class PhotoFields {
  static final List<String> values = [
    id,
    data,
    time,
    latitude,
    longitude,
  ];

  static const String id = '_id';
  static const String data = 'data';
  static const String time = 'time';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
}

class Photo {
  final int? id;
  final Uint8List data;
  final DateTime time;
  final double latitude;
  final double longitude;

  const Photo({
    this.id,
    required this.data,
    required this.time,
    required this.latitude,
    required this.longitude,
  });

  Photo copy({
    int? id,
    Uint8List? data,
    DateTime? time,
    double? latitude,
    double? longitude,
  }) =>
      Photo(
        id: id ?? this.id,
        data: data ?? this.data,
        time: time ?? this.time,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  static Photo fromJson(Map<String, Object?> json) => Photo(
        id: json[PhotoFields.id] as int?,
        data: json[PhotoFields.data] as Uint8List,
        time: DateTime.parse(json[PhotoFields.time] as String),
        latitude: json[PhotoFields.latitude] as double,
        longitude: json[PhotoFields.longitude] as double,
      );

  Map<String, Object?> toJson() => {
        PhotoFields.id: id,
        PhotoFields.data: data,
        PhotoFields.time: time.toIso8601String(),
        PhotoFields.latitude: latitude,
        PhotoFields.longitude: longitude,
      };
}
