import 'dart:convert';
import 'dart:io';
import 'package:clear_weather/models/current_weather/current_weather.dart';
import 'package:http/http.dart';
import 'package:clear_weather/weather_client.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherClient _wc = WeatherClient();

  WeatherCubit()
      : super(const NotFoundState(cityName: '', units: Units.metric));

  Future<void> fetchCurrentWeather(String cityName, Units units) async {
    try {
      Response res = await _wc.fetchCurrentWeather(cityName, units.name);
      Map<String, dynamic> body = jsonDecode(res.body);
      if (body['cod'] == 200) {
        emit(SuccessState(
            data: CurrentWeather.fromJson(body),
            cityName: cityName,
            units: units));
      } else if (body['cod'] == '404') {
        emit(NotFoundState(cityName: cityName, units: units));
      } else if (body['cod'] == 401) {
        print('Invalid API key');
      }
    } on HttpException catch (_) {
      emit(FailState(cityName: cityName, units: units));
    } on SocketException catch (_) {
      emit(FailState(cityName: cityName, units: units));
    }
  }

  @override
  Future<void> close() async {
    _wc.close();
    super.close();
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'success') {
      return SuccessState.fromJson(json['state']);
    } else if (json['type'] == 'notfound') {
      return NotFoundState.fromJson(json['state']);
    } else if (json['type'] == 'fail') {
      return FailState.fromJson(json['state']);
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if (state is SuccessState) {
      return {'type': 'success', 'state': state.toJson()};
    } else if (state is NotFoundState) {
      return {'type': 'notfound', 'state': state.toJson()};
    } else if (state is FailState) {
      return {'type': 'fail', 'state': state.toJson()};
    } else {
      return null;
    }
  }
}
