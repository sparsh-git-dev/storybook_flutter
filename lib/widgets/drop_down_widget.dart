import 'package:flutter/material.dart';

class dropDownWidget extends StatefulWidget {
  @override
  _dropDownWidgetState createState() => _dropDownWidgetState();
}

class _dropDownWidgetState extends State<dropDownWidget> {
  String selectedOption = 'Option 1';

  // List of options for the dropdown
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Selected Option: $selectedOption',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        DropdownButton<String>(
          focusColor: Colors.green,
          iconEnabledColor: Colors.white,
          value: selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
          },
          style: TextStyle(color: Colors.red),
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
