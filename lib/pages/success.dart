import 'package:clear_weather/components/weather_icon.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final SuccessState state;
  const SuccessPage(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Column(children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ImageIcon(
              AssetImage('assets/images/location_pin.png'),
              size: 16,
              color: Colors.white,
            ),
            Text(
              state.data.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${state.data.weather[0].main} : ${state.data.weather[0].description}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ]),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            WeatherIcon(iconCode: state.data.weather[0].icon),
            Column(
              children: <Widget>[
                Text(
                  '${state.data.main.temp}°',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'Feels like ${state.data.main.feelsLike}°',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'H ${state.data.main.tempMax}° / L ${state.data.main.tempMin}°',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/humidity.png',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  '${state.data.main.humidity} %',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/windy.png',
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  (state.units == Units.metric)
                      ? '${state.data.wind.speed} m/s'
                      : (state.units == Units.standard)
                          ? '${state.data.wind.speed} m/s'
                          : '${state.data.wind.speed} mph',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
