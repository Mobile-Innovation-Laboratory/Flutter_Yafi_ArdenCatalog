import 'dart:convert';

import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_dashboard_page.dart';
import 'package:billiard_catalog/controller/c_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.controller,
  });

  final C_DashboardPage controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.optionValue.value = index;
                controller.optionFetch();
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: const BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Text(
                    controller.categoryList[index],
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  )),
            );
          }),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({
    super.key,
    required this.controller,
  });

  final C_DashboardPage controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            itemCount: controller.catalogList.length,
            itemBuilder: (context, index) {
              final products = controller.catalogList[index];
              return BestSellerItem(
                imagePath: products.imagePath,
                itemId: products.id,
                itemName: products.itemName,
                itemPrice: 'Rp ${products.itemPrice}',
              );
            },
          )),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  final String itemId, itemName, itemPrice, imagePath;
  const BestSellerItem({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_DetailPage());
    return InkWell(
      onTap: () {
        controller.fetchSpecificCatalog(itemId);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: AppColor.primary, width: 4),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.memory(
              base64Decode(imagePath),
              width: double.infinity,
              fit: BoxFit.cover,
            )),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemPrice,
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
