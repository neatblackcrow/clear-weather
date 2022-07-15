// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'coord',
      'weather',
      'base',
      'main',
      'visibility',
      'wind',
      'clouds',
      'dt',
      'sys',
      'timezone',
      'id',
      'name',
      'cod'
    ],
    disallowNullValues: const [
      'coord',
      'weather',
      'base',
      'main',
      'visibility',
      'wind',
      'clouds',
      'rain',
      'snow',
      'dt',
      'sys',
      'timezone',
      'id',
      'name',
      'cod'
    ],
  );
  return CurrentWeather(
    coord: Coordinate.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    base: json['base'] as String,
    main: Main.fromJson(json['main'] as Map<String, dynamic>),
    visibility: json['visibility'] as int,
    wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
    clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    rain: json['rain'] == null
        ? null
        : Rain.fromJson(json['rain'] as Map<String, dynamic>),
    snow: json['snow'] == null
        ? null
        : Snow.fromJson(json['snow'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) {
  final val = <String, dynamic>{
    'coord': instance.coord.toJson(),
    'weather': instance.weather.map((e) => e.toJson()).toList(),
    'base': instance.base,
    'main': instance.main.toJson(),
    'visibility': instance.visibility,
    'wind': instance.wind.toJson(),
    'clouds': instance.clouds.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rain', instance.rain?.toJson());
  writeNotNull('snow', instance.snow?.toJson());
  val['dt'] = instance.dt;
  val['sys'] = instance.sys.toJson();
  val['timezone'] = instance.timezone;
  val['id'] = instance.id;
  val['name'] = instance.name;
  val['cod'] = instance.cod;
  return val;
}
