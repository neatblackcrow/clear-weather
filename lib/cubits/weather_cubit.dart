import 'dart:convert';
import 'dart:io';
import 'package:clear_weather/cubits/setting_state.dart';
import 'package:clear_weather/models/current_weather/current_weather.dart';
import 'package:http/http.dart';
import 'package:clear_weather/weather_client.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:clear_weather/cubits/base_state.dart';
import 'package:clear_weather/logger.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherClient _wc = WeatherClient();

  WeatherCubit() : super(WeatherState.notFound);

  Future<void> fetchCurrentWeather(String cityName, Units units) async {
    try {
      Response res = await _wc.fetchCurrentWeather(cityName, units.name);
      switch (res.statusCode) {
        case 200:
          CurrentWeather cw = CurrentWeather.fromJson(jsonDecode(res.body));
          WeatherState st = WeatherState.success(
              locationName: cw.name,
              weather: cw.weather[0].main,
              weatherDescription: cw.weather[0].description,
              iconCode: cw.weather[0].icon,
              currentTemp: cw.main.temp,
              feelsLike: cw.main.feelsLike,
              minTemp: cw.main.tempMin,
              maxTemp: cw.main.tempMax,
              humidity: cw.main.humidity,
              windSpeed: cw.wind.speed,
              lastUpdated: HttpDate.parse(res.headers.entries
                      .singleWhere((element) => element.key == 'date')
                      .value)
                  .toLocal(),
              theme: _currentTheme(
                  cw.weather[0].main,
                  DateTime.fromMillisecondsSinceEpoch(cw.dt + cw.timezone,
                      isUtc: true),
                  DateTime.fromMillisecondsSinceEpoch(cw.sys.sunset,
                      isUtc: true)));
          emit(st);
          logger.i('Weather cubit current state is $st');
          logger.v((st as SuccessState).toJson());
          break;

        case 404:
          emit(WeatherState.notFound);
          logger.i('Location not found.');
          break;

        case 401:
          logger.e('Invalid API key.');
          break;
      }
    } on HttpException catch (ex) {
      emit(WeatherState.fail);
      logger.e(ex.message, ex);
    } on SocketException catch (ex) {
      emit(WeatherState.fail);
      logger.e(ex.message, ex);
    }
  }

  ThemePreset _currentTheme(
          String mainWeather, DateTime currentTime, DateTime sunset) =>
      (currentTime.isBefore(sunset))
          ? {
                'Clear': ThemePreset.clear,
                'Clouds': ThemePreset.clear,
                'Thunderstorm': ThemePreset.rain,
                'Drizzle': ThemePreset.rain,
                'Rain': ThemePreset.rain,
                'Snow': ThemePreset.rain,
                'Mist': ThemePreset.rain,
                'Smoke': ThemePreset.rain,
                'Haze': ThemePreset.rain,
                'Dust': ThemePreset.rain,
                'Fog': ThemePreset.rain,
                'Sand': ThemePreset.rain,
                'Ash': ThemePreset.rain,
                'Squall': ThemePreset.rain,
                'Tornado': ThemePreset.rain
              }[mainWeather] ??
              ThemePreset.clear
          : ThemePreset.night;

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
