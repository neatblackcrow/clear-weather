import 'package:json_annotation/json_annotation.dart';
part 'wind.g.dart';

@JsonSerializable()
class Wind {
  @JsonKey(required: true, disallowNullValue: true)
  final double speed;

  @JsonKey(required: true, disallowNullValue: true)
  final int deg;

  @JsonKey(disallowNullValue: true)
  final double? gust;

  Wind({required this.speed, required this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
