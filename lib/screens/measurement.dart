import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/controller/measurement_controller.dart';
import 'package:alankara/screens/added_items.dart';
import 'package:alankara/widgets/textInput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Measurement extends StatelessWidget {
  final crtl = Get.put(MeasurementController());

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

  clear() {
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
    thignLengthRound.clear();
    kneeLengthRound.clear();
    calfLengthRound.clear();
    ankleRound.clear();
  }


  @override
  Widget build(BuildContext context) {
    var space = SizedBox(
      height: 15,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Measurement",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              children: [
                TextInput(
                    measurementText: "Shoulder to Shoulder",
                    controller: shouldertoShoulder),
                space,
                TextInput(
                    measurementText: "Upper Chest",
                    controller: upperChest),
                space,
                TextInput(
                  measurementText: "Bust",
                  controller: bust,
                ),
                space,
                TextInput(
                  measurementText: "Below Bust Round",
                  controller: belowBustRound,
                ),
                space,
                TextInput(
                  measurementText: "Shape Round",
                  controller: shapeRound,
                ),
                space,
                TextInput(
                  measurementText: "Slit Round",
                  controller: slitRound,
                ),
                space,
                TextInput(
                  measurementText: "Waist Round",
                  controller: waistRound,
                ),
                space,
                TextInput(
                  measurementText: "Hip Round",
                  controller: hipRound,
                ),
                space,
                TextInput(
                  measurementText: "Armhole",
                  controller: armhole,
                ),
                space,
                TextInput(
                  measurementText: "Sleeve Length",
                  controller: sleeveLength,
                ),
                space,
                TextInput(
                  measurementText: "Sleeve Round",
                  controller: sleeveRound,
                ),
                space,
                TextInput(
                  measurementText: "Front Neck Drape",
                  controller: frontNeckDrape,
                ),
                space,
                TextInput(
                  measurementText: "Back Neck Drape",
                  controller: backNeckDrape,
                ),
                space,
                TextInput(
                  measurementText: "Neck Round",
                  controller: neckRound,
                ),
                space,
                TextInput(
                  measurementText: "Yoke Length",
                  controller: yokeLength,
                ),
                space,
                TextInput(
                  measurementText: "Bust Span",
                  controller: bustSpan,
                ),
                space,
                TextInput(
                  measurementText: "Bust Point Length",
                  controller: bustPointLength,
                ),
                space,
                TextInput(
                  measurementText: "Below Bust Length",
                  controller: belowBustLength,
                ),
                space,
                TextInput(
                  measurementText: "Shape Length",
                  controller: shapeLength,
                ),
                space,
                TextInput(
                  measurementText: "Waist Length",
                  controller: waistLength,
                ),
                space,
                TextInput(
                  measurementText: "Slit Length",
                  controller: slitLength,
                ),
                space,
                TextInput(
                  measurementText: "Hip Length",
                  controller: hipLength,
                ),
                space,
                TextInput(
                  measurementText: "Front Width",
                  controller: frontWidth,
                ),
                space,
                TextInput(
                  measurementText: "Back Width",
                  controller: backWidth,
                ),
                space,
                TextInput(
                  measurementText: "Full Length",
                  controller: fullLength,
                ),
                space,
                TextInput(
                  measurementText: "Botom / Skirt Length",
                  controller: bottomSkirtLength,
                ),
                space,
                TextInput(
                  measurementText: "Botom / Skirt Waist",
                  controller: bottomSkirtwaist,
                ),
                space,
                TextInput(
                  measurementText: "Thign Length / Round",
                  controller: thignLengthRound,
                ),
                space,
                TextInput(
                  measurementText: "Knee Length / Round",
                  controller: kneeLengthRound,
                ),
                space,
                TextInput(
                  measurementText: "Calf Length / Round",
                  controller: calfLengthRound,
                ),
                space,
                TextInput(
                  measurementText: "Ankle Round",
                  controller: ankleRound,
                ),
                space,
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OkButton(
                            borderColor: Colors.cyan,
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
                                millisecondsSinceEpoch.toString()).collection("orderDetails").
                                doc(DateTime.now().millisecondsSinceEpoch.toString()).set({
                                  "mobileNumber" : userMobile,
                                  "shouldertoShoulder": "${shouldertoShoulder.text.toString()}",
                                  "upperChest" : "${upperChest.text.toString()}",
                                  "bust" : "${bust.text.toString()}",
                                  "belowBustRound" : "${belowBustRound.text.toString()}",
                                  "shapeRound" : "${shapeRound.text.toString()}",
                                  "slitRound" : "${slitRound.text.toString()}",
                                  "waistRound" : "${waistRound.text.toString()}",
                                  "hipRound" : "${hipRound.text.toString()}",
                                  "armhole" : "${armhole.text.toString()}",
                                  "sleeveLength" : "${sleeveLength.text.toString()}",
                                  "sleeveRound" : "${sleeveRound.text.toString()}",
                                  "frontNeckDrape" : "${frontNeckDrape.text.toString()}",
                                  "backNeckDrape" : "${backNeckDrape.text.toString()}",
                                  "neckRound" : "${neckRound.text.toString()}",
                                  "yokeLength" : "${yokeLength.text.toString()}",
                                  "bustSpan" : "${bustSpan.text.toString()}",
                                  "bustPointLength" : "${bustPointLength.text.toString()}",
                                  "belowBustLength" : "${belowBustLength.text.toString()}",
                                  "shapeLength" : "${shapeLength.text.toString()}",
                                  "waistLength" : "${waistLength.text.toString()}",
                                  "slitLength" : "${slitLength.text.toString()}",
                                  "hipLength" : "${hipLength.text.toString()}",
                                  "frontWidth" : "${frontWidth.text.toString()}",
                                  "backWidth" : "${backWidth.text.toString()}",
                                  "fullLength" : "${fullLength.text.toString()}",
                                  "bottomSkirtLength" : "${bottomSkirtLength.text.toString()}",
                                  "bottomSkirtwaist" : "${bottomSkirtwaist.text.toString()}",
                                  "thignLengthRound" : "${thignLengthRound.text.toString()}",
                                  "kneeLengthRound" : "${kneeLengthRound.text.toString()}",
                                  "calfLengthRound" : "${calfLengthRound.text.toString()}",
                                  "ankleRound" : "${ankleRound.text.toString()}",

                                });

                                await clear();

                                // await Get.to(()=>AddedItems(response: [],));
                                await Navigator.pushReplacement( (context),
                                    MaterialPageRoute(builder: (context) => AddedItems(response: [],)));

                                loading.value=false;

                              }catch(e){
                                Get.snackbar("error", "$e");
                                loading.value=false;

                              }


                            }),
                        CancelButton(
                            borderColor: Colors.cyan, buttonAction: () {}),
                      ]),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
