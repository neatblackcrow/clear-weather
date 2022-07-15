import 'package:json_annotation/json_annotation.dart';
part 'rain.g.dart';

@JsonSerializable()
class Rain {
  @JsonKey(required: true, disallowNullValue: true, name: '1h')
  final double lastOneHour;

  @JsonKey(disallowNullValue: true, name: '3h')
  final double? lastThreeHour;

  Rain({required this.lastOneHour, this.lastThreeHour});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}
