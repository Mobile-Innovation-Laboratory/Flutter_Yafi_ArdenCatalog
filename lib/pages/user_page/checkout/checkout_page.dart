import 'package:billiard_catalog/controller/c_checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CheckoutPage());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/lottie_success.json',
                  repeat: false, width: 300, height: 300),
                  const Text('Checkout Success!', style: TextStyle(fontSize: 24),)
            ],
          ),
        ),
      ),
    );
  }
}
