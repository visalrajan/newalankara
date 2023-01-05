import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/controller/datacontroller.dart';
import 'package:alankara/controller/mobileNumber_controller.dart';
import 'package:alankara/screens/register.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  // CollectionReference firebaseFirestore =
  //     FirebaseFirestore.instance.collection("user").doc().collection("id");

  final ctrl = Get.put(MobileNumberController());
  TextEditingController oldNumber = TextEditingController();


  QuerySnapshot? snapshotData;
  bool isExecuted = false;


  @override
  Widget build(BuildContext context) {

    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData!.docs.length,
        itemBuilder: (BuildContext context, int index) {

          String phoneNumber =  snapshotData!.docs[index]["mobileNumber"];

          return Column(
            children: [
              InkWell(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.redAccent[100],
                  ),
                  child: Center(
                    child: Text(
                      snapshotData!.docs[index]["mobileNumber"],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register(usermbl: phoneNumber,)));
                },
              ),
            ],
          );
        },
      );
    }

    var spacer = SizedBox(
      height: 20,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "customer",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Old Customer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  spacer,

                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          controller: oldNumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.redAccent, width: 2),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.redAccent, width: 2),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            labelText: "Old Cutomer Mobile No",
                            labelStyle: TextStyle(
                              color: Colors.redAccent,
                            ),
                            // suffix: GetBuilder<DataController>(
                            //   init: DataController(),
                            //   builder: (val) {
                            //     return IconButton(
                            //       icon: Icon(Icons.search,
                            //           size: 35, color: Colors.redAccent),
                            //       onPressed: () {
                            //         val.queryData(oldNumber.text).then((value) {
                            //           snapshotData = value;
                            //           setState(() {
                            //             isExecuted = true;
                            //           });
                            //         });
                            //       },
                            //     );
                            //   },
                            // ),
                          ),
                        ),
                      ),
                      GetBuilder<DataController>(
                        init: DataController(),
                        builder: (val) {
                          return IconButton(
                            icon: Icon(Icons.search,
                                size: 45, color: Colors.redAccent),
                            onPressed: () {

                              val.queryData(oldNumber.text).then((value) {
                                snapshotData = value;
                                setState(() {
                                  isExecuted = true;
                                });
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  spacer,
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: isExecuted
                        ? searchedData()
                        : Container(
                            // child: Center(
                            //   child: Text(
                            //     "search previous customer",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 25
                            //     ),
                            //   ),
                            // ),
                          ),

                  ),
                  Text(
                    "New Customer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  spacer,
                  UserTextField(
                    typeOfKeyboard: TextInputType.number,
                    color: Colors.redAccent,
                    labelText: "Mobile Number",
                    enableBorderWidth: 2,
                    focusWidth: 2,
                    controller: ctrl.mobile,
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OkButton(
                              borderColor: Colors.red,
                              buttonAction: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const Center(
                                        child: const CircularProgressIndicator(
                                          color: Colors.orangeAccent,
                                          strokeWidth: 4,
                                        ),
                                      );
                                    });
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(
                                    "mobileNumber", ctrl.mobile.text);

                                await ctrl.ok();
                              }),
                          CancelButton(
                              borderColor: Colors.red, buttonAction: () {}),
                        ]),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
