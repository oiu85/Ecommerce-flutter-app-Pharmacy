import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';
import '../../../linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.h(340),
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding:  EdgeInsets.symmetric(vertical: Responsive.padding(20)),
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.items[i]),
            index: i,
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  final int index;
  const ItemsHome({super.key, required this.itemsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.goToPageProductDetails(itemsModel);
      },
      child: Container(
        width: Responsive.w(300),
        margin:  EdgeInsets.symmetric(horizontal: Responsive.margin(16)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Responsive.radius(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // صورة المنتج مع تأثير الانتقال
            ClipRRect(
                borderRadius: BorderRadius.circular(Responsive.radius(30)),
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                  height: 160,
                  width: 220,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[100],
                    child: const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),


            // طبقة التظليل المتدرجة
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Responsive.radius(30)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.4, 0.7, 1.0],
                ),
              ),
              height: 160,
              width: 220,
            ),

            // معلومات المنتج
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:  EdgeInsets.all(Responsive.padding(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                     SizedBox(height: Responsive.h(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemsModel.itemsPrice} \$",
                          style:  TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive.font(30),
                          ),
                        ),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(16), vertical: Responsive.padding(8)),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(Responsive.radius(20)),
                          ),
                          child:  Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                            size: Responsive.icon(30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
