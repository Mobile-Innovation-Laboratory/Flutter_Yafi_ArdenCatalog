import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class C_LoginPage extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isChecking = false.obs;
  final showPassword = true.obs;
  final isLoading = false.obs;
  final c_username = TextEditingController();
  final c_password = TextEditingController();
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  @override
  void onInit() {
    super.onInit();
    checkUser();
  }

  Future<void> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? token = prefs.getString('token');
    int? status = prefs.getInt('status');

    if (username == null || token == null || status == null) return;

    try {
      var snapshot =
          await userCollection.where('username', isEqualTo: username).get();

      if (snapshot.docs.isNotEmpty) {
        var userDoc = snapshot.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>;

        if (userData['token'] == token) {
          if (status == 1) {
            Get.offAndToNamed('/admin_dashboard_page');
          } else {
            Get.offAndToNamed('/home_page');
          }
        }
      }
    } catch (e) {
      print("Error checking user: $e");
    }
  }

  Future<void> loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userCollection
        .where('username', isEqualTo: c_username.text)
        .get()
        .then((snapshot) async {
      if (snapshot.docs.isNotEmpty) {
        var userDoc = snapshot.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>;

        if (userData['password'] == c_password.text) {
          String token = const Uuid().v4();
          await userDoc.reference.update({'token': token});
          var status = userData['status'];

          await prefs.setString('token', token);
          await prefs.setString('username', c_username.text);
          await prefs.setInt('status', userData['status']);

          if (status == 1) {
            Get.offNamed('/admin_dashboard_page');
          } else {
            Get.offNamed('/home_page');
          }
        } else {
          Get.snackbar("Login Failed", "Incorrect password",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar("Login Failed", "User not found",
            snackPosition: SnackPosition.BOTTOM);
      }
    }).catchError((error) {
      Get.snackbar("Error", "Something went wrong: $error",
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
