

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductionModel{

  String? materialType, dying, cutting, stitching, embroidery, remarks;

  ProductionModel({this.materialType, this.dying, this.cutting, this.stitching, this.embroidery, this.remarks});

  factory ProductionModel.fromMap(DocumentSnapshot map){
    return ProductionModel(
      materialType: map["materialType"],
      dying: map["dying"],
      cutting: map["cutting"],
      stitching: map["stitching"],
      embroidery: map["embroidery"],
      remarks: map["remarks"]
    );
  }
  Map<String, dynamic> toMap(){
    return {
      "materialType" : materialType,
      "dying" : dying,
      "cutting" : cutting,
      "stitching" : stitching,
      "embroidery" : embroidery,
      "remarks" : remarks
    };
  }
}