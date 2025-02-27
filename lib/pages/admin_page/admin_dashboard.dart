import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_dashboard_page.dart';
import 'package:billiard_catalog/widgets/admin_widgets.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_DashboardPage());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Text(''),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Catalog',
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        actions: [
          CustomIconButton(
              iconColor: AppColor.danger,
              backgroundColor: Colors.white,
              buttonIcon: Icons.logout,
              buttonFunction: () => controller.logoutUser())
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleItem(),
            SizedBox(
              height: 8,
            ),
            ListItem(),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonCreate(),
    );
  }
}
