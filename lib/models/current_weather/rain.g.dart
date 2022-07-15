// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rain _$RainFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['1h'],
    disallowNullValues: const ['1h', '3h'],
  );
  return Rain(
    lastOneHour: (json['1h'] as num).toDouble(),
    lastThreeHour: (json['3h'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$RainToJson(Rain instance) {
  final val = <String, dynamic>{
    '1h': instance.lastOneHour,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('3h', instance.lastThreeHour);
  return val;
}
