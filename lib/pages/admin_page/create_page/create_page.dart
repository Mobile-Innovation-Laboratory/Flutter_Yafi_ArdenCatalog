import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_create_page.dart';
import 'package:billiard_catalog/widgets/button_widgets.dart';
import 'package:billiard_catalog/widgets/form_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CreatePage());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.chevron_left_sharp)),
        title: const Text(
          'Add Catalog',
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              color: AppColor.placeholder,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Obx(() => controller.selectedImage.value != null
                          ? ImageSelected(controller: controller)
                          : ImageNotSelected(controller: controller)),
                      FormFieldWidgets(
                        errorMessage: 'Item Name required!',
                        hintText: 'Item Name',
                        labelText: 'Item Name',
                        controller: controller.c_itemName,
                      ),
                      FormFieldLargeWidgets(
                        errorMessage: 'Item Description required!',
                        hintText: 'Item Description',
                        labelText: 'Item Description',
                        controller: controller.c_itemDesc,
                      ),
                      FormFieldNumberWidgets(
                        errorMessage: 'Item Stock required!',
                        hintText: 'Item Stock',
                        labelText: 'Item Stock',
                        controller: controller.c_itemStock,
                      ),
                      FormFieldNumberWidgets(
                        errorMessage: 'Item Price required!',
                        hintText: 'Item Price',
                        labelText: 'Item Price',
                        controller: controller.c_itemPrice,
                      ),
                      const DropDownFieldWidgets()
                    ],
                  ),
                ),
              ),
            ),
            CustomCreateTextButton(
              normalText: '',
              boldText: 'Tambahkan',
              buttonFunction: () => controller.createData(),
            ),
          ],
        ),
      ),
    );
  }
}
