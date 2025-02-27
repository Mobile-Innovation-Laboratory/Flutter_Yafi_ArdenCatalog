import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_cart_page.dart';
import 'package:billiard_catalog/widgets/cart_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CartPage());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.chevron_left_sharp)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Cart',
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartTitleItem(
              leading: 'Item',
              trailing: 'Harga',
            ),
            const SizedBox(
              height: 8,
            ),
            const CartListItem(),
            Obx(() => CartTitleItem(
                  leading: 'Total',
                  trailing: controller.totalPrice.value.toString(),
                )),
            CustomCreateCartTextButton(
                normalText: '',
                boldText: 'Checkout',
                buttonFunction: () {
                  Get.toNamed('/checkout_page');
                }),
          ],
        ),
      ),
    );
  }
}
