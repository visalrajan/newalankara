import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:flutter/material.dart';

class Cutting extends StatefulWidget {


  @override
  State<Cutting> createState() => _CuttingState();
}

class _CuttingState extends State<Cutting> {

  final items = ["Cutting Done", "Cutting Not Done"];
  String? valueChoose;

  Widget height = SizedBox(
    height: 20,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cutting",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              child: Column(
                children: [

                  UserTextField(
                    controller: TextEditingController,
                      typeOfKeyboard: TextInputType.name,
                      color: Colors.deepOrangeAccent,
                      labelText: "Master Name",
                    enableBorderWidth: 1,
                    focusWidth: 1,
                  ),
                  height,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Remarks",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 190,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          border: Border.all(color: Colors.deepOrangeAccent),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButton(
                            underline: SizedBox(),
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 35,
                            hint: Text("Remarks",
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                            ),),
                            value: valueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                valueChoose = newValue as String?;
                              });
                            },
                            items: items.map((valueItem) {
                              return DropdownMenuItem(
                                  value: valueItem, child: Text(valueItem));
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time Taken",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 190,
                        child: UserTextField(
                          controller: TextEditingController,
                          typeOfKeyboard: TextInputType.emailAddress,
                          labelText: "Time Taken",
                          color: Colors.deepOrangeAccent,
                          enableBorderWidth: 1,
                          focusWidth: 1,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 150,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 25, right: 25),
                  //   child: OkCancelButton(
                  //       borderColor: Colors.deepOrangeAccent,
                  //     buttonAction: () {},
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
