import 'package:billiard_catalog/color/color.dart';
import 'package:billiard_catalog/controller/c_admin_dashboard.dart';
import 'package:billiard_catalog/controller/c_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final controller = Get.put(C_AdminDashboard());

class TitleItem extends StatelessWidget {
  const TitleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Item & Category',
              style: TextStyle(color: AppColor.textWhite, fontSize: 18),
            ),
            Text(
              'Stock',
              style: TextStyle(color: AppColor.textWhite, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailController = Get.put(C_DetailPage());
    return Obx(() {
      if (controller.catalogList.isEmpty) {
        return const Center(child: Text("No Catalog Found"));
      }
      return Expanded(
        child: detailController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                shrinkWrap: true,
                itemCount: controller.catalogList.length,
                itemBuilder: (context, index) {
                  final item = controller.catalogList[index];
                  return Dismissible(
                      key: Key(item.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        decoration: const BoxDecoration(
                            color: AppColor.danger,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        child:
                            const Icon(Icons.delete, color: AppColor.textWhite),
                      ),
                      onDismissed: (direction) {
                        controller.deleteCatalog(item.id);
                      },
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          tileColor: AppColor.textWhite,
                          enableFeedback: true,
                          title: Text(item.itemName),
                          subtitle: Text(item.itemCategory),
                          trailing: Text(
                            item.itemStock,
                            style: const TextStyle(fontSize: 20),
                          ),
                          onTap: () =>
                              detailController.fetchSpecificCatalog(item.id),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: AppColor.textBlack),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                      ));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
      );
    });
  }
}

class FloatingActionButtonCreate extends StatelessWidget {
  const FloatingActionButtonCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed('/create_page'),
      backgroundColor: AppColor.primary,
      elevation: 8,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
