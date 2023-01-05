import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {

  final dynamic typeOfKeyboard;
  final Color color;
  final String labelText;
  final double enableBorderWidth;
  final double focusWidth;
  final dynamic controller;


  UserTextField ({
   required this.typeOfKeyboard,
    required this.color,
    required this.labelText,
    required this.enableBorderWidth,
    required this.focusWidth,
    required this.controller
});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        keyboardType: typeOfKeyboard,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: enableBorderWidth),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color, width: focusWidth),
            borderRadius: BorderRadius.circular(5.5),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
