import 'package:flutter/material.dart';

class MeasurementRow extends StatelessWidget {
  final String title;
  final double divider;

  MeasurementRow({
    required this.title,
    required this.divider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: divider,
        ),
        Container(
          width: 135,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(5.5),
              ),
              labelText: "Measurement",
              labelStyle: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.5),
          ),
        ),
      ]),
    );
  }
}
