// import 'package:alankara/screens/order_details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AddedItems extends StatelessWidget {
//   const AddedItems({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Items",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 17,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: InkWell(
//             child: Container(
//               height: 50,
//               width: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.5),
//                 color: Colors.grey,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12.withOpacity(0.4),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(5, 7),
//                     ),
//                   ]),
//               child: Center(
//                 child: Text("Add Items",style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),),
//               ),
//               ),
//             onTap: (){
//               Get.to(()=> OrderDetails());
//             },
//             ),
//           ),
//         ),
//
//     );
//   }
// }

import 'dart:io';

import 'package:alankara/buttons/cancelButton.dart';
import 'package:alankara/buttons/okButton.dart';
import 'package:alankara/controller/order_details_controller.dart';
import 'package:alankara/screens/displayImage.dart';
import 'package:alankara/screens/measurement.dart';
import 'package:alankara/screens/order_details.dart';
import 'package:alankara/screens/production.dart';
import 'package:alankara/screens/register.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider_android/path_provider_android.dart';

class AddedItems extends StatefulWidget {
  final List response;


  AddedItems({required this.response});

  @override
  _AddedItemsState createState() => _AddedItemsState();
}

class _AddedItemsState extends State<AddedItems> {
  final ctrl = Get.put(OrderDetailsController());

  // String? imageUrl;
  // UploadTask? uploadTask;


  List<String> downloadUrls = [];


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
  //
  // CollectionReference? imgRef;
  // firebase_storage.Reference? ref;


  clear() {
    itemName.clear();
    priceEstimate.clear();
    advance.clear();
    balance.clear();
    finalPrice.clear();
    designerName.clear();
    invoiceNo.clear();
    orderFormNo.clear();
  }


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
      });
    });
  }

  DateTime _dateTime1 = DateTime.now();
  final DateTime? date1 = DateTime.now();

  void _showDatePicker1() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime1 = value!;
      });
    });
  }

  final ImagePicker imgpicker = ImagePicker();


  // Future<String> uploadFile(File file) async{
  //   final metaData = SettableMetadata(contentType: "image/jpeg");
  //   final storageRef = FirebaseStorage.instance.ref();
  //   Reference ref = storageRef.child("pictures/${DateTime.now().millisecondsSinceEpoch}.jpg");
  //   final uploadTask = ref.putFile(file, metaData);
  //
  //   final taskSnapshot = await uploadTask.whenComplete(() => null);
  //   String url = await taskSnapshot.ref.getDownloadURL();
  //   return url;
  //
  // }

  // storeEntry(List<String> imageUrls) async{
  //   try{
  //     await FirebaseFirestore.instance.collection("imagesCollection").
  //     add({"image": imageUrls}).then((value) => null);
  //   }catch(e){
  //     Get.snackbar("error", "$e" );
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    var result = widget.response;




    Future uploadFile() async{

      //
      // for(var img in result){
      //   ref = firebase_storage.FirebaseStorage.instance.ref().
      // child("images/${Path.basename(img.path)}");
      //   await ref!.putFile(img).whenComplete(() async{
      //     await ref!.getDownloadURL().then((value) {
      //       imgRef!.add({"url": value});
      //     });
      //   });
      //
      // }
      try{
        loading.value = true;
        firebase_storage.UploadTask uploadTask;
        firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.
        ref().child("images");





        uploadTask = ref.putFile(File(result.toString()));
        await uploadTask.whenComplete(() => null);
        String imageUrl = await ref.getDownloadURL();
        print("upload imageurl" + imageUrl);
        loading.value = false;

      }catch(e) {
        Get.snackbar("error", "$e");
        loading.value = false;
      }


    }




    var space = SizedBox(
      height: 25,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Items",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Column(
              children: [
                TextFormField(
                  controller: itemName,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.person,
                      //   color: Colors.red,
                      // ),
                      labelText: "Item Name",
                      labelStyle: TextStyle(
                        color: Colors.red,
                      )),
                ),
                space,

                InkWell(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                        child: Text(
                          "Upload Images",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 70,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DisplayImage()));
                                          },
                                          icon: Icon(
                                            Icons.camera,
                                            size: 40,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Camera",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () async {
                                              try {
                                                var pickedfiles =
                                                await imgpicker
                                                    .pickMultiImage();

                                                // final path = "images/ $pickedfiles";
                                                // final file = File(pickedfiles.toString());
                                                // final ref = FirebaseStorage.instance.ref().child(path);
                                                // uploadTask = ref.putFile(file);
                                                // final snapshot = await uploadTask!.whenComplete(() {});
                                                // final urlDownload = await snapshot.ref.getDownloadURL();
                                                // print("Download Link: $urlDownload");


                                                //you can use ImageCourse.camera for Camera capture
                                                if (pickedfiles != null) {
                                                  result.addAll(pickedfiles);
                                                  setState(() {});




                                                } else {
                                                  print(
                                                      "No image is selected.");
                                                }
                                              } catch (e) {
                                                print(
                                                    "error while picking file.");
                                              }


                                              // if(result == null) return;
                                              //
                                              // String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
                                              // Reference referenceRoot = FirebaseStorage.instance.ref();
                                              // Reference referenceDirImages = referenceRoot.child("/images/");
                                              // Reference referenceImageUpload = referenceDirImages.child(uniqueFileName);
                                              //
                                              // try{
                                              //   await referenceImageUpload.putFile(File(result.toString()));
                                              //   imageUrl = await referenceImageUpload.getDownloadURL();
                                              // }catch(e){
                                              //   Get.snackbar("error", "$e");
                                              // }


                                            },
                                            icon: Icon(
                                              FontAwesomeIcons.photoFilm,
                                              size: 40,
                                              color: Colors.purple,
                                            )),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Gallery",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),

                TextButton(
                    onPressed: () async{
                      uploadFile();

                    },
                    child: Text("Upload")),
                SizedBox(height: 20),

                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: result.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),


                          child: SizedBox(
                            height: 150,
                            width: 100,
                            child: FocusedMenuHolder(
                              menuWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.3,
                              menuOffset: 10,

                              onPressed: () {},

                              menuItems: <FocusedMenuItem>[
                                FocusedMenuItem(
                                  title: Text(
                                    "Delete", style: TextStyle(fontSize: 15),),
                                  onPressed: () async {
                                    setState(() {
                                      result.removeAt(index);
                                    });
                                  },
                                  trailingIcon: Icon(Icons.delete),
                                )
                              ],
                              child: FullScreenWidget(
                                child: Hero(
                                  tag: "",
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(result[index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ),

                        );
                      }),
                ),

                space,

                //
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: MaterialButton(
                //     color: Colors.blue,
                //     minWidth: double.infinity,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     height: 50,
                //     onPressed: () async {
                //       for (int i = 0; i < result.length; i++) {
                //         String url = await uploadFile(result[i]);
                //         downloadUrls.add(url);
                //
                //         if (i == result.length - 1) {
                //           storeEntry(downloadUrls);
                //         }
                //       }
                //     },
                //     child: Text("Upload"),
                //   ),
                // ),
                space,


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(50),
                            ),
                            color: Colors.purple,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(5, 5),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 2, right: 2, top: 35, bottom: 10),
                          child: Column(
                            children: [
                              Text(
                                "Order Date",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${_dateTime.day.toString()}:${_dateTime.month
                                    .toString()}:${_dateTime.year.toString()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: _showDatePicker,
                    ),
                    InkWell(
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 2, right: 2, top: 35, bottom: 10),
                          child: Column(
                            children: [
                              Text(
                                "Delivery Date",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${_dateTime1.day.toString()}:${_dateTime1.month
                                    .toString()}:${_dateTime1.year.toString()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: _showDatePicker1,
                    ),
                  ],
                ),
                space,

                TextFormField(
                  controller: priceEstimate,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    // prefixIcon: Icon(
                    //   Icons.person,
                    //   color: Colors.red,
                    // ),
                    labelText: "Price Estimate",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                space,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 135,
                      height: 50,
                      child: TextFormField(
                        controller: advance,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          // prefixIcon: Icon(
                          //   Icons.person,
                          //   color: Colors.red,
                          // ),
                          labelText: "Advance",
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                    ),
                    Container(
                      width: 135,
                      height: 50,
                      child: TextFormField(
                        controller: balance,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          // prefixIcon: Icon(
                          //   Icons.person,
                          //   color: Colors.red,
                          // ),
                          labelText: "Balance",
                          labelStyle: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                    ),
                  ],
                ),
                space,
                TextFormField(
                  controller: finalPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    // prefixIcon: Icon(
                    //   Icons.person,
                    //   color: Colors.red,
                    // ),
                    labelText: "Final Price",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                space,

                TextFormField(
                  controller: designerName,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.person,
                      //   color: Colors.red,
                      // ),
                      labelText: "Designer Name",
                      labelStyle: TextStyle(
                        color: Colors.red,
                      )),
                ),
                space,
                TextFormField(
                  controller: invoiceNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    // prefixIcon: Icon(
                    //   Icons.person,
                    //   color: Colors.red,
                    // ),
                    labelText: "Invoice No",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                space,
                TextFormField(
                  controller: orderFormNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    // prefixIcon: Icon(
                    //   Icons.person,
                    //   color: Colors.red,
                    // ),
                    labelText: "Order Form No",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                space,

                InkWell(
                  child: Container(
                    height: 100,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.orange[400],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(5, 7),
                          ),
                        ]),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.white,
                            child: SvgPicture.asset(
                                "assets/images/measurement.svg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Measurement",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Measurement()));
                  },
                ),
                space,

                InkWell(
                  child: Container(
                    height: 100,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.5),
                        color: Colors.orange[400],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(5, 7),
                          ),
                        ]),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.white,
                            child: SvgPicture.asset(
                                "assets/images/Production.svg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Production",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Production()));
                  },
                ),
                SizedBox(
                  height: 150,
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 25, right: 25),
                //   child: OkCancelButton(
                //     borderColor: Colors.red,
                //     buttonAction: () {},
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OkButton(
                            borderColor: Colors.red,
                            buttonAction: () async {
                              try {
                                loading.value = true;

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const Center(
                                        child: const CircularProgressIndicator(
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


                                // for (int i = 0; i < result.length; i++) {
                                //   String url = await uploadFile(result[i]);
                                //   downloadUrls.add(url);
                                //
                                //   if (i == result.length - 1) {
                                //     storeEntry(downloadUrls);
                                //   }
                                // }





                                await db.collection("user").doc(DateTime
                                    .now()
                                    .
                                millisecondsSinceEpoch
                                    .toString()).set({
                                  "mobileNumber": userMobile,
                                  "itemName": "${itemName.text.toString()}",
                                  "priceEstimate": "${priceEstimate.text
                                      .toString()}",
                                  "advance": "${advance.text.toString()}",
                                  "balance": "${balance.text.toString()}",
                                  "finalPrice": "${finalPrice.text.toString()}",
                                  "designerName": "${designerName.text
                                      .toString()}",
                                  "invoiceNo": "${invoiceNo.text.toString()}",
                                  "orderFormNo": "${orderFormNo.text
                                      .toString()}",
                                  "orderDate": "${_dateTime.day
                                      .toString()}:${_dateTime.month
                                      .toString()}:${_dateTime.year
                                      .toString()}",
                                  "deliveryDate": "${_dateTime1.day
                                      .toString()}:${_dateTime1.month
                                      .toString()}:${_dateTime1.year
                                      .toString()}",
                                  // "image" : uploadTask,

                                });

                                // await uploadFile();

                                await clear();

                                // await Get.to(() => OrderDetails());

                               await Navigator.pushReplacement( (context),
                                    MaterialPageRoute(builder: (context) => OrderDetails(getNo: userMobile,)));
                                loading.value = false;
                              } catch (e) {
                                Get.snackbar("error", "$e");
                                loading.value = false;
                              }

                              //
                              // await ctrl.ok();
                              // Get.to(() => Register());
                            }),
                        CancelButton(
                            borderColor: Colors.red, buttonAction: () async {
                          Navigator.pop(context);
                        }),
                      ]),
                ),

                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   imgRef = db.collection("imageUrl");
  // }

  // Future<String> uploadFile(File file) async {
  //   final metaData = SettableMetadata(contentType: 'image/jpeg');
  //   final storageRef = FirebaseStorage.instance.ref();
  //   Reference ref = storageRef
  //       .child('pictures/${DateTime
  //       .now()
  //       .microsecondsSinceEpoch}.jpg');
  //   final uploadTask = ref.putFile(file, metaData);
  //
  //   final taskSnapshot = await uploadTask.whenComplete(() => null);
  //   String url = await taskSnapshot.ref.getDownloadURL();
  //   return url;
  // }
  //
  // storeEntry(List<String> imageUrls) {
  //   FirebaseFirestore.instance
  //       .collection('story')
  //       .add({'image': imageUrls}).then((value) {
  //     Get.snackbar('Success', 'Data is stored successfully');
  //   });
  // }
}
