// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessState _$SuccessStateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
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
    json['locationName'] as String,
    json['weather'] as String,
    json['weatherDescription'] as String,
    json['iconCode'] as String,
    (json['currentTemp'] as num).toDouble(),
    (json['feelsLike'] as num).toDouble(),
    (json['minTemp'] as num).toDouble(),
    (json['maxTemp'] as num).toDouble(),
    json['humidity'] as int,
    (json['windSpeed'] as num).toDouble(),
  );
}

Map<String, dynamic> _$SuccessStateToJson(SuccessState instance) =>
    <String, dynamic>{
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
