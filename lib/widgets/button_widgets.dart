import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_create_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  final Function buttonFunction;
  final IconData buttonIcon;
  final Color iconColor, backgroundColor;
  const CustomIconButton({
    required this.buttonIcon,
    required this.buttonFunction,
    required this.iconColor,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => buttonFunction(),
        icon: Icon(
          buttonIcon,
          color: iconColor,
        ),
        color: AppColor.textWhite,
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ));
  }
}

class CustomTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  final Color backgroundColor;
  const CustomTextButton(
      {super.key,
      required this.normalText,
      required this.backgroundColor,
      required this.boldText,
      required this.buttonFunction});
  @override
  Widget build(BuildContext context) {
    final isLoading = false.obs;
    return InkWell(
      onTap: () {
        isLoading.value = true;
        buttonFunction();
        isLoading.value = false;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              normalText,
            ),
            const SizedBox(
              width: 5,
            ),
            isLoading.value
                ? const CircularProgressIndicator(
                    color: AppColor.textWhite,
                  )
                : Text(
                    boldText,
                    style: const TextStyle(color: AppColor.textWhite),
                  )
          ],
        ),
      ),
    );
  }
}

class CustomCreateTextButton extends StatelessWidget {
  final String normalText, boldText;
  final Function buttonFunction;
  const CustomCreateTextButton(
      {super.key,
      required this.normalText,
      required this.boldText,
      required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CreatePage());
    return InkWell(
      onTap: () {
        buttonFunction();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              normalText,
            ),
            const SizedBox(
              width: 5,
            ),
            controller.isLoading.value
                ? const CircularProgressIndicator(
                    color: AppColor.textWhite,
                  )
                : Text(
                    boldText,
                    style: const TextStyle(color: AppColor.textWhite),
                  )
          ],
        ),
      ),
    );
  }
}
