import 'package:json_annotation/json_annotation.dart';
part 'main.g.dart';

@JsonSerializable()
class Main {
  @JsonKey(required: true, disallowNullValue: true)
  final double temp;

  @JsonKey(required: true, disallowNullValue: true, name: 'feels_like')
  final double feelsLike;

  @JsonKey(required: true, disallowNullValue: true, name: 'temp_min')
  final double tempMin;

  @JsonKey(required: true, disallowNullValue: true, name: 'temp_max')
  final double tempMax;

  @JsonKey(required: true, disallowNullValue: true)
  final int pressure;

  @JsonKey(required: true, disallowNullValue: true)
  final int humidity;

  @JsonKey(disallowNullValue: true, name: 'sea_level')
  final int? seaLevel;

  @JsonKey(disallowNullValue: true, name: 'grnd_level')
  final int? grndLevel;

  Main(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      this.seaLevel,
      this.grndLevel});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
