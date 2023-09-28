import 'package:flutter/material.dart';

class LastNameTextFieldWidget extends StatefulWidget {
  const LastNameTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<LastNameTextFieldWidget> createState() =>
      _LastNameTextFieldWidgetState();
}

class _LastNameTextFieldWidgetState extends State<LastNameTextFieldWidget> {
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: lastNameTextEditingController,
        decoration: const InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.lightGreenAccent),
          focusColor: Colors.white,
          labelText: 'Last name',
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
            width: 4.0,
          )),
          hintText: 'Last name',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }
}
