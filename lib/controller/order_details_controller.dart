

import 'package:alankara/models/order_details_model.dart';
import 'package:alankara/screens/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderDetailsController extends GetxController{
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController itemName = TextEditingController();
  TextEditingController priceEstimate = TextEditingController();
  TextEditingController advance = TextEditingController();
  TextEditingController balance = TextEditingController();
  TextEditingController finalPrice = TextEditingController();
  TextEditingController designerName = TextEditingController();
  TextEditingController invoiceNo = TextEditingController();
  TextEditingController orderFormNo = TextEditingController();
  var loading = false.obs;



  ok()async{
    try{
      loading.value = true;
      await addOrder();
      await clear();
      Get.to(()=>Register(usermbl: '',));
      loading.value = false;
    }catch(e){
      Get.snackbar("error", "$e");

      loading.value = false;
    }
  }


  addOrder()async{
    OrderDetailsModel order = OrderDetailsModel(
      itemName: itemName.text,
      priceEstimate: int.parse(priceEstimate.text),
      advance: int.parse(advance.text),
      balance: int.parse(advance.text),
      finalPrice: int.parse(finalPrice.text),
      designerName: designerName.text,
      invoiceNo: invoiceNo.text,
      orderFormNo: orderFormNo.text,

    );
    await db.collection("user").doc().collection("orderDetails").add(order.toMap());
  }

  clear(){
    itemName.clear();
    priceEstimate.clear();
    advance.clear();
    balance.clear();
    finalPrice.clear();
    designerName.clear();
    invoiceNo.clear();
    orderFormNo.clear();
  }


}