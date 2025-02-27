import 'package:billiard_catalog/model/m_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class C_RegisterPage extends GetxController {
  final formKey = GlobalKey<FormState>();
  final showPassword = true.obs;
  final isLoading = false.obs;
  final c_email = TextEditingController();
  final c_username = TextEditingController();
  final c_password = TextEditingController();
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('user');

  Future<void> createData() async {
    try {
      isLoading.value = true;
      M_User user = M_User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          username: c_username.text,
          email: c_email.text,
          password: c_password.text,
          status: 0,
          token: "");
      await collection.add(user.toMap()).whenComplete(
        () {
          isLoading.value = false;
          c_email.clear();
          c_password.clear();
          c_username.clear();
        },
      ).then((value) => Get.offAndToNamed('/login_page'));
    } catch (errorMessage) {
      throw Exception("Error: $errorMessage");
    }
  }
}
