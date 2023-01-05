import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/buttons/register_buttons.dart';
import 'package:alankara/homepage.dart';
import 'package:alankara/screens/customer_details.dart';
import 'package:alankara/screens/order_details.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatelessWidget {
  String usermbl;
  Register({required this.usermbl});

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore db = FirebaseFirestore.instance;
    TextEditingController customerNo = TextEditingController();
    var loading = false.obs;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Register",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    UserTextField(
                      controller: TextEditingController(),
                      typeOfKeyboard: TextInputType.number,
                      color: Colors.blue,
                      labelText: "Customer No",
                      enableBorderWidth: 2,
                      focusWidth: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: RegisterButtons(
                        borderColor: Colors.blue,
                        buttonText: "Customer Details",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerDetails()));
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      child: RegisterButtons(
                        borderColor: Colors.blue,
                        buttonText: "Order Details",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetails(getNo: null,)));
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),

                     Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OkButton(
                                borderColor: Colors.blue,
                                buttonAction: ()  async{
                                  try{
                                    loading.value = true;

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

                                      await db.collection("user").doc(DateTime.now().
                                      millisecondsSinceEpoch.toString()).collection("register").
                                      doc(DateTime.now().millisecondsSinceEpoch.toString()).set({
                                        "mobileNumber" : userMobile,
                                        "customerNo": "${customerNo.text.toString()}",

                                      });
                                      Get.snackbar("status", "Successfully Saved");
                                      await Get.to(()=>HomePage());
                                      loading.value = false;

                                    }
                                  }catch(e){

                                    Get.snackbar("error", "$e");

                                  }

                                }),
                            CancelButton(
                                borderColor: Colors.blue,
                                buttonAction: () {}),
                          ]),

                    // OkCancelButton(
                    //   borderColor: Colors.blue,
                    //   buttonAction: () {},
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
