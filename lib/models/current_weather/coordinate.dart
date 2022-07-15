import 'package:json_annotation/json_annotation.dart';
part 'coordinate.g.dart';

@JsonSerializable()
class Coordinate {
  @JsonKey(required: true, disallowNullValue: true)
  final double lat;

  @JsonKey(required: true, disallowNullValue: true)
  final double lon;

  Coordinate({required this.lat, required this.lon});

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}
