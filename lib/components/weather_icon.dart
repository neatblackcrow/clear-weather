import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  const WeatherIcon({Key? key, required this.iconCode}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      {
        '01d': Image.asset(
          'assets/images/clear_sky_day.png',
          width: 128,
          height: 128,
        ),
        '01n': Image.asset(
          'assets/images/clear_sky_night.png',
          width: 128,
          height: 128,
        ),
        '02d': Image.asset(
          'assets/images/few_clouds_day.png',
          width: 128,
          height: 128,
        ),
        '02n': Image.asset(
          'assets/images/few_clouds_night.png',
          width: 128,
          height: 128,
        ),
        '03d': Image.asset(
          'assets/images/scattered_clouds.png',
          width: 128,
          height: 128,
        ),
        '03n': Image.asset(
          'assets/images/scattered_clouds.png',
          width: 128,
          height: 128,
        ),
        '04d': Image.asset(
          'assets/images/broken_clouds.png',
          width: 128,
          height: 128,
        ),
        '04n': Image.asset(
          'assets/images/broken_clouds.png',
          width: 128,
          height: 128,
        ),
        '09d': Image.asset(
          'assets/images/shower_rain.png',
          width: 128,
          height: 128,
        ),
        '09n': Image.asset(
          'assets/images/shower_rain.png',
          width: 128,
          height: 128,
        ),
        '10d': Image.asset(
          'assets/images/rain_day.png',
          width: 128,
          height: 128,
        ),
        '10n': Image.asset(
          'assets/images/rain_night.png',
          width: 128,
          height: 128,
        ),
        '11d': Image.asset(
          'assets/images/thunderstorm_day.png',
          width: 128,
          height: 128,
        ),
        '11n': Image.asset(
          'assets/images/thunderstorm_night.png',
          width: 128,
          height: 128,
        ),
        '13d': Image.asset(
          'assets/images/snow_day.png',
          width: 128,
          height: 128,
        ),
        '13n': Image.asset(
          'assets/images/snow_night.png',
          width: 128,
          height: 128,
        ),
        '50d': Image.asset(
          'assets/images/mist.png',
          width: 128,
          height: 128,
        ),
        '50n': Image.asset(
          'assets/images/mist.png',
          width: 128,
          height: 128,
        ),
      }[iconCode] ??
      Image.asset('assets/images/clear_sky_day.png');
}
