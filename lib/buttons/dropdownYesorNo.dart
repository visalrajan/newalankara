import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class YesOrNo extends StatefulWidget {
  @override
  State<YesOrNo> createState() => _YesOrNoState();
}

class _YesOrNoState extends State<YesOrNo> {

  FirebaseFirestore db = FirebaseFirestore.instance;

  final items = ["Yes", "No"];
  String? valueChoose;

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.5),
        border: Border.all(color: Colors.deepOrangeAccent),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: DropdownButton(
          underline: SizedBox(),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 35,
          hint: Text("Yes/No"),
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue as String?;
            });
          },
          items: items.map((valueItem) {
            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
          }).toList(),
        ),
      ),
    );
  }



}
