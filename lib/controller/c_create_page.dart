import 'dart:convert';
import 'dart:io';

import 'package:billiard_catalog/model/m_catalog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class C_CreatePage extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final c_itemName = TextEditingController();
  final c_itemStock = TextEditingController();
  final c_itemPrice = TextEditingController();
  final c_itemDesc = TextEditingController();
  final c_itemCategory = TextEditingController(text: 'Meja');
  var selectedImage = Rx<File?>(null);
  var selectedBase64Image = ''.obs;

  final CollectionReference catalogCollection =
      FirebaseFirestore.instance.collection('catalog');

  void updateDropdownValue(String value) {
    c_itemCategory.text = value;
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 300, maxHeight: 300);

      if (image == null) {
        Get.snackbar(
            "Error", "No Image Selected");
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

  Future<void> createData() async {
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
      await catalogCollection.add(catalog.toMap()).whenComplete(
        () {
          c_itemCategory.clear();
          c_itemDesc.clear();
          c_itemName.clear();
          c_itemPrice.clear();
          c_itemStock.clear();
          selectedBase64Image.value = '';
          isLoading.value = false;
        },
      ).then(
        (value) => Get.back(),
      );
    } catch (errorMessage) {
      throw Exception("Error: $errorMessage");
    }
  }
}
