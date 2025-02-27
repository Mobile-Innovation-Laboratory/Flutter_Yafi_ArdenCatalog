import 'package:billiard_catalog/model/m_catalog.dart';
import 'package:billiard_catalog/pages/user_page/dashboard_page/dashboard_page.dart';
import 'package:billiard_catalog/pages/user_page/profile_page/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class C_DashboardPage extends GetxController {
  final username = ''.obs;
  final optionValue = 0.obs;
  final isLoading = false.obs;
  final bottomindex = 0.obs;
  final categoryList = ["All", "Meja", "Cue Play", "Gloves"];
  final listBanners = [].obs;
  final List<Widget> pages = [
    const DashboardPage(),
    const ProfilePage(),
  ];
  final CollectionReference catalogCollection =
      FirebaseFirestore.instance.collection('catalog');
  final Query catalogQueryMeja = FirebaseFirestore.instance
      .collection("catalog")
      .where("itemCategory", isEqualTo: "Meja");
  final Query catalogQueryCuePlay = FirebaseFirestore.instance
      .collection("catalog")
      .where("itemCategory", isEqualTo: "Cue Play");
  final Query catalogQueryGloves = FirebaseFirestore.instance
      .collection("catalog")
      .where("itemCategory", isEqualTo: "Gloves");
  RxList<M_Catalog> catalogList = <M_Catalog>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSharedPreferences();
    optionFetch();
  }

  Future<void> loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username')!;
  }

  Future fetchCatalog() async {
    catalogCollection.snapshots().listen((snapshot) {
      catalogList.value =
          snapshot.docs.map((doc) => M_Catalog.fromFirestore(doc)).toList();
    });
  }

  Future fetchCatalogByCategoryCuePlay() async {
    catalogQueryCuePlay.snapshots().listen((snapshot) {
      catalogList.value =
          snapshot.docs.map((doc) => M_Catalog.fromFirestore(doc)).toList();
    });
  }

  Future fetchCatalogByCategoryMeja() async {
    catalogQueryMeja.snapshots().listen((snapshot) {
      catalogList.value =
          snapshot.docs.map((doc) => M_Catalog.fromFirestore(doc)).toList();
    });
  }

  Future fetchCatalogByCategoryGloves() async {
    catalogQueryGloves.snapshots().listen((snapshot) {
      catalogList.value =
          snapshot.docs.map((doc) => M_Catalog.fromFirestore(doc)).toList();
    });
  }

  Future<void> logoutUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('username');
      await prefs.remove('status');

      Get.offAndToNamed('/login_page');
    } catch (errorMsg) {
      throw Exception(errorMsg);
    }
  }

  Future optionFetch() async {
    switch (optionValue.value) {
      case 1:
        await fetchCatalogByCategoryMeja();
        break;
      case 2:
        await fetchCatalogByCategoryCuePlay();
        break;
      case 3:
        await fetchCatalogByCategoryGloves();
        break;
      default:
        await fetchCatalog();
        break;
    }
    refresh();
  }
}
