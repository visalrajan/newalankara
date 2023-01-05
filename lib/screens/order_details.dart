// import 'package:alankara/buttons/cancelButton.dart';
// import 'package:alankara/buttons/okButton.dart';
// import 'package:alankara/controller/order_details_controller.dart';
// import 'package:alankara/screens/measurement.dart';
// import 'package:alankara/screens/production.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class OrderDetails extends StatefulWidget {
//   const OrderDetails({Key? key}) : super(key: key);
//
//   @override
//   _OrderDetailsState createState() => _OrderDetailsState();
// }
//
// class _OrderDetailsState extends State<OrderDetails> {
//
//   final ctrl = Get.put(OrderDetailsController());
//
//
//   DateTime _dateTime = DateTime.now();
//   final DateTime? date = DateTime.now();
//
//   void _showDatePicker() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1980),
//       lastDate: DateTime(2050),
//     ).then((value) {
//       setState(() {
//         _dateTime = value!;
//       });
//     });
//   }
//
//   DateTime _dateTime1 = DateTime.now();
//   final DateTime? date1 = DateTime.now();
//
//   void _showDatePicker1() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1980),
//       lastDate: DateTime(2050),
//     ).then((value) {
//       setState(() {
//         _dateTime1 = value!;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var space = SizedBox(
//       height: 25,
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Order Details",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: ctrl.itemName,
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(5.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(5.5),
//                       ),
//                       // prefixIcon: Icon(
//                       //   Icons.person,
//                       //   color: Colors.red,
//                       // ),
//                       labelText: "Item Name",
//                       labelStyle: TextStyle(
//                         color: Colors.red,
//                       )),
//                 ),
//                 space,
//
//                 InkWell(
//                   child: Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.5),
//                       color: Colors.grey[300],
//                       border: Border.all(color: Colors.grey,width: 2)
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Center(
//                         child: Text(
//                           "Upload Images",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blueGrey,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   onTap: (){
//                     showModalBottomSheet(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                         context: context,
//                         builder: (BuildContext context) {
//                           return Container(
//                             height: 70,
//
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Column(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(Icons.camera, size: 40,
//                                           color: Colors.blueGrey,
//                                        ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 5),
//                                       child: Text("Camera",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                       ),),
//                                     ),
//                                   ],crossAxisAlignment: CrossAxisAlignment.center,
//                                 ),
//                                 Column(
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(FontAwesomeIcons.photoFilm, size: 40, color: Colors.purple,)
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 5),
//                                       child: Text("Gallery",style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                       ),),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//
//                     );
//
//                   },
//                 ),
//
//                 space,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       child: Container(
//                         height: 130,
//                         width: 130,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(50),
//                               topRight: Radius.circular(10),
//                               bottomLeft: Radius.circular(10),
//                               bottomRight: Radius.circular(50),
//                             ),
//                             color: Colors.purple,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black12.withOpacity(0.4),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(5, 5),
//                               ),
//                             ]),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 2, right: 2, top: 35, bottom: 10),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Order Date",
//                                 style: TextStyle(
//                                   fontSize: 19,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "${_dateTime.day.toString()}:${_dateTime.month.toString()}:${_dateTime.year.toString()}",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       onTap: _showDatePicker,
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: 130,
//                         width: 130,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(50),
//                             bottomLeft: Radius.circular(50),
//                             bottomRight: Radius.circular(10),
//                           ),
//                           color: Colors.blue,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12.withOpacity(0.4),
//                               spreadRadius: 5,
//                               blurRadius: 7,
//                               offset: Offset(5, 5),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 2, right: 2, top: 35, bottom: 10),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Delivery Date",
//                                 style: TextStyle(
//                                   fontSize: 19,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "${_dateTime1.day.toString()}:${_dateTime1.month.toString()}:${_dateTime1.year.toString()}",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       onTap: _showDatePicker1,
//                     ),
//                   ],
//                 ),
//                 space,
//
//
//
//                 TextFormField(
//                   controller: ctrl.priceEstimate,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     // prefixIcon: Icon(
//                     //   Icons.person,
//                     //   color: Colors.red,
//                     // ),
//                     labelText: "Price Estimate",
//                     labelStyle: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//                 space,
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 135,
//                       height: 50,
//                       child: TextFormField(
//                         controller: ctrl.advance,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red),
//                             borderRadius: BorderRadius.circular(5.5),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red),
//                             borderRadius: BorderRadius.circular(5.5),
//                           ),
//                           // prefixIcon: Icon(
//                           //   Icons.person,
//                           //   color: Colors.red,
//                           // ),
//                           labelText: "Advance",
//                           labelStyle: TextStyle(
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.5),
//                       ),
//                     ),
//                     Container(
//                       width: 135,
//                       height: 50,
//                       child: TextFormField(
//                         controller: ctrl.balance,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red),
//                             borderRadius: BorderRadius.circular(5.5),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red),
//                             borderRadius: BorderRadius.circular(5.5),
//                           ),
//                           // prefixIcon: Icon(
//                           //   Icons.person,
//                           //   color: Colors.red,
//                           // ),
//                           labelText: "Balance",
//                           labelStyle: TextStyle(
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.5),
//                       ),
//                     ),
//                   ],
//                 ),
//                 space,
//                 TextFormField(
//                   controller: ctrl.finalPrice,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     // prefixIcon: Icon(
//                     //   Icons.person,
//                     //   color: Colors.red,
//                     // ),
//                     labelText: "Final Price",
//                     labelStyle: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//                 space,
//
//                 TextFormField(
//                   controller: ctrl.designerName,
//                   decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(5.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                         borderRadius: BorderRadius.circular(5.5),
//                       ),
//                       // prefixIcon: Icon(
//                       //   Icons.person,
//                       //   color: Colors.red,
//                       // ),
//                       labelText: "Designer Name",
//                       labelStyle: TextStyle(
//                         color: Colors.red,
//                       )),
//                 ),
//                 space,
//                 TextFormField(
//                   controller: ctrl.invoiceNo,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     // prefixIcon: Icon(
//                     //   Icons.person,
//                     //   color: Colors.red,
//                     // ),
//                     labelText: "Invoice No",
//                     labelStyle: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//                 space,
//                 TextFormField(
//                   controller: ctrl.orderFormNo,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                       borderRadius: BorderRadius.circular(5.5),
//                     ),
//                     // prefixIcon: Icon(
//                     //   Icons.person,
//                     //   color: Colors.red,
//                     // ),
//                     labelText: "Order Form No",
//                     labelStyle: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//                 space,
//
//                 InkWell(
//                   child: Container(
//                     height: 100,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.5),
//                         color: Colors.orange[400],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12.withOpacity(0.4),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: Offset(5, 7),
//                           ),
//                         ]),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Container(
//                             height: 80,
//                             width: 80,
//                             color: Colors.white,
//                             child: SvgPicture.asset(
//                                 "assets/images/measurement.svg"),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 25),
//                           child: Text(
//                             "Measurement",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Measurement()));
//                   },
//                 ),
//                 space,
//
//                 InkWell(
//                   child: Container(
//                     height: 100,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.5),
//                         color: Colors.orange[400],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12.withOpacity(0.4),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: Offset(5, 7),
//                           ),
//                         ]),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Container(
//                             height: 80,
//                             width: 80,
//                             color: Colors.white,
//                             child: SvgPicture.asset(
//                                 "assets/images/Production.svg"),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 25),
//                           child: Text(
//                             "Production",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Production()));
//                   },
//                 ),
//                 SizedBox(
//                   height: 150,
//                 ),
//
//
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 25, right: 25),
//                 //   child: OkCancelButton(
//                 //     borderColor: Colors.red,
//                 //     buttonAction: () {},
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25, right: 25),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         OkButton(
//                             borderColor: Colors.red,
//                             buttonAction: () async{
//                               await ctrl.ok();
//
//                             }),
//                         CancelButton(
//                             borderColor: Colors.red,
//                             buttonAction: () {}),
//                       ]),
//                 ),
//
//                 SizedBox(
//                   height: 100,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }



import 'package:alankara/screens/added_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetails extends StatefulWidget {
  dynamic getNo;
  OrderDetails({super.key, required this.getNo});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final Stream<QuerySnapshot> user =
  FirebaseFirestore.instance.collection("user").snapshots();


  @override
  Widget build(BuildContext context) {
    var responseNo = widget.getNo;








    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Order Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

      ),
      body: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),


              InkWell(
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.5),
                      color: Colors.white60,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(5, 7),
                        ),
                      ]),
                  child: Center(
                    child: Text("Add Items",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                onTap: ()async{


                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // Object? userMobile = "";
                  // if (prefs.containsKey("mobileNumber")) {
                  //   userMobile = prefs.get("mobileNumber");
                  // }


                  // Get.to(()=> AddedItems(response: [],));
                  Navigator.push( (context),
                      MaterialPageRoute(builder: (context) => AddedItems(response: [],)));
                },
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: user,
                    builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                if (snapshot.hasError) {
                return const Text("Something wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("");
                }
                final data = snapshot.requireData;

                // SharedPreferences prefs =
                //     SharedPreferences.getInstance();
                // Object? userMobile = "";
                // if (prefs.containsKey("mobileNumber")) {
                //   userMobile = prefs.get("mobileNumber");
                // }

                return ListView.builder(
                  itemCount: data.size,
                    itemBuilder: (context, index){
                      return (responseNo ==  data.docs[index]["mobileNumber"])
                        ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                          child: Container(
                          height: 50,
                            width: double.infinity,
                            child: Text(
                            "Item Name: ${data.docs[index]["itemName"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),
                      ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          ),
                        )
                          : Text("");

                    },
                );
                }
                ),
                // color: Colors.orange,
              ),


            ],
          ),
        ),


    );
  }
}

