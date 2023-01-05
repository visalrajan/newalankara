import 'package:flutter/material.dart';

class ProductionIcons extends StatelessWidget {
  late final Color boxColor;
  late final String boxText;

  ProductionIcons({
    required this.boxColor,
    required this.boxText,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
        width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.5),
        color: boxColor,
      ),
      child: Center(
        child: Text(
          boxText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
