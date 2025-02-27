import 'dart:convert';
import 'dart:io';

import 'package:billiard_catalog/model/m_catalog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class C_UpdatePage extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final c_itemName = TextEditingController();
  final c_itemStock = TextEditingController();
  final c_itemPrice = TextEditingController();
  final c_itemDesc = TextEditingController();
  var selectedImage = Rx<File?>(null);
  var selectedBase64Image = ''.obs;
  final c_itemCategory = TextEditingController(text: 'Meja');
  final CollectionReference catalogCollection =
      FirebaseFirestore.instance.collection('catalog');
  final db = FirebaseFirestore.instance;
  String? idData;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    idData = args['id'] ?? '';
    c_itemName.text = args['itemName'] ?? '';
    c_itemCategory.text = args['itemCategory'] ?? '';
    c_itemPrice.text = args['itemPrice'] ?? '';
    c_itemDesc.text = args['itemDesc'] ?? '';
    c_itemStock.text = args['itemStock'] ?? '';
    selectedBase64Image.value = args['imagePath'] ?? '';
  }

  void updateDropdownValue(String value) {
    c_itemCategory.text = value;
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(
          source: ImageSource.gallery, maxWidth: 300, maxHeight: 300);

      if (image == null) {
        Get.snackbar("Error", "No Image Selected");
        return;
      }

      File file = File(image.path);
      selectedImage.value = file;

      List<int> imageBytes = await file.readAsBytes();
      String base64String = base64Encode(imageBytes);

      if (base64String.length > 800000) {
        Get.snackbar(
            "Error", "Image is too large. Please select a smaller image.");
        return;
      }

      selectedBase64Image.value = base64String;
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image. Please try again.");
    }
  }

  Future<void> updateData(String docId) async {
    try {
      isLoading.value = true;
      M_Catalog catalog = M_Catalog(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          itemName: c_itemName.text,
          itemDesc: c_itemDesc.text,
          itemCategory: c_itemCategory.text,
          itemPrice: c_itemPrice.text,
          imagePath: selectedBase64Image.value,
          itemStock: c_itemStock.text);
      await catalogCollection.doc(docId).update(catalog.toMap()).whenComplete(
        () {
          c_itemCategory.clear();
          c_itemDesc.clear();
          c_itemName.clear();
          c_itemPrice.clear();
          c_itemStock.clear();
          selectedBase64Image.value = '';
          isLoading.value = true;
        },
      ).then(
        (value) => Get.offAndToNamed('/admin_dashboard_page'),
      );
    } catch (errorMessage) {
      throw Exception("Error: $errorMessage");
    }
  }
}
