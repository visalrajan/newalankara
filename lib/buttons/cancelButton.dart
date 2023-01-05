import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final Color borderColor;
  void Function() buttonAction;

  CancelButton({
    required this.borderColor,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            "Cancel",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: buttonAction,
    );
  }
}
