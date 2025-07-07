import 'package:ecommerce_app/view/screeen/home.dart';
import 'package:ecommerce_app/view/screeen/offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screeen/notification.dart';
import '../view/screeen/settings.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController{
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    NotificationView(),
     OffersView(),
    const Settings(),
  ];

  List bottomappbar=[
    {
      "title":"60".tr,
      "icon":Icons.home_outlined
    },
    {
      "title":"61".tr,
      "icon":Icons.notifications_active_outlined
    },
    {
      "title":"62".tr,
      "icon":Icons.discount_outlined,
    },
    {
      "title":"63".tr,
      "icon":Icons.settings_outlined
    },
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();

  }

}