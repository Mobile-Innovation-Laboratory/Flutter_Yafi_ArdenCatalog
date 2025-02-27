import 'dart:convert';

import 'package:billiard_catalog/controller/c_cart_page.dart';
import 'package:billiard_catalog/controller/c_detail_page.dart';
import 'package:billiard_catalog/widgets/cart_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:billiard_catalog/color/color.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final controller = Get.put(C_DetailPage());
    final cartController = Get.put(C_CartPage());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.chevron_left_sharp)),
        title: Text(
          args['itemName'],
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        centerTitle: true,
        actions: [
          controller.userStatus.value == 1
              ? IconButton(
                  onPressed: () =>
                      controller.fetchSpecificCatalogToUpdate(args['id']),
                  icon: const Icon(Icons.edit))
              : const SizedBox()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainContent(args: args),
            CustomCreateCartTextButton(
                normalText: '',
                boldText: 'Tambahkan Keranjang',
                buttonFunction: () {
                  cartController.createData(args['itemName'], args['itemPrice'],
                      args['id'], args['imagePath']);
                })
          ],
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.args,
  });

  final Map<String, dynamic> args;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.memory(
            base64Decode(args['imagePath']),
            fit: BoxFit.contain,
            width: double.infinity,
            height: 250,
          ),
          Text(
            args['itemName'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            'Rp ${args['itemPrice']}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Deskripsi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 200,
            child: Expanded(
              child: Text(
                args['itemDesc'],
                style: const TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
