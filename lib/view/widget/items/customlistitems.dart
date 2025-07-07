import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Responsive.radius(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Responsive.h(237),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Responsive.radius(30)),
                              topRight: Radius.circular(Responsive.radius(30)),
                            ),
                          ),
                          child: Hero(
                            tag: "${itemsModel.itemsId}",
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Responsive.radius(30)),
                                topRight: Radius.circular(Responsive.radius(30)),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                "${AppLink.imageItems}/${itemsModel.itemsImage!}",
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(Responsive.padding(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translateDatabase(
                                itemsModel.itemsNameAr, itemsModel.itemsName),
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: Responsive.font(32),
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: Responsive.h(16)),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: Responsive.margin(6)),
                                child: const Icon(
                                  Icons.timer_sharp,
                                  color: AppColor.grey,
                                ),
                              ),
                              SizedBox(width: Responsive.w(8)),
                              Text(
                                "${controller.deliverytime} Minutes",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: "sans",
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Responsive.h(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${itemsModel.itemspricediscount!}\$",
                                    style: TextStyle(
                                      fontSize: Responsive.font(28),
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                  if (itemsModel.itemsDiscount != 0)
                                    SizedBox(height: Responsive.h(6)),
                                  if (itemsModel.itemsDiscount != 0)
                                    Text(
                                      "${itemsModel.itemsPrice!}\$",
                                      style: TextStyle(
                                        fontSize: Responsive.font(22),
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                ],
                              ),
                              GetBuilder<FavoriteController>(
                                builder: (controller) => IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    if (controller.isFavorite[itemsModel.itemsId] == "1") {
                                      controller.setFavorite(itemsModel.itemsId, "0");
                                      controller.removeFavorite(
                                          itemsModel.itemsId!.toString());
                                    } else {
                                      controller.setFavorite(itemsModel.itemsId, "1");
                                      controller.addFavorite(
                                          itemsModel.itemsId!.toString());
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId] == "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                    size: Responsive.icon(40),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (itemsModel.itemsDiscount != 0)
            Positioned(
              top: 8,
              left: 8,
              child: Image.asset(
                AppImageAsset.discountImage,
                width: Responsive.w(100),
              ),
            ),
        ],
      ),
    );
  }
}
