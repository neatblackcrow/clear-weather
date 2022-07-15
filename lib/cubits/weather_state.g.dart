// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessState _$SuccessStateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['cityName', 'units', 'data'],
    disallowNullValues: const ['cityName', 'units', 'data'],
  );
  return SuccessState(
    data: CurrentWeather.fromJson(json['data'] as Map<String, dynamic>),
    cityName: json['cityName'] as String,
    units: $enumDecode(_$UnitsEnumMap, json['units']),
  );
}

Map<String, dynamic> _$SuccessStateToJson(SuccessState instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'units': _$UnitsEnumMap[instance.units],
      'data': instance.data.toJson(),
    };

const _$UnitsEnumMap = {
  Units.standard: 'standard',
  Units.metric: 'metric',
  Units.imperial: 'imperial',
};

FailState _$FailStateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['cityName', 'units'],
    disallowNullValues: const ['cityName', 'units'],
  );
  return FailState(
    cityName: json['cityName'] as String,
    units: $enumDecode(_$UnitsEnumMap, json['units']),
  );
}

Map<String, dynamic> _$FailStateToJson(FailState instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'units': _$UnitsEnumMap[instance.units],
    };

NotFoundState _$NotFoundStateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['cityName', 'units'],
    disallowNullValues: const ['cityName', 'units'],
  );
  return NotFoundState(
    cityName: json['cityName'] as String,
    units: $enumDecode(_$UnitsEnumMap, json['units']),
  );
}

Map<String, dynamic> _$NotFoundStateToJson(NotFoundState instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'units': _$UnitsEnumMap[instance.units],
    };
