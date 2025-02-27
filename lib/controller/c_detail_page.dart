import 'package:billiard_catalog/model/m_catalog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class C_DetailPage extends GetxController {
  final userStatus = 0.obs;
  final isLoading = false.obs;
  final CollectionReference catalogCollection =
      FirebaseFirestore.instance.collection('catalog');

  @override
  void onInit() {
    super.onInit();
    loadSharedPreferences();
  }

  Future<void> loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userStatus.value = prefs.getInt('status')!;
  }

  Future<M_Catalog?> fetchCatalogById(String docId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await catalogCollection.doc(docId).get();
      if (documentSnapshot.exists) {
        return M_Catalog.fromFirestore(documentSnapshot);
      } else {
        return null;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  void fetchSpecificCatalog(String docId) async {
    isLoading.value = true;
    M_Catalog? catalog = await fetchCatalogById(docId);
    if (catalog != null) {
      Get.toNamed('/detail_page', arguments: {
        'id': catalog.id,
        'itemName': catalog.itemName,
        'itemPrice': catalog.itemPrice,
        'itemDesc': catalog.itemDesc,
        'itemStock': catalog.itemStock,
        'imagePath': catalog.imagePath
      })!
          .then(
        (value) => isLoading.value = false,
      );
    }
  }

  void fetchSpecificCatalogToUpdate(String docId) async {
    M_Catalog? catalog = await fetchCatalogById(docId);
    if (catalog != null) {
      Get.toNamed('/update_page', arguments: {
        'id': catalog.id,
        'itemName': catalog.itemName,
        'itemPrice': catalog.itemPrice,
        'itemDesc': catalog.itemDesc,
        'itemStock': catalog.itemStock,
        'imagePath': catalog.imagePath
      });
    }
  }
}
