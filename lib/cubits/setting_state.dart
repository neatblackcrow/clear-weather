import 'package:clear_weather/cubits/base_state.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting_state.g.dart';

enum ESettingState { saved }

enum Units { standard, metric, imperial }

abstract class SettingState implements BaseState<ESettingState> {
  factory SettingState.save({required String cityName, required Units units}) =>
      SavedState(cityName, units);
}

@immutable
@JsonSerializable()
class SavedState implements SettingState {
  @override
  ESettingState get stateType => ESettingState.saved;

  @JsonKey(required: true, disallowNullValue: true)
  final String cityName;

  @JsonKey(required: true, disallowNullValue: true)
  final Units units;

  const SavedState(this.cityName, this.units);

  factory SavedState.fromJson(Map<String, dynamic> json) =>
      _$SavedStateFromJson(json);

  Map<String, dynamic> toJson() => _$SavedStateToJson(this);
}
