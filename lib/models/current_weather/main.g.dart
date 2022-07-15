// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'temp',
      'feels_like',
      'temp_min',
      'temp_max',
      'pressure',
      'humidity'
    ],
    disallowNullValues: const [
      'temp',
      'feels_like',
      'temp_min',
      'temp_max',
      'pressure',
      'humidity',
      'sea_level',
      'grnd_level'
    ],
  );
  return Main(
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feels_like'] as num).toDouble(),
    tempMin: (json['temp_min'] as num).toDouble(),
    tempMax: (json['temp_max'] as num).toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    seaLevel: json['sea_level'] as int?,
    grndLevel: json['grnd_level'] as int?,
  );
}

Map<String, dynamic> _$MainToJson(Main instance) {
  final val = <String, dynamic>{
    'temp': instance.temp,
    'feels_like': instance.feelsLike,
    'temp_min': instance.tempMin,
    'temp_max': instance.tempMax,
    'pressure': instance.pressure,
    'humidity': instance.humidity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sea_level', instance.seaLevel);
  writeNotNull('grnd_level', instance.grndLevel);
  return val;
}
