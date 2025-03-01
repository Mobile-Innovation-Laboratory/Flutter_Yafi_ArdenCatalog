import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Checkout Success!',
                style: TextStyle(fontSize: 24),
              ),
              CustomTextButton(
                  normalText: '',
                  backgroundColor: AppColor.primary,
                  boldText: 'Kembali ke beranda',
                  buttonFunction: () => Get.offAllNamed('/home_page'))
            ],
          ),
        ),
      ),
    );
  }
}
