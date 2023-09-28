import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String selectedOption = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(
            'Option 1',
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio(
            value: 'Option 1',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Option 2',
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio(
            value: 'Option 2',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Option 3',
            style: TextStyle(color: Colors.white),
          ),
          leading: Radio(
            value: 'Option 3',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
