import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/dropdownYesorNo.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/buttons/productionIcons.dart';
import 'package:alankara/controller/production_controller.dart';
import 'package:alankara/provider/list_provider.dart';
import 'package:alankara/screens/added_items.dart';
import 'package:alankara/screens/order_details.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Production extends StatefulWidget {
  @override
  State<Production> createState() => _ProductionState();
}

class _ProductionState extends State<Production> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController remarks = TextEditingController();
  final crtl = Get.put(ProductionController());

  final items = ["Customer Material", "In Store Material", "Out Sourcing"];
  final items1 = ["Yes", "No"];
  final items2 = ["Yes", "No"];
  final items3 = ["Yes", "No"];
  final items4 = ["Yes", "No"];
  String? valueChoose;
  String? valueChoose1;
  String? valueChoose2;
  String? valueChoose3;
  String? valueChoose4;

  Widget height = SizedBox(
    height: 20,
  );
  bool value = false;

  var loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListProvider>(
      create: (context) => ListProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Production",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Material:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 230,
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
                            hint: Text("Choose Material Type"),
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
                  // Container(
                  //   width: 150,
                  //   height: 50,
                  //   child: CheckboxListTile(
                  //       title: Text(
                  //         "Dying",
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       activeColor: Colors.teal,
                  //       checkColor: Colors.black,
                  //       controlAffinity: ListTileControlAffinity.trailing,
                  //       value: value,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           this.value = value!;
                  //         });
                  //       }),
                  // ),

                  // ProductionButton(
                  //   boxColor: Colors.greenAccent,
                  //   buttonText: "Dying",
                  //   buttonAction: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => Dying()));
                  //   },
                  // ),
                  // height,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       ProductionButton(
                  //         boxColor: Colors.deepOrangeAccent,
                  //         buttonText: "Cutting",
                  //         buttonAction: () {
                  //           Navigator.push(context,
                  //               MaterialPageRoute(builder: (context) => Cutting()));
                  //         },
                  //       ),
                  //       ProductionButton(
                  //         boxColor: Colors.amberAccent,
                  //         buttonText: "Embroidery",
                  //         buttonAction: () {
                  //           Navigator.push(context,
                  //               MaterialPageRoute(builder: (context) => Embroidery()));
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // height,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       ProductionButton(
                  //         boxColor: Colors.blue,
                  //         buttonText: "Stitching",
                  //         buttonAction: () {
                  //           Navigator.push(context,
                  //               MaterialPageRoute(builder: (context) => Stitching()));
                  //         },
                  //       ),
                  //       ProductionButton(
                  //         boxColor: Colors.green,
                  //         buttonText: "QC",
                  //         buttonAction: () {
                  //           Navigator.push(context,
                  //               MaterialPageRoute(builder: (context) => Finishing()));
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // height,

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductionIcons(
                          boxColor: Colors.greenAccent,
                          boxText: "Dying",
                        ),
                    Container(
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
                          value: valueChoose1,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose1 = newValue as String?;
                            });
                          },
                          items: items1.map((valueItem) {
                            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),
                  height,

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductionIcons(
                          boxColor: Colors.deepOrangeAccent,
                          boxText: "Cutting",
                        ),
                    Container(
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
                          value: valueChoose2,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose2 = newValue as String?;
                            });
                          },
                          items: items2.map((valueItem) {
                            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),

                  height,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductionIcons(
                          boxColor: Colors.blue,
                          boxText: "Stitching",
                        ),
                    Container(
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
                          value: valueChoose3,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose3 = newValue as String?;
                            });
                          },
                          items: items3.map((valueItem) {
                            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    )
                      ],
                    ),
                  ),
                  height,
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductionIcons(
                          boxColor: Colors.amberAccent,
                          boxText: "Embroidery",
                        ),
                    Container(
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
                          value: valueChoose4,
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose4 = newValue as String?;
                            });
                          },
                          items: items4.map((valueItem) {
                            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),
                  height,

                  UserTextField(
                    controller: remarks,
                    typeOfKeyboard: TextInputType.emailAddress,
                    color: Colors.deepOrangeAccent,
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
                  //     borderColor: Colors.amber,
                  //     buttonAction: () {},
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OkButton(
                              borderColor: Colors.amber,
                              buttonAction: ()  async{
                               try {
                                 loading.value=true;

                                 showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return const Center(
                                         child:  const CircularProgressIndicator(
                                           color: Colors.orangeAccent,
                                           strokeWidth: 4,
                                         ),
                                       );
                                     });

                                 SharedPreferences prefs =
                                 await SharedPreferences.getInstance();
                                 Object? userMobile = "";
                                 if (prefs.containsKey("mobileNumber")) {
                                   userMobile = prefs.get("mobileNumber");
                                 }


                                 await db.collection("user").doc(DateTime.now().millisecondsSinceEpoch.toString()).
                                 collection("orderDetails").doc(DateTime.now().millisecondsSinceEpoch.toString()).
                                 set({
                                   "mobileNumber" : userMobile,
                                   "materialType": "${valueChoose.toString()}",
                                   "dying": "${valueChoose1.toString()}",
                                   "cutting": "${valueChoose2.toString()}",
                                   "stitching": "${valueChoose3.toString()}",
                                   "embroidery": "${valueChoose4.toString()}",
                                   "remarks": "${remarks.text}",
                                 });
                                 Get.snackbar("status", "Submit Successful");
                                 await clear();

                                // await Get.to(() => AddedItems(response: [],));
                            await Navigator.pushReplacement( (context),
                                    MaterialPageRoute(builder: (context) => AddedItems(response: [],)));
                                loading.value=false;
                               }catch(e) {
                                 Get.snackbar("error", "$e");
                                 loading.value=false;
                               }



                              }),
                          CancelButton(
                              borderColor: Colors.amber,
                              buttonAction: () async{
                                Navigator.pop(context);
                              }),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  clear(){

    remarks.clear();
  }
}
