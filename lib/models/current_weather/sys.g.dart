// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sys _$SysFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['country', 'sunrise', 'sunset'],
    disallowNullValues: const [
      'type',
      'id',
      'message',
      'country',
      'sunrise',
      'sunset'
    ],
  );
  return Sys(
    type: json['type'] as int?,
    id: json['id'] as int?,
    message: (json['message'] as num?)?.toDouble(),
    country: json['country'] as String,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
  );
}

Map<String, dynamic> _$SysToJson(Sys instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('id', instance.id);
  writeNotNull('message', instance.message);
  val['country'] = instance.country;
  val['sunrise'] = instance.sunrise;
  val['sunset'] = instance.sunset;
  return val;
}
