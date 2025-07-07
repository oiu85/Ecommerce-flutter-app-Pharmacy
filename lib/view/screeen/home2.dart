import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home2_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/home2model.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:ecommerce_app/view/screeen/home.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';


class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Home2ControllerImp());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, AppColor.primaryColor.withOpacity(0.05)],
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: GetBuilder<Home2ControllerImp>(
          builder: (controller) => ListView(
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
              const SizedBox(height: 20),
              !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Text(
                            "76".tr,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.subcategories.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index) {
                              return SubCategoryCard(
                                home2Model: controller.subcategories[index],
                                index: index,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColor.primaryColor.withOpacity(0.2),
                                AppColor.primaryColor.withOpacity(0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Search Results",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListItemsSearch(listdatamodel: controller.listdata),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoryCard extends GetView<Home2ControllerImp> {
  final Home2Model home2Model;
  final int index;
  const SubCategoryCard({super.key, required this.home2Model, required this.index});

  @override
  Widget build(BuildContext context) {
    // تحديد اللون بناءً على معرف القسم الرئيسي
    Color primaryColor;
    Color secondaryColor;
    
    // استخدام معرف القسم الرئيسي لتحديد اللون
    switch(home2Model.categoryId) {
      case 1:
        primaryColor = Colors.green;
        secondaryColor = Colors.green.shade100;
        break;
      case 2:
        primaryColor = Colors.blue;
        secondaryColor = Colors.blue.shade100;
        break;
      case 3:
        primaryColor = Colors.orange;
        secondaryColor = Colors.orange.shade100;
        break;
      case 4:
        primaryColor = Colors.purple;
        secondaryColor = Colors.purple.shade100;
        break;
      case 5:
        primaryColor = Colors.red;
        secondaryColor = Colors.red.shade100;
        break;
      case 6:
        primaryColor = Colors.black26;
        secondaryColor = Colors.yellow.shade100;
        break;
      case 7:
        primaryColor = const Color(0xff8E383B);
        secondaryColor = Colors.blue.shade100;
        break;
      case 8:
        primaryColor = const Color(0x0f29c733);
        secondaryColor = Colors.green.shade100;
        break;
      case 9:
        primaryColor =const Color(0xff3d66c7);
        secondaryColor = Colors.red.shade100;
        break;
      case 10:
        primaryColor = const Color(0xff81621a);
        secondaryColor = Colors.red.shade100;
        break;
      default:
        primaryColor = const Color(0xffdcffe4);
        secondaryColor = const Color(0xff127e40).withOpacity(0.1);
    }
    
    return InkWell(
      onTap: () {
        controller.goToItems(
          controller.subcategories, 
          index, 
          home2Model.categoryId.toString()
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              secondaryColor.withOpacity(0.3),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: "subcategory-${home2Model.subcategoryId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesubcategories}/${home2Model.subcategoryImage}",
                    height: 100,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    primaryColor.withOpacity(0.3),
                    primaryColor.withOpacity(0.1),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                translateDatabase(
                  home2Model.subcategoryNameAr,
                  home2Model.subcategoryName,
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListSubCategoriesSearch extends GetView<Home2ControllerImp> {
  final List listSubCategoriesSearch;
  const ListSubCategoriesSearch({super.key, required this.listSubCategoriesSearch});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listSubCategoriesSearch.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToItems(
              controller.subcategories,
              index,
              listSubCategoriesSearch[index].categoryId.toString(),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              leading: Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesubcategories}/${listSubCategoriesSearch[index].subcategoryImage}",
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  ),
                ),
              ),
              title: Text(
                translateDatabase(
                  listSubCategoriesSearch[index].subcategoryNameAr,
                  listSubCategoriesSearch[index].subcategoryName,
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.primaryColor,
                size: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
