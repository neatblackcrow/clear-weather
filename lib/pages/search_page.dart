import 'package:clear_weather/components/labeled_radio.dart';
import 'package:clear_weather/cubits/setting_cubit.dart';
import 'package:clear_weather/cubits/setting_state.dart';
import 'package:clear_weather/cubits/weather_cubit.dart';
import 'package:clear_weather/cubits/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  final String cityName;
  final Units units;
  final BuildContext mainContext;
  const SearchPage(this.mainContext,
      {Key? key, required this.cityName, required this.units})
      : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _cityName;
  late Units _units;

  @override
  void initState() {
    super.initState();
    _cityName = TextEditingController(text: widget.cityName);
    _units = widget.units;
  }

  @override
  void dispose() {
    _cityName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _cityName,
                      decoration: const InputDecoration(
                          hintText: 'Enter a city name here',
                          prefixIcon: Icon(Icons.search)),
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    LabeledRadio<Units>(
                        label: 'Celcius',
                        value: Units.metric,
                        groupValue: _units,
                        onChanged: (Units u) => setState(() => _units = u)),
                    LabeledRadio<Units>(
                        label: 'Fahrenheit',
                        value: Units.imperial,
                        groupValue: _units,
                        onChanged: (Units u) => setState(() => _units = u)),
                    LabeledRadio<Units>(
                        label: 'Kelvin',
                        value: Units.standard,
                        groupValue: _units,
                        onChanged: (Units u) => setState(() => _units = u)),
                  ]),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  BlocListener<WeatherCubit, WeatherState>(
                    bloc: BlocProvider.of<WeatherCubit>(widget.mainContext),
                    listener: (context, state) {
                      switch (state.stateType) {
                        case EWeatherState.success:
                          BlocProvider.of<SettingCubit>(widget.mainContext)
                              .saveSetting(_cityName.text, _units);
                          Navigator.of(context).pop();
                          break;
                        case EWeatherState.notFound:
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Location not found.'),
                          ));
                          break;
                        case EWeatherState.fail:
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text('Please check your internet connection.'),
                          ));
                          break;
                      }
                    },
                    child: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _cityName,
                        builder: (context, value, child) => ElevatedButton(
                            onPressed: (value.text.isNotEmpty)
                                ? () => BlocProvider.of<WeatherCubit>(
                                        widget.mainContext)
                                    .fetchCurrentWeather(_cityName.text, _units)
                                : null,
                            child: const Text('Save'))),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
