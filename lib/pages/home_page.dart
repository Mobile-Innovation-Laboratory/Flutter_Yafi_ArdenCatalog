import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:billiard_catalog/controller/c_dashboard_page.dart';
import 'package:billiard_catalog/pages/user_page/dashboard_page/dashboard_page.dart';
import 'package:billiard_catalog/pages/user_page/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_DashboardPage());
    final List<Widget> pages = [
      const DashboardPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.bottomindex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
            icons: const [Icons.home, Icons.person],
            activeIndex: controller.bottomindex.value,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) => controller.bottomindex.value = index,
          )),
    );
  }
}
