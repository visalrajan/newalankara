import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final dynamic controller;
  final String measurementText;

  TextInput({
    required this.measurementText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          measurementText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.cyan,
          ),
        ),

        // InkWell(
        //     child: Container(
        //       width: 120,
        //       height: 50,
        //       child: UserTextField(
        //         controller: TextEditingController(),
        //         typeOfKeyboard: TextInputType.number,
        //         color: Colors.cyan,
        //         labelText: "Measurement",
        //         enableBorderWidth: 2,
        //         focusWidth: 2,
        //       ),
        //     )
        // ),
        Container(
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
        ),
      ],
    );
  }
}
