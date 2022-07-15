import 'package:clear_weather/models/current_weather/current_weather.dart';
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
  final CurrentWeather data;

  const SuccessState(
      {required this.data, required String cityName, required Units units})
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
