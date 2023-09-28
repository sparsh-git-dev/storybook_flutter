import 'package:flutter/material.dart';

/// The `CustomCheckboxListTile` class is a custom implementation of a checkbox list tile in Dart,
/// allowing for customization of the checkbox's value, onChanged callback, label, and color.

class CustomCheckboxListTile extends StatefulWidget {
  @override
  _CustomCheckboxListTileState createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        Text(
          "check box",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 10),
        Checkbox(
          value: value,
          onChanged: (newval) {
            setState(() {
              value = newval!;
            });
          },
        ),
      ],
    );
  }
}
