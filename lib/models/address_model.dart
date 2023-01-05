
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel{
  String? id,houseName,area,district;
  dynamic? houseNo,landMark,pincode;
  AddressModel({this.id, this.houseName, this.area, this.district, this.houseNo, this.landMark, this.pincode});
  factory AddressModel.fromMap(DocumentSnapshot map) {
    return AddressModel(
      houseName: map["houseName"],
      area: map["area"],
      district: map["district"],
      houseNo: map["houseNo"],
      landMark: map["landMark"],
      pincode: map["pincode"],
      id: map.id,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "houseName" : houseName,
      "area" : area,
      "district" : district,
      "houseNo" : houseNo,
      "landMark" : landMark,
      "pincode" : pincode,
    };
  }

}