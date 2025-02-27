import 'dart:convert';

import 'package:billiard_catalog/controller/c_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:billiard_catalog/color/color.dart';
import 'package:get/get.dart';

class CartTitleItem extends StatelessWidget {
  final String leading, trailing;
  const CartTitleItem({
    required this.leading,
    required this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leading,
              style: const TextStyle(color: AppColor.textWhite, fontSize: 18),
            ),
            Text(
              trailing,
              style: const TextStyle(color: AppColor.textWhite, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CartPage());
    return Obx(() {
      if (controller.cartList.isEmpty) {
        return const Center(child: Text("No Cart Found"));
      }
      return Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: controller.cartList.length,
          itemBuilder: (context, index) {
            final item = controller.cartList[index];
            return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.danger,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.delete, color: AppColor.textWhite),
                ),
                onDismissed: (direction) {
                  controller.deleteCart(item.id);
                },
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    tileColor: AppColor.textWhite,
                    enableFeedback: true,
                    leading: Image.memory(
                      base64Decode(item.imagePath),
                      fit: BoxFit.contain,
                      width: 100,
                      height: 50,
                    ),
                    title: Text(item.itemName),
                    trailing: Text(
                      item.itemPrice,
                      style: const TextStyle(fontSize: 20),
                    ),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: AppColor.textBlack),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
        ),
      );
    });
  }
}

class CustomCreateCartTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  const CustomCreateCartTextButton(
      {super.key,
      required this.normalText,
      required this.boldText,
      required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CartPage());
    return InkWell(
      onTap: () {
        buttonFunction();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              normalText,
            ),
            const SizedBox(
              width: 5,
            ),
            controller.isLoading.value
                ? const CircularProgressIndicator(
                    color: AppColor.textWhite,
                  )
                : Text(
                    boldText,
                    style: const TextStyle(color: AppColor.textWhite),
                  )
          ],
        ),
      ),
    );
  }
}
