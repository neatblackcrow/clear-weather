// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['speed', 'deg'],
    disallowNullValues: const ['speed', 'deg', 'gust'],
  );
  return Wind(
    speed: (json['speed'] as num).toDouble(),
    deg: json['deg'] as int,
    gust: (json['gust'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) {
  final val = <String, dynamic>{
    'speed': instance.speed,
    'deg': instance.deg,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gust', instance.gust);
  return val;
}
