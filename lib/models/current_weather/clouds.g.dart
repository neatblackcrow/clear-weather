// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clouds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['all'],
    disallowNullValues: const ['all'],
  );
  return Clouds(
    all: json['all'] as int,
  );
}

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };
