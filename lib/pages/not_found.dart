import 'package:clear_weather/components/main_appbar.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppBar(),
        body: Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Please select a location with',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.search),
          ],
        )));
  }
}
