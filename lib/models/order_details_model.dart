

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetailsModel{
  String? itemName, designerName;
  int? priceEstimate, advance, balance, finalPrice;
  dynamic invoiceNo, orderFormNo;

  OrderDetailsModel({
    this.itemName,
    this.designerName,
    this.priceEstimate,
    this.advance,
    this.balance,
    this.finalPrice,
    this.invoiceNo,
    this.orderFormNo});

  factory OrderDetailsModel.fromMap(DocumentSnapshot map){
    return OrderDetailsModel(
      itemName: map["itemName"],
      designerName: map["designerName"],
      priceEstimate: map["priceEstimate"],
      advance: map["advance"],
      balance: map["balance"],
      finalPrice: map["finalPrice"],
      invoiceNo: map["invoiceNo"],
      orderFormNo: map["orderFormNo"]
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "itemName" : itemName,
      "designerName" : designerName,
      "priceEsimate" : priceEstimate,
      "advance" : advance,
      "balance" : balance,
      "finalPrice" : finalPrice,
      "invoiceNo" : invoiceNo,
      "orderFormNo" : orderFormNo
    };
  }

}