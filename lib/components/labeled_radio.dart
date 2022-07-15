import 'package:flutter/material.dart';

class LabeledRadio<T> extends StatelessWidget {
  final String label;
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged; // void Function(T?) onChanged
  const LabeledRadio(
      {Key? key,
      required this.label,
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onChanged(value),
        child: Row(
          children: <Widget>[
            Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: (T? value) => onChanged(value!)),
            Text(label)
          ],
        ));
  }
}
