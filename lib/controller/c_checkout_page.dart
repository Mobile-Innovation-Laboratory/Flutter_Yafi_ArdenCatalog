import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_cart_page.dart';
import 'package:billiard_catalog/model/m_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class C_CheckoutPage extends GetxController {
  final cartController = Get.find<C_CartPage>();
  final isLoading = false.obs;
  final RxList<M_Cart> purchasedItems = <M_Cart>[].obs;

  Future<void> checkout() async {
    try {
      isLoading.value = true;

      QuerySnapshot cartSnapshot = await cartController.cartCollection.get();

      purchasedItems.assignAll(cartController.cartList);

      for (QueryDocumentSnapshot doc in cartSnapshot.docs) {
        M_Cart cartItem = M_Cart.fromFirestore(doc);

        DocumentReference catalogRef =
            FirebaseFirestore.instance.collection('catalog').doc(cartItem.id);

        DocumentSnapshot catalogSnapshot = await catalogRef.get();

        if (catalogSnapshot.exists) {
          Map<String, dynamic> catalogData =
              catalogSnapshot.data() as Map<String, dynamic>;
          int currentStock = int.tryParse(catalogData['stock'].toString()) ?? 0;

          if (currentStock > 0) {
            int updatedStock = currentStock - 1;
            await catalogRef.update({'stock': updatedStock.toString()});
          } else {
            print("Stock unavailable for ${cartItem.itemName}");
          }
        }
      }

      WriteBatch batch = FirebaseFirestore.instance.batch();
      for (QueryDocumentSnapshot doc in cartSnapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();

      cartController.cartList.clear();
      cartController.totalPrice.value = 0.0;

      Get.offAndToNamed('/checkout_page');
    } catch (e) {
      print("Error during checkout: $e");
      Get.snackbar("Error", "Failed to complete checkout",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.danger,
          colorText: AppColor.textWhite);
    } finally {
      isLoading.value = false;
    }
  }
}
