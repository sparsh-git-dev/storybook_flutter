import 'package:flutter/material.dart';

class FirstNameTextFieldWidget extends StatefulWidget {
  const FirstNameTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<FirstNameTextFieldWidget> createState() =>
      _FirstNameTextFieldWidgetState();
}

class _FirstNameTextFieldWidgetState extends State<FirstNameTextFieldWidget> {
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: firstNameTextEditingController,
        decoration: const InputDecoration(
          focusColor: Colors.white,
          labelText: 'First name',
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.lightGreenAccent),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 4.0,
          )),
          hintText: 'First name',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }
}
