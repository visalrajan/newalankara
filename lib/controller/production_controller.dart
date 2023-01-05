

import 'package:alankara/buttons/dropdownYesorNo.dart';
import 'package:alankara/models/production_model.dart';
import 'package:alankara/screens/order_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductionController extends GetxController{

  final prd = Get.put(YesOrNo());

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController materialType = TextEditingController();
  TextEditingController dying = TextEditingController();
  TextEditingController cutting = TextEditingController();
  TextEditingController stitching = TextEditingController();
  TextEditingController embroidery = TextEditingController();
  TextEditingController remarks = TextEditingController();
  var loading = false.obs;



  ok()async{
    try {
      loading.value = true;
    await addProduction();
    await clear();
    Get.to(()=>OrderDetails(getNo: null,));
    loading.value =false;
  }catch(e){
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }


  addProduction() async{
    ProductionModel production = ProductionModel(
      // materialType: materialType.text,
      // dying: dying.text,
      // cutting: cutting.text,
      // stitching: stitching.text,
      // embroidery: embroidery.text,
      // remarks: remarks.text
    );


    await db.collection("user").doc().collection("orderDetails").doc().collection("production").add(production.toMap());
  }

  clear(){
    materialType.clear();
    dying.clear();
    cutting.clear();
    stitching.clear();
    embroidery.clear();
    remarks.clear();
  }

}