import 'package:json_annotation/json_annotation.dart';
part 'snow.g.dart';

@JsonSerializable()
class Snow {
  @JsonKey(required: true, disallowNullValue: true, name: '1h')
  final double lastOneHour;

  @JsonKey(disallowNullValue: true, name: '3h')
  final double? lastThreeHour;

  Snow({required this.lastOneHour, this.lastThreeHour});

  factory Snow.fromJson(Map<String, dynamic> json) => _$SnowFromJson(json);

  Map<String, dynamic> toJson() => _$SnowToJson(this);
}
