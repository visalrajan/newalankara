import 'package:flutter/material.dart';

class Dying extends StatefulWidget {


  @override
  State<Dying> createState() => _DyingState();
}

class _DyingState extends State<Dying> {

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Dying",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 15, left: 60, right: 80),
        child: Container(
          child: Column(
            children: [
              CheckboxListTile(
                  title: Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  activeColor: Colors.teal,
                  checkColor: Colors.black,
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  }),

              CheckboxListTile(
                  title: Text(
                    "No",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  activeColor: Colors.teal,
                  checkColor: Colors.black,
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
