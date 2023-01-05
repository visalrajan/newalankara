import 'package:flutter/material.dart';

class ProductionButton extends StatelessWidget {
  final Color boxColor;
  final String buttonText;
  final void Function() buttonAction;

  ProductionButton({
    required this.boxColor,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.5),
          color: boxColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: buttonAction,
    );
  }
}
