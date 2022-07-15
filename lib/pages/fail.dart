import 'package:flutter/material.dart';

class FailPage extends StatelessWidget {
  const FailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    ));
  }
}
