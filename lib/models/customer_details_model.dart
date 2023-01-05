

import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerDetailsModel{
  String? id, customerName, remarks;
  dynamic mobile, date;

  CustomerDetailsModel({this.id, this.customerName, this.remarks,this.mobile, this.date});

  factory CustomerDetailsModel.fromMap(DocumentSnapshot map){
    return CustomerDetailsModel(
      id: map.id,
      customerName: map["customerName"],
      remarks: map["remarks"],
      date: map["date"],
      mobile: map["mobile"]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "customerName" : customerName,
      "mobile" : mobile,
      "date" : date,
      "remarks" : remarks,
    };

  }

}