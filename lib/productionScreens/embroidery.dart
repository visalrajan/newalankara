import 'package:alankara/added_names_list/added_names_list.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/provider/list_provider.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Embroidery extends StatefulWidget {
  @override
  State<Embroidery> createState() => _EmbroideryState();
}

class _EmbroideryState extends State<Embroidery> {
  final items = ["Done", "Note Done"];
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    Widget height = SizedBox(
      height: 20,
    );
    return ChangeNotifierProvider<ListProvider>(
      create: (context) => ListProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Embroidery",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AddedNames(),
                height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Embroidery:",
                      style: TextStyle(
                        fontSize: 20,
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
                          hint: Text("Select Work Status"),
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
                height,
                UserTextField(
                  controller: TextEditingController,
                  typeOfKeyboard: TextInputType.text,
                  color: Colors.deepOrange,
                  labelText: "Remarks",
                  enableBorderWidth: 1,
                  focusWidth: 1,
                ),
                SizedBox(
                  height: 70,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 25, right: 25),
                //   child: OkCancelButton(
                //     borderColor: Colors.deepOrangeAccent,
                //     buttonAction: () {},
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
