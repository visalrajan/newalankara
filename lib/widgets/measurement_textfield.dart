import 'package:flutter/material.dart';

class MeasurementText extends StatelessWidget {
  final dynamic controller;

  MeasurementText({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan, width: 2),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan, width: 2)),
          labelText: "Measurement",
          labelStyle: TextStyle(color: Colors.cyan),
        ),
      ),
    );
  }
}
