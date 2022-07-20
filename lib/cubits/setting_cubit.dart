import 'package:clear_weather/cubits/setting_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:clear_weather/cubits/base_state.dart';

class SettingCubit extends HydratedCubit<SettingState> {
  SettingCubit() : super(SettingState.save(cityName: '', units: Units.metric));

  void saveSetting(String cityName, Units units) =>
      emit(SettingState.save(cityName: cityName, units: units));

  @override
  SettingState fromJson(Map<String, dynamic> json) {
    switch (ESettingState.values.enumFromString(json['type'])) {
      case ESettingState.saved:
        return SavedState.fromJson(json['state']);
    }
  }

  @override
  Map<String, dynamic> toJson(SettingState state) {
    switch (state.stateType) {
      case ESettingState.saved:
        return {
          'type': ESettingState.saved.name,
          'state': (state as SavedState).toJson()
        };
    }
  }
}
