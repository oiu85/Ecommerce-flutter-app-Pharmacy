import 'dart:io';

import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/alertexitapp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>
          Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: (){
            Get.toNamed(AppRoute.cart);
          },
          child: const Icon(Icons.shopping_basket_outlined,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(child: controller.listPage.elementAt(controller.currentPage),
            onWillPop: (){
             Get.defaultDialog(
               title: "40".tr,
               titleStyle: const  TextStyle(fontWeight: FontWeight.bold, color: AppColor.redDark),
               middleText: "41".tr,
               onConfirm: (){
                 exit(0);
               },
               onCancel: (){

               },
               cancelTextColor: AppColor.red,
               confirmTextColor: AppColor.primaryColor,
               buttonColor: AppColor.thirdColor,
             );
          return Future.value(true);
            })
      ),
    );
  }
}
