import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:ecommerce_app/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/items/customlistitems.dart';
import 'home.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());
   ItemsControllerImp controller = Get.put(ItemsControllerImp());
    Get.lazyPut(() => ItemsControllerImp());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => CustomAppBar(
                mycontroller: controller.search!,
                titleappbar: "51".tr,
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
              ),
            ),
            const SizedBox(height: 20),
            //const ListCategoriesItems(),
            const SizedBox(height: 15),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GridView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavorite[controller.data[index]['items_id']] =
                                controller.data[index]['favorite'];
                            return TweenAnimationBuilder(
                              duration: Duration(milliseconds: 300 + (index * 50)), // تسريع الانيميشن
                              curve: Curves.easeInOut, // إضافة منحنى حركة أكثر سلاسة
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (context, double value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: CustomListItems(
                                    itemsModel: ItemsModel.fromJson(controller.data[index]),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
