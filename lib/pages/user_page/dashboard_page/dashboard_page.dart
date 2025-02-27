import 'package:banner_carousel/banner_carousel.dart';
import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_dashboard_page.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:billiard_catalog/widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_DashboardPage());

    List<BannerModel> listBanners = [
      BannerModel(
          imagePath:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS2z9vLO8ksZuE-fktoxp5Hbq5e6mbHe9CVA&s',
          id: "1",
          boxFit: BoxFit.contain),
      BannerModel(
          imagePath:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFFuB6xcVQ7H2_bh5KcD-_Se9jVgrMeyPviw&s',
          id: "2",
          boxFit: BoxFit.contain),
      BannerModel(
          imagePath:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBtJrsVbS0PgT3cczhUEl9Hb0Ta0gfcGlytQ&s',
          id: "3",
          boxFit: BoxFit.contain),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        title: Obx(() => Text(
              'Welcome ${controller.username}',
              style: const TextStyle(color: AppColor.textWhite),
            )),
        backgroundColor: AppColor.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomIconButton(
              iconColor: AppColor.primary,
              backgroundColor: AppColor.textWhite,
              buttonFunction: () => Get.toNamed('/cart_page'),
              buttonIcon: Icons.shopping_cart_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerCarousel(
              viewportFraction: 0.9,
              margin: const EdgeInsets.all(8),
              spaceBetween: 12,
              banners: listBanners,
              animation: true,
              activeColor: AppColor.secondary,
              showIndicator: false,
            ),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CategoryList(controller: controller),
            const Text(
              'Our Catalog',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CatalogList(controller: controller),
          ],
        ),
      ),
      
    );
  }
}
