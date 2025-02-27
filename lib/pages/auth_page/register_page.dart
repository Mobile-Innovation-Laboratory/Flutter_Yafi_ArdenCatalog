import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_register_page.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:billiard_catalog/widgets/form_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_RegisterPage());
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
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
                            'Register',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Please Sign Up to continue.',
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
                            labelText: 'Email',
                            hintText: 'Masukkan Email Kamu',
                            controller: controller.c_email),
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
                            boldText: 'Daftar',
                            buttonFunction: () => controller.createData()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () => Get.offAndToNamed('/login_page'),
                              child: const Text(
                                ' Sign In here',
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
