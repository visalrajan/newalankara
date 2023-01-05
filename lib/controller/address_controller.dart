
import 'package:alankara/models/address_model.dart';
import 'package:alankara/screens/customer_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController houseNo = TextEditingController();
  TextEditingController houseName = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController id = TextEditingController();
  var loading = false.obs;



  ok()async{
   try{
     loading.value = true;
     await addAddress();
     await clear();
     Get.to(()=>CustomerDetails());
     loading.value =false;
   }catch(e) {
     Get.snackbar("error", "$e");

     loading.value = false;
   }
  }


  addAddress() async{
    AddressModel address = AddressModel(
      houseNo: houseNo.text,
      houseName: houseName.text,
      area: area.text,
      landMark: landMark.text,
      district: district.text,
      pincode: pincode.text
    );

    await db.collection("user").doc().collection("customerDetails").doc().collection("address").add(address.toMap());
  }

  clear(){
    houseNo.clear();
    houseName.clear();
    area.clear();
    landMark.clear();
    district.clear();
    pincode.clear();
  }
}