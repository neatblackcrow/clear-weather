import 'package:clear_weather/cubits/setting_cubit.dart';
import 'package:clear_weather/cubits/setting_state.dart';
import 'package:clear_weather/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      AppBar(title: const Text('Clear weather'), actions: <Widget>[
        BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) => IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'location',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SearchPage(context,
                        cityName: (state as SavedState).cityName,
                        units: state.units)))))
      ]);

  @override
  Size get preferredSize => AppBar().preferredSize;
}
