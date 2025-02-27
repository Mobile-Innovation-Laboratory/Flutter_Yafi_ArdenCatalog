import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class M_Cart {
  String id;
  String itemName;
  String itemPrice;
  String imagePath;

  M_Cart(
      {required this.id,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath});

  factory M_Cart.fromJson(String str) => M_Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory M_Cart.fromMap(Map<String, dynamic> json) => M_Cart(
      id: json["id"],
      itemName: json["itemName"],
      itemPrice: json["itemPrice"],
      imagePath: json["imagePath"]);

  factory M_Cart.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return M_Cart(
        id: doc.id,
        itemName: data['itemName'] ?? '',
        itemPrice: data['itemPrice'] ?? '',
        imagePath: data['imagePath'] ?? '');
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "itemName": itemName,
        "itemPrice": itemPrice,
        "imagePath": imagePath
      };
}
