import 'package:clear_weather/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'cubits/weather_cubit.dart';
import 'cubits/weather_state.dart';
import 'pages/fail.dart';
import 'pages/not_found.dart';
import 'pages/success.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clear weather',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white)),
      home: BlocProvider(
        create: (_) => WeatherCubit(),
        child: const WeatherPage(),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  Widget _selectPageByState(WeatherState state) {
    if (state is SuccessState) {
      return SuccessPage(state);
    } else if (state is NotFoundState) {
      return const NotFoundPage();
    } else {
      return const FailPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Clear weather'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'location',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SearchPage(context,
                        cityName: state.cityName, units: state.units))))
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () => BlocProvider.of<WeatherCubit>(context)
                .fetchCurrentWeather(state.cityName, state.units),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: _selectPageByState(state),
            )),
      );
    });
  }
}
