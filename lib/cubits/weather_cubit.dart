import 'dart:convert';
import 'dart:io';
import 'package:clear_weather/cubits/setting_state.dart';
import 'package:clear_weather/models/current_weather/current_weather.dart';
import 'package:http/http.dart';
import 'package:clear_weather/weather_client.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:clear_weather/cubits/base_state.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherClient _wc = WeatherClient();

  WeatherCubit() : super(WeatherState.notFound);

  Future<void> fetchCurrentWeather(String cityName, Units units) async {
    try {
      Response res = await _wc.fetchCurrentWeather(cityName, units.name);
      switch (res.statusCode) {
        case 200:
          CurrentWeather cw = CurrentWeather.fromJson(jsonDecode(res.body));
          emit(WeatherState.success(
              locationName: cw.name,
              weather: cw.weather[0].main,
              weatherDescription: cw.weather[0].description,
              iconCode: cw.weather[0].icon,
              currentTemp: cw.main.temp,
              feelsLike: cw.main.feelsLike,
              minTemp: cw.main.tempMin,
              maxTemp: cw.main.tempMax,
              humidity: cw.main.humidity,
              windSpeed: cw.wind.speed));
          break;
        case 404:
          emit(WeatherState.notFound);
          break;
        case 401:
          print('Invalid API key');
          break;
      }
    } on HttpException catch (_) {
      emit(WeatherState.fail);
    } on SocketException catch (_) {
      emit(WeatherState.fail);
    }
  }

  @override
  Future<void> close() async {
    _wc.close();
    super.close();
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) {
    switch (EWeatherState.values.enumFromString(json['type'])) {
      case EWeatherState.success:
        return SuccessState.fromJson(json['state']);
      case EWeatherState.notFound:
        return WeatherState.notFound;
      case EWeatherState.fail:
        return WeatherState.fail;
    }
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) {
    switch (state.stateType) {
      case EWeatherState.success:
        return {
          'type': EWeatherState.success.name,
          'state': (state as SuccessState).toJson()
        };
      case EWeatherState.notFound:
        return {'type': EWeatherState.notFound.name};
      case EWeatherState.fail:
        return {'type': EWeatherState.fail.name};
    }
  }
}
