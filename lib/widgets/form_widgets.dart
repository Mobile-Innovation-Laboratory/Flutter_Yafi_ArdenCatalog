import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_create_page.dart';
import 'package:billiard_catalog/controller/c_register_page.dart';
import 'package:billiard_catalog/controller/c_update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFieldLargeWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldLargeWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        maxLines: 20,
        minLines: 5,
        textInputAction: TextInputAction.next,
        cursorColor: AppColor.primary,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class FormFieldWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        cursorColor: AppColor.primary,
        textInputAction: TextInputAction.next,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class FormFieldNumberWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldNumberWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        cursorColor: AppColor.primary,
        enabled: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
          ),
          hintStyle: const TextStyle(color: AppColor.placeholder),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: AppColor.primary,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}

class FormFieldPasswordWidgets extends StatelessWidget {
  final String errorMessage, labelText, hintText;
  final TextEditingController controller;
  const FormFieldPasswordWidgets({
    required this.errorMessage,
    required this.labelText,
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.put(C_RegisterPage());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(() => SizedBox(
            height: 65,
            child: TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: controller,
              obscureText: c.showPassword.value,
              cursorColor: AppColor.primary,
              textInputAction: TextInputAction.next,
              enabled: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorMessage;
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                labelText: labelText,
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: AppColor.primary, width: 1.0),
                ),
                hintStyle: const TextStyle(color: AppColor.placeholder),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffix: IconButton(
                    onPressed: () =>
                        {c.showPassword.value = !c.showPassword.value},
                    icon: c.showPassword.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                hintText: hintText,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fillColor: Colors.white,
                focusColor: AppColor.primary,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIconColor: Colors.black,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
          )),
    );
  }
}

class DropDownFieldWidgets extends StatelessWidget {
  const DropDownFieldWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_CreatePage());
    return DropdownButtonFormField(
      isExpanded: true,
      enableFeedback: true,
      value: 'Meja',
      dropdownColor: AppColor.textWhite,
      padding: const EdgeInsets.symmetric(vertical: 8),
      items: const [
        DropdownMenuItem(
          value: 'Meja',
          child: Text('Meja'),
        ),
        DropdownMenuItem(
          value: 'Cue Play',
          child: Text('Cue Play'),
        ),
        DropdownMenuItem(
          value: 'Gloves',
          child: Text('Gloves'),
        ),
      ],
      decoration: InputDecoration(
        filled: true,
        labelText: 'Category',
        hintText: "Select the Catalog Category",
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
        ),
        hintStyle: const TextStyle(color: AppColor.placeholder),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Colors.white,
        focusColor: AppColor.primary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIconColor: Colors.black,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      onChanged: (value) {
        controller.updateDropdownValue(value ?? '');
      },
    );
  }
}

class ImageNotSelected extends StatelessWidget {
  const ImageNotSelected({
    super.key,
    required this.controller,
  });

  final C_CreatePage controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.placeholder,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () => controller.pickImage(),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 42,
                  color: AppColor.textBlack,
                ),
                SizedBox(height: 5),
                Text(
                  "Item Image (1MB)",
                  style: TextStyle(color: AppColor.textBlack),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ImageUpdateNotSelected extends StatelessWidget {
  const ImageUpdateNotSelected({
    super.key,
    required this.controller,
  });

  final C_UpdatePage controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.placeholder,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () => controller.pickImage(),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 42,
                  color: AppColor.textBlack,
                ),
                SizedBox(height: 5),
                Text(
                  "Item Image (1MB)",
                  style: TextStyle(color: AppColor.textBlack),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageSelected extends StatelessWidget {
  const ImageSelected({
    super.key,
    required this.controller,
  });

  final C_CreatePage controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.pickImage(),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          controller.selectedImage.value!,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class ImageUpdatedSelected extends StatelessWidget {
  const ImageUpdatedSelected({
    super.key,
    required this.controller,
  });

  final C_UpdatePage controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.pickImage(),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          controller.selectedImage.value!,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class DropDownUpdateFieldWidgets extends StatelessWidget {
  const DropDownUpdateFieldWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(C_UpdatePage());
    return DropdownButtonFormField(
      isExpanded: true,
      enableFeedback: true,
      value: 'Meja',
      dropdownColor: AppColor.textWhite,
      padding: const EdgeInsets.symmetric(vertical: 8),
      items: const [
        DropdownMenuItem(
          value: 'Meja',
          child: Text('Meja'),
        ),
        DropdownMenuItem(
          value: 'Cue Play',
          child: Text('Cue Play'),
        ),
        DropdownMenuItem(
          value: 'Gloves',
          child: Text('Gloves'),
        ),
      ],
      decoration: InputDecoration(
        filled: true,
        labelText: 'Category',
        hintText: "Select the Catalog Category",
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primary, width: 1.0),
        ),
        hintStyle: const TextStyle(color: AppColor.placeholder),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Colors.white,
        focusColor: AppColor.primary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIconColor: Colors.black,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      onChanged: (value) {
        controller.updateDropdownValue(value ?? '');
      },
    );
  }
}
