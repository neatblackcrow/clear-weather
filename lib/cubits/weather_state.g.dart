// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessState _$SuccessStateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'cityName',
      'units',
      'locationName',
      'weather',
      'weatherDescription',
      'iconCode',
      'currentTemp',
      'feelsLike',
      'minTemp',
      'maxTemp',
      'humidity',
      'windSpeed'
    ],
    disallowNullValues: const [
      'cityName',
      'units',
      'locationName',
      'weather',
      'weatherDescription',
      'iconCode',
      'currentTemp',
      'feelsLike',
      'minTemp',
      'maxTemp',
      'humidity',
      'windSpeed'
    ],
  );
  return SuccessState(
    locationName: json['locationName'] as String,
    weather: json['weather'] as String,
    weatherDescription: json['weatherDescription'] as String,
    iconCode: json['iconCode'] as String,
    currentTemp: (json['currentTemp'] as num).toDouble(),
    feelsLike: (json['feelsLike'] as num).toDouble(),
    minTemp: (json['minTemp'] as num).toDouble(),
    maxTemp: (json['maxTemp'] as num).toDouble(),
    humidity: json['humidity'] as int,
    windSpeed: (json['windSpeed'] as num).toDouble(),
    cityName: json['cityName'] as String,
    units: $enumDecode(_$UnitsEnumMap, json['units']),
  );
}

Map<String, dynamic> _$SuccessStateToJson(SuccessState instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'units': _$UnitsEnumMap[instance.units],
      'locationName': instance.locationName,
      'weather': instance.weather,
      'weatherDescription': instance.weatherDescription,
      'iconCode': instance.iconCode,
      'currentTemp': instance.currentTemp,
      'feelsLike': instance.feelsLike,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
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
