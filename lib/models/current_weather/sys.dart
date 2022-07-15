import 'package:json_annotation/json_annotation.dart';
part 'sys.g.dart';

@JsonSerializable()
class Sys {
  @JsonKey(disallowNullValue: true)
  final int? type;

  @JsonKey(disallowNullValue: true)
  final int? id;

  @JsonKey(disallowNullValue: true)
  final double? message;

  @JsonKey(required: true, disallowNullValue: true)
  final String country;

  @JsonKey(required: true, disallowNullValue: true)
  final int sunrise;

  @JsonKey(required: true, disallowNullValue: true)
  final int sunset;

  Sys(
      {this.type,
      this.id,
      this.message,
      required this.country,
      required this.sunrise,
      required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
