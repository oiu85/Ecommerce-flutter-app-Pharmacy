

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/items_controller.dart';
import '../../controller/offers_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import '../widget/offers/customitemsoffer.dart';
import 'home.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller2 = Get.put(ItemsControllerImp());
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(builder:
    (controller)=>Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          CustomAppBar(
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
          SizedBox(height: 20,),
          !controller.isSearch ? HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                itemCount: controller.data.length,
                  itemBuilder: (context,index)=>
                      CustomListItemsOffers(itemsModel:
                      controller.data[index]),
              )
          )
              : ListItemsSearch(listdatamodel: controller.listdata),

        ],
      ),
    )
    );
  }
}
