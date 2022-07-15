import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Please select a location with',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white)),
        const SizedBox(
          width: 5,
        ),
        const Icon(Icons.search),
      ],
    ));
  }
}
