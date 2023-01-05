import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/controller/address_controller.dart';
import 'package:alankara/screens/customer_details.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AddressPage extends StatelessWidget {
  final ctrl = Get.put(AddressController());



  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    TextEditingController houseNo = TextEditingController();
    TextEditingController houseName = TextEditingController();
    TextEditingController area = TextEditingController();
    TextEditingController landMark = TextEditingController();
    TextEditingController district = TextEditingController();
    TextEditingController pincode = TextEditingController();

    clear(){
      houseNo.clear();
      houseName.clear();
      area.clear();
      landMark.clear();
      district.clear();
      pincode.clear();
    }

    var loading = false.obs;



    Widget height = SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text(
          "Address",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                UserTextField(
                  controller: houseNo,
                  typeOfKeyboard: TextInputType.text,
                  color: Colors.orange,
                  labelText: "House No",
                  enableBorderWidth: 2,
                  focusWidth: 2,
                ),
                height,
                UserTextField(
                  controller: houseName,
                  typeOfKeyboard: TextInputType.text,
                  color: Colors.orange,
                  labelText: "House Name",
                  enableBorderWidth: 2,
                  focusWidth: 2,
                ),
                height,
                UserTextField(
                  controller: area,
                  typeOfKeyboard: TextInputType.text,
                  color: Colors.orange,
                  labelText: "Area",
                  enableBorderWidth: 2,
                  focusWidth: 2,
                ),
                height,
                UserTextField(
                  controller: landMark,
                  typeOfKeyboard: TextInputType.text,
                  color: Colors.orange,
                  labelText: "Land Mark",
                  enableBorderWidth: 2,
                  focusWidth: 2,
                ),
                height,
                UserTextField(
                  controller: district,
                  typeOfKeyboard: TextInputType.text,
                  color: Colors.orange,
                  labelText: "District",
                  enableBorderWidth: 2,
                  focusWidth: 2,
                ),
                height,
                UserTextField(
                  controller: pincode,
                  typeOfKeyboard: TextInputType.number,
                  color: Colors.orange,
                  labelText: "Pin Code",
                  enableBorderWidth: 2,
                  focusWidth: 2,
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    OkButton(
                        borderColor: Colors.orange,
                        buttonAction: () async {
                          try{
                            loading.value =true;
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

                            await db.collection("user").doc(DateTime.now().
                            millisecondsSinceEpoch.toString()).collection("customerDetails").
                            doc(DateTime.now().millisecondsSinceEpoch.toString()).set({
                              "mobileNumber" : userMobile,
                              "houseNo": "${houseNo.text.toString()}",
                              "houseName" : "${houseName.text.toString()}",
                              "area" : "${area.text.toString()}",
                              "landmark" : "${landMark.text.toString()}",
                              "district" : "${district.text.toString()}",
                              "pincode" : "${pincode.text.toString()}",
                            });
                            clear();



                            // await Get.to(()=>CustomerDetails());
                           await Navigator.pushReplacement( (context),
                                MaterialPageRoute(builder: (context) => CustomerDetails()));

                           // await Navigator.pushAndRemoveUntil(
                           //      (context),
                           //      MaterialPageRoute(builder: (context) => const CustomerDetails()),
                           //          (route) => false);


                            loading.value =false;


                          }catch(e){
                            Get.snackbar("error", "$e");
                            loading.value=false;

                          }



                      // await    ctrl.ok();
                        }),
                    CancelButton(
                        borderColor: Colors.orange,
                        buttonAction: () async{
                          Navigator.pop(context);
                        }),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
