import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_login_page.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:billiard_catalog/widgets/form_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_LoginPage());
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
              height: 400,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Please Sign In to continue.',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormFieldWidgets(
                            errorMessage: '',
                            labelText: 'Username',
                            hintText: 'Masukkan Username Kamu',
                            controller: controller.c_username),
                        FormFieldPasswordWidgets(
                            errorMessage: '',
                            labelText: 'Password',
                            hintText: 'Masukkan Password Kamu',
                            controller: controller.c_password),
                        CustomTextButton(
                            backgroundColor: AppColor.primary,
                            normalText: '',
                            boldText: 'Masuk',
                            buttonFunction: () {
                              controller.loginUser();
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don \'t have account?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () => Get.offAndToNamed('/register_page'),
                              child: const Text(
                                ' Sign Up here',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.textBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
