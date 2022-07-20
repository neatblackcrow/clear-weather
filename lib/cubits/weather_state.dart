import 'package:clear_weather/cubits/base_state.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_state.g.dart';

enum EWeatherState { success, notFound, fail }

abstract class WeatherState implements BaseState<EWeatherState> {
  factory WeatherState.success(
          {required String locationName,
          required String weather,
          required String weatherDescription,
          required String iconCode,
          required double currentTemp,
          required double feelsLike,
          required double minTemp,
          required double maxTemp,
          required int humidity,
          required double windSpeed}) =>
      SuccessState(locationName, weather, weatherDescription, iconCode,
          currentTemp, feelsLike, minTemp, maxTemp, humidity, windSpeed);

  static const notFound = NotFoundState();

  static const fail = FailState();
}

@immutable
@JsonSerializable()
class SuccessState implements WeatherState {
  @override
  EWeatherState get stateType => EWeatherState.success;

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
      this.locationName,
      this.weather,
      this.weatherDescription,
      this.iconCode,
      this.currentTemp,
      this.feelsLike,
      this.minTemp,
      this.maxTemp,
      this.humidity,
      this.windSpeed);

  factory SuccessState.fromJson(Map<String, dynamic> json) =>
      _$SuccessStateFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessStateToJson(this);
}

@immutable
class FailState implements WeatherState {
  @override
  EWeatherState get stateType => EWeatherState.fail;

  const FailState();
}

@immutable
class NotFoundState implements WeatherState {
  @override
  EWeatherState get stateType => EWeatherState.notFound;

  const NotFoundState();
}
