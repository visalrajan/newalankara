import 'package:flutter/material.dart';

class RegisterButtons extends StatelessWidget {
  late Color borderColor;
  late String buttonText;


  RegisterButtons({
    required this.borderColor,
    required this.buttonText,

  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.5),
          border: Border.all(width: 2, color: borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),


    );
  }
}
