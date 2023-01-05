
import 'package:cloud_firestore/cloud_firestore.dart';

class MobileNoModel{
  dynamic mobileNumber;
  MobileNoModel({this.mobileNumber});
  factory MobileNoModel.fromMap(DocumentSnapshot map){
    return MobileNoModel(
      mobileNumber: map["mobileNumber"],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      "mobileNumber" : mobileNumber,
    };
  }
}