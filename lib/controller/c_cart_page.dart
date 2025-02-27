import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/model/m_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class C_CartPage extends GetxController {
  final isLoading = false.obs;
  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cart');
  RxList<M_Cart> cartList = <M_Cart>[].obs;
  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  Future fetchCart() async {
    cartCollection.snapshots().listen((snapshot) {
      cartList.value =
          snapshot.docs.map((doc) => M_Cart.fromFirestore(doc)).toList();
      calculateTotalPrice();
    });
  }
void calculateTotalPrice() {
  double sum = 0.0;
  for (var cart in cartList) {
    String cleanPrice = cart.itemPrice.replaceAll(',', '');
    double price = double.tryParse(cleanPrice) ?? 0.0;
    sum += price;
  }
  totalPrice.value = sum;
}


  Future<void> createData(
      String itemName, String itemPrice, String Id, String imagePath) async {
    try {
      isLoading.value = true;
      M_Cart catalog = M_Cart(
        id: Id,
        itemName: itemName,
        itemPrice: itemPrice,
        imagePath: imagePath,
      );
      await cartCollection.add(catalog.toMap()).whenComplete(() {
        isLoading.value = false;
        calculateTotalPrice(); // Update total price after adding
      }).then((value) => Get.toNamed('/cart_page'));
    } catch (errorMessage) {
      throw Exception("Error: $errorMessage");
    }
  }

  Future<void> deleteCart(String docId) async {
    try {
      await cartCollection.doc(docId).delete();
      calculateTotalPrice(); // Update total price after deleting
    } catch (error) {
      Get.snackbar("Error", "Failed to delete item: $error",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.danger,
          colorText: AppColor.textWhite);
    }
  }
}
