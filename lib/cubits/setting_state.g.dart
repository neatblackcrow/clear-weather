// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedState _$SavedStateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['cityName', 'units'],
    disallowNullValues: const ['cityName', 'units'],
  );
  return SavedState(
    json['cityName'] as String,
    $enumDecode(_$UnitsEnumMap, json['units']),
  );
}

Map<String, dynamic> _$SavedStateToJson(SavedState instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'units': _$UnitsEnumMap[instance.units],
    };

const _$UnitsEnumMap = {
  Units.standard: 'standard',
  Units.metric: 'metric',
  Units.imperial: 'imperial',
};
