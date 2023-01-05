

import 'package:alankara/models/measurement_model.dart';
import 'package:alankara/screens/order_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeasurementController extends GetxController{

  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController shouldertoShoulder = TextEditingController();
  TextEditingController upperChest = TextEditingController();
  TextEditingController bust = TextEditingController();
  TextEditingController belowBustRound = TextEditingController();
  TextEditingController shapeRound = TextEditingController();
  TextEditingController slitRound = TextEditingController();
  TextEditingController waistRound = TextEditingController();
  TextEditingController hipRound = TextEditingController();
  TextEditingController armhole = TextEditingController();
  TextEditingController sleeveLength = TextEditingController();
  TextEditingController sleeveRound = TextEditingController();
  TextEditingController frontNeckDrape = TextEditingController();
  TextEditingController backNeckDrape = TextEditingController();
  TextEditingController neckRound = TextEditingController();
  TextEditingController yokeLength = TextEditingController();
  TextEditingController bustSpan = TextEditingController();
  TextEditingController bustPointLength  = TextEditingController();
  TextEditingController belowBustLength = TextEditingController();
  TextEditingController shapeLength = TextEditingController();
  TextEditingController waistLength = TextEditingController();
  TextEditingController slitLength = TextEditingController();
  TextEditingController hipLength = TextEditingController();
  TextEditingController frontWidth = TextEditingController();
  TextEditingController backWidth = TextEditingController();
  TextEditingController fullLength = TextEditingController();
  TextEditingController bottomSkirtLength = TextEditingController();
  TextEditingController bottomSkirtwaist = TextEditingController();
  TextEditingController thignLengthRound = TextEditingController();
  TextEditingController kneeLengthRound = TextEditingController();
  TextEditingController calfLengthRound = TextEditingController();
  TextEditingController ankleRound = TextEditingController();
  var loading = false.obs;



  ok()async{
    try{
      loading.value = true;
     await addMeasurement();
      await clear();
     Get.to(()=>OrderDetails(getNo: null,));
      loading.value = false;
    }catch(e){
      Get.snackbar("error", "$e");

      loading.value = false;
    }
  }




  addMeasurement()async{
    MeasurementModel measurement = MeasurementModel(
        shouldertoShoulder: int.parse(shouldertoShoulder.text),
        upperChest: int.parse(upperChest.text),
        bust: int.parse(bust.text),
        belowBustRound: int.parse(belowBustRound.text),
        shapeRound: int.parse(shapeRound.text),
        slitRound: int.parse(slitRound.text),
        waistRound: int.parse(waistRound.text),
        hipRound: int.parse(hipRound.text),
        armhole: int.parse(armhole.text),
        sleeveLength: int.parse(sleeveLength.text),
        sleeveRound: int.parse(sleeveRound.text),
        frontNeckDrape: int.parse(frontNeckDrape.text),
        backNeckDrape: int.parse(backNeckDrape.text),
        neckRound: int.parse(neckRound.text),
        yokeLength: int.parse(yokeLength.text),
        bustSpan: int.parse(bustSpan.text),
        bustPointLength: int.parse(bustPointLength.text),
        belowBustLength: int.parse(belowBustLength.text),
        shapeLength: int.parse(shapeLength.text),
        waistLength: int.parse(waistLength.text),
        slitLength: int.parse(slitLength.text),
        hipLength: int.parse(hipLength.text),
        frontWidth: int.parse(frontWidth.text),
        backWidth: int.parse(backWidth.text),
        fullLength: int.parse(fullLength.text),
        bottomSkirtLength: int.parse(bottomSkirtLength.text),
        bottomSkirtwaist: int.parse(bottomSkirtwaist.text),
        thignLengthRound: int.parse(thignLengthRound.text),
        kneeLengthRound: int.parse(kneeLengthRound.text),
        calfLengthRound: int.parse(calfLengthRound.text),
        ankleRound: int.parse(ankleRound.text),
    );
    await db.collection("user").doc().collection("orderDetails").doc().collection("measurement").add(measurement.toMap());
  }

  clear(){
    shouldertoShoulder.clear();
    upperChest.clear();
    bust.clear();
    belowBustRound.clear();
    shapeRound.clear();
    slitRound.clear();
    waistRound.clear();
    hipRound.clear();
    armhole.clear();
    sleeveLength.clear();
    sleeveRound.clear();
    frontNeckDrape.clear();
    backNeckDrape.clear();
    neckRound.clear();
    yokeLength.clear();
    bustSpan.clear();
    bustPointLength.clear();
    belowBustLength.clear();
    shapeLength.clear();
    waistLength.clear();
    slitLength.clear();
    hipLength.clear();
    frontWidth.clear();
    backWidth.clear();
    fullLength.clear();
    bottomSkirtLength.clear();
    bottomSkirtwaist.clear();
    thignLengthRound.clear();
    kneeLengthRound.clear();
    calfLengthRound.clear();
    ankleRound.clear();
  }

}