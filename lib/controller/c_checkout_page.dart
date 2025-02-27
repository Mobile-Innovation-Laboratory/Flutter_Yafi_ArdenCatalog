import 'package:billiard_catalog/controller/c_cart_page.dart';
import 'package:get/get.dart';

class C_CheckoutPage extends GetxController {
  final cartController = Get.find<C_CartPage>();
  @override
  void onInit() {
    super.onInit();
    completeCheckout();
  }

  Future<void> completeCheckout() async {
    await Future.delayed(const Duration(seconds: 3)); 
    cartController.cartList.clear();
    Get.offAndToNamed('/dashboard_page');
  }
}
