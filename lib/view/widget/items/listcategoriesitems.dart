import 'package:ecommerce_app/core/functions/translatedatabase.dart';
import 'package:ecommerce_app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: Responsive.h(200),
      child: ListView.separated(
        separatorBuilder: (context, index) =>  SizedBox(width: Responsive.w(20),),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i : index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // controller.goToItems(controller.categories,i!);
        controller.changeCat(i!, categoriesModel.categoriesId!.toString());
      },
      child: Column(
        children: [

          GetBuilder<ItemsControllerImp>(
            builder: (controller)=>
                Container(
              padding:  EdgeInsets.only(right: Responsive.padding(20), left: Responsive.padding(20), bottom: Responsive.padding(10)),
              decoration: controller.selectedCat ==i?   BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: Responsive.w(6),color: AppColor.primaryColor)
                ),
              ):null,
              child: Text(
                  "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style:  TextStyle(fontSize: Responsive.font(44),color: AppColor.grey2,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

