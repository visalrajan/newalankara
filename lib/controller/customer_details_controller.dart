
import 'package:alankara/models/customer_details_model.dart';
import 'package:alankara/screens/customer_details.dart';
import 'package:alankara/screens/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomerDetailsController extends GetxController{

  final custDate = Get.put(CustomerDetails());


  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController customerName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController remarks = TextEditingController();


  var loading = false.obs;


  ok()async{
    try{
      loading.value = true;
      await addDetails();
      await clear();
      Get.to(()=> Register(usermbl: '',));
      loading.value = false;
    }catch(e) {
      Get.snackbar("error", "$e");

      loading.value =false;
    }

  }

  
  addDetails()async{
    CustomerDetailsModel details = CustomerDetailsModel(
      customerName: customerName.text,
      mobile: mobile.text,

      remarks: remarks.text,
    );
    await db.collection("user").doc().collection("customerDetails").add(details.toMap());
  }

  clear() {
    customerName.clear();
    mobile.clear();
    remarks.clear();
  }
  
}