import 'package:billiard_catalog/controller/c_dashboard_page.dart';
import 'package:billiard_catalog/controller/c_profile_page.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:billiard_catalog/color/color.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_ProfilePage());
    final dashboardController = Get.put(C_DashboardPage());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Obx(() => Text(
              controller.username.value,
            )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextButton(
              normalText: '',
              boldText: 'Logout',
              buttonFunction: () {dashboardController.logoutUser();},
              backgroundColor: AppColor.danger,
            )
          ],
        ),
      ),
    );
  }
}
