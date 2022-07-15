import 'package:clear_weather/models/current_weather/clouds.dart';
import 'package:clear_weather/models/current_weather/coordinate.dart';
import 'package:clear_weather/models/current_weather/main.dart';
import 'package:clear_weather/models/current_weather/rain.dart';
import 'package:clear_weather/models/current_weather/snow.dart';
import 'package:clear_weather/models/current_weather/sys.dart';
import 'package:clear_weather/models/current_weather/weather.dart';
import 'package:clear_weather/models/current_weather/wind.dart';
import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';
part 'current_weather.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class CurrentWeather {
  @JsonKey(required: true, disallowNullValue: true)
  final Coordinate coord;

  @JsonKey(required: true, disallowNullValue: true)
  final List<Weather> weather;

  @JsonKey(required: true, disallowNullValue: true)
  final String base;

  @JsonKey(required: true, disallowNullValue: true)
  final Main main;

  @JsonKey(required: true, disallowNullValue: true)
  final int visibility;

  @JsonKey(required: true, disallowNullValue: true)
  final Wind wind;

  @JsonKey(required: true, disallowNullValue: true)
  final Clouds clouds;

  @JsonKey(disallowNullValue: true)
  final Rain? rain;

  @JsonKey(disallowNullValue: true)
  final Snow? snow;

  @JsonKey(required: true, disallowNullValue: true)
  final int dt;

  @JsonKey(required: true, disallowNullValue: true)
  final Sys sys;

  @JsonKey(required: true, disallowNullValue: true)
  final int timezone;

  @JsonKey(required: true, disallowNullValue: true)
  final int id;

  @JsonKey(required: true, disallowNullValue: true)
  final String name;

  @JsonKey(required: true, disallowNullValue: true)
  final int cod;

  const CurrentWeather(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.clouds,
      this.rain,
      this.snow,
      required this.dt,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.name,
      required this.cod});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
