import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_state.g.dart';

enum Units { standard, metric, imperial }

@immutable
abstract class WeatherState {
  @JsonKey(required: true, disallowNullValue: true)
  final String cityName;

  @JsonKey(required: true, disallowNullValue: true)
  final Units units;

  const WeatherState({required this.cityName, required this.units});
}

@JsonSerializable(explicitToJson: true)
class SuccessState extends WeatherState {
  @JsonKey(required: true, disallowNullValue: true)
  final String locationName;

  @JsonKey(required: true, disallowNullValue: true)
  final String weather;

  @JsonKey(required: true, disallowNullValue: true)
  final String weatherDescription;

  @JsonKey(required: true, disallowNullValue: true)
  final String iconCode;

  @JsonKey(required: true, disallowNullValue: true)
  final double currentTemp;

  @JsonKey(required: true, disallowNullValue: true)
  final double feelsLike;

  @JsonKey(required: true, disallowNullValue: true)
  final double minTemp;

  @JsonKey(required: true, disallowNullValue: true)
  final double maxTemp;

  @JsonKey(required: true, disallowNullValue: true)
  final int humidity;

  @JsonKey(required: true, disallowNullValue: true)
  final double windSpeed;

  const SuccessState(
      {required this.locationName,
      required this.weather,
      required this.weatherDescription,
      required this.iconCode,
      required this.currentTemp,
      required this.feelsLike,
      required this.minTemp,
      required this.maxTemp,
      required this.humidity,
      required this.windSpeed,
      required String cityName,
      required Units units})
      : super(cityName: cityName, units: units);

  factory SuccessState.fromJson(Map<String, dynamic> json) =>
      _$SuccessStateFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessStateToJson(this);
}

@JsonSerializable()
class FailState extends WeatherState {
  const FailState({required String cityName, required Units units})
      : super(cityName: cityName, units: units);

  factory FailState.fromJson(Map<String, dynamic> json) =>
      _$FailStateFromJson(json);

  Map<String, dynamic> toJson() => _$FailStateToJson(this);
}

@JsonSerializable()
class NotFoundState extends WeatherState {
  const NotFoundState({required String cityName, required Units units})
      : super(cityName: cityName, units: units);

  factory NotFoundState.fromJson(Map<String, dynamic> json) =>
      _$NotFoundStateFromJson(json);

  Map<String, dynamic> toJson() => _$NotFoundStateToJson(this);
}
