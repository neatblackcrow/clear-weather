// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['lat', 'lon'],
    disallowNullValues: const ['lat', 'lon'],
  );
  return Coordinate(
    lat: (json['lat'] as num).toDouble(),
    lon: (json['lon'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CoordinateToJson(Coordinate instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
