
import 'package:alankara/models/customer_details_model.dart';
import 'package:alankara/models/mobilenumber_model.dart';
import 'package:alankara/screens/customer_details.dart';
import 'package:alankara/screens/mobilenumber.dart';
import 'package:alankara/screens/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MobileNumberController extends GetxController{


  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController mobile = TextEditingController();


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
    MobileNoModel details = MobileNoModel(
      mobileNumber: mobile.text,
    );
    await db.collection("userMobile").add(details.toMap());
  }

  clear() {
    mobile.clear();
  }

}