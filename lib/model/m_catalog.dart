import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class M_Catalog {
  String id;
  String itemName;
  String itemDesc;
  String itemCategory;
  String itemStock;
  String itemPrice;
  String imagePath;

  M_Catalog(
      {required this.id,
      required this.itemName,
      required this.itemDesc,
      required this.itemCategory,
      required this.itemStock,
      required this.itemPrice,
      required this.imagePath});

  factory M_Catalog.fromJson(String str) => M_Catalog.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory M_Catalog.fromMap(Map<String, dynamic> json) => M_Catalog(
      id: json["id"],
      itemName: json["itemName"],
      itemDesc: json["itemDesc"],
      itemCategory: json["itemCategory"],
      itemStock: json["itemStock"],
      itemPrice: json["itemPrice"],
      imagePath: json["imagePath"]);

  factory M_Catalog.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return M_Catalog(
        id: doc.id,
        itemName: data['itemName'] ?? '',
        itemDesc: data['itemDesc'] ?? '',
        itemCategory: data['itemCategory'] ?? '',
        itemStock: data['itemStock'] ?? '',
        itemPrice: data['itemPrice'] ?? '',
        imagePath: data['imagePath'] ?? '');
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "itemName": itemName,
        "itemDesc": itemDesc,
        "itemCategory": itemCategory,
        "itemStock": itemStock,
        "itemPrice": itemPrice,
        "imagePath": imagePath
      };
}
