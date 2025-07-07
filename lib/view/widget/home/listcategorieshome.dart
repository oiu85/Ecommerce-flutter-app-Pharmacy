import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';
import '../../../core/functions/translatedatabase.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Responsive.h(400), // ارتفاع مناسب للصفين
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الصفوف
              crossAxisSpacing: 12, // المسافة بين الصفوف
              mainAxisSpacing: 12, // المسافة بين العناصر في نفس الصف
              childAspectRatio: 0.7, // نسبة العرض إلى الارتفاع
            ),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Categories(
                i: index,
                categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: Responsive.margin(4)),
      child: InkWell(
        borderRadius: BorderRadius.circular(Responsive.radius(25)),
        onTap: () {
          controller.goToSubCategories(controller.categories, i!, categoriesModel.categoriesId!.toString());
         // Get.toNamed(AppRoute.home2);
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding:  EdgeInsets.all(Responsive.padding(15)),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF1FF),
                  borderRadius: BorderRadius.circular(Responsive.radius(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Responsive.radius(24)),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[50],
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[50],
                      child: Icon(Icons.error_outline, color: Colors.red[300]),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(4)),
              child: Text(
                "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style:  TextStyle(
                  fontSize: Responsive.font(22),
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}