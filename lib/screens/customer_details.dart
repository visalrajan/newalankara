import 'package:alankara/address_page/address_page.dart';
import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/controller/customer_details_controller.dart';
import 'package:alankara/screens/register.dart';
import 'package:alankara/widgets/textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final ctrl = Get.put(CustomerDetailsController());

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController customerName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController remarks = TextEditingController();
  var loading = false.obs;




  DateTime _dateTime = DateTime.now();
  final DateTime? date = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value!;
        buttonText =
            "${_dateTime.day.toString()}:${_dateTime.month.toString()}:${_dateTime.year.toString()}";
      });
    });
  }


  final DateTime? date1 = DateTime.now();

  var buttonText = "Date";


  clear(){
    customerName.clear();
    mobile.clear();
    remarks.clear();

  }

  @override
  Widget build(BuildContext context) {
    Widget height = const SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Details",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserTextField(
                    controller: customerName,
                    typeOfKeyboard: TextInputType.text,
                    color: Colors.red,
                    labelText: "Customer Name",
                    enableBorderWidth: 2,
                    focusWidth: 2,
                  ),
                  height,
                  UserTextField(
                    controller: mobile,
                    typeOfKeyboard: TextInputType.number,
                    color: Colors.red,
                    labelText: "Mobile Number",
                    enableBorderWidth: 2,
                    focusWidth: 2,
                  ),
                  height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange[400],
                          ),
                          child:  const Center(
                            child: Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddressPage()));
                        },
                      ),
                      InkWell(
                        onTap: _showDatePicker,
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal[400],
                          ),
                          child: Center(
                            child: Text(
                              buttonText,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height,
                  TextFormField(
                    controller: remarks,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 50,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.5),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.5),
                        borderSide: const BorderSide(color: Colors.red, width: 2),
                      ),
                      labelText: "Remarks",
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OkButton(
                              borderColor: Colors.red,
                              buttonAction: () async {

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
                                  }

                                  await db.collection("user").doc(DateTime.now().
                                  millisecondsSinceEpoch.toString()).collection("customerDetails").
                                  doc(DateTime.now().millisecondsSinceEpoch.toString()).set({
                                    "mobileNumber" : userMobile,
                                    "customerName": "${customerName.text.toString()}",
                                    "mobile" : "${mobile.text.toString()}",
                                    "remarks" : "${remarks.text.toString()}",
                                    "date" :  "${_dateTime.day.toString()}:${_dateTime.month.toString()}:${_dateTime.year.toString()}",

                                  });
                                  await clear();
                                  // Get.to(()=> Register());
                                 // await Navigator.pushReplacement( (context),
                                 //      MaterialPageRoute(builder: (context) => Register(usermbl: '',)));
                                 Navigator.pop(context);

                                  loading.value = false;

                                }catch(e){
                                  Get.snackbar("error", "$e");
                                  loading.value=false;

                                }




                              }),
                          CancelButton(
                              borderColor: Colors.red,
                              buttonAction: () {
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
}
