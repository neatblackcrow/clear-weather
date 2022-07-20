import 'package:clear_weather/components/weather_icon.dart';
import 'package:clear_weather/cubits/setting_cubit.dart';
import 'package:clear_weather/cubits/setting_state.dart';
import 'package:clear_weather/cubits/weather_cubit.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPage extends StatelessWidget {
  final SuccessState state;
  const SuccessPage(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
        builder: (context, settingState) => RefreshIndicator(
            onRefresh: () => BlocProvider.of<WeatherCubit>(context)
                .fetchCurrentWeather(
                    (settingState as SavedState).cityName, settingState.units),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        height: MediaQuery.of(context).size.height -
                            Scaffold.of(context).appBarMaxHeight!.toDouble()),
                    child: Column(children: <Widget>[
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
                              state.locationName,
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
                              '${state.weather} : ${state.weatherDescription}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                WeatherIcon(iconCode: state.iconCode),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '${state.currentTemp}°',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      'Feels like ${state.feelsLike}°',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      'H ${state.maxTemp}° / L ${state.minTemp}°',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        '${state.humidity} %',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
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
                                        '${state.windSpeed} ${((settingState as SavedState).units == Units.metric || settingState.units == Units.standard) ? 'm/s' : 'mph'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ])))));
  }
}
