import 'package:flutter/material.dart';

class CheckboxTile extends StatelessWidget {
  const CheckboxTile(
      {super.key,
      required this.onUpdateCheckbox,
      required this.name,
      required this.checkboxState});

  final bool checkboxState;
  final String name;
  final Function onUpdateCheckbox;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(name,
          style: TextStyle(
            decoration: checkboxState ? TextDecoration.lineThrough : null,
          )),
      value: checkboxState,
      onChanged: (newState) => onUpdateCheckbox(newState),
    );
  }
}
