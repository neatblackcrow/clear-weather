import 'package:clear_weather/cubits/weather_cubit.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailPage extends StatelessWidget {
  final FailState state;
  const FailPage(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => BlocProvider.of<WeatherCubit>(context)
            .fetchCurrentWeather(state.cityName, state.units),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
                constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height -
                        Scaffold.of(context).appBarMaxHeight!.toDouble()),
                child: Center(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.wifi_off),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('No network connectivity.',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)),
                  ],
                )))));
  }
}
