import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/model/m_catalog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class C_AdminDashboard extends GetxController {
  final CollectionReference catalogCollection =
      FirebaseFirestore.instance.collection('catalog');
  RxList<M_Catalog> catalogList = <M_Catalog>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatalog();
  }

  Future fetchCatalog() async {
    catalogCollection.snapshots().listen((snapshot) async {
      List<M_Catalog> catalogs =
          snapshot.docs.map((doc) => M_Catalog.fromFirestore(doc)).toList();

      for (var catalog in catalogs) {
        int stock = int.tryParse(catalog.itemStock.replaceAll(',', '')) ?? 0;
        if (stock == 0) {
          await catalogCollection.doc(catalog.id).delete();
        }
      }

      catalogList.value = catalogs.where((catalog) {
        int stock = int.tryParse(catalog.itemStock.replaceAll(',', '')) ?? 0;
        return stock > 0;
      }).toList();
    });
  }

  Future<void> deleteCatalog(String docId) async {
    try {
      await catalogCollection.doc(docId).delete();
    } catch (error) {
      Get.snackbar("Error", "Failed to delete note: $error",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.danger,
          colorText: AppColor.textWhite);
    }
  }
}
