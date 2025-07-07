import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';

abstract class onBoardingController extends GetxController{
  next();
  onPageChanged(int index);
}
class onBoardingControllerImp extends onBoardingController{

  final PageController pageController = PageController();
  int cuurentPage=0;

  MyServices myServices = Get.find();
  @override
  next() {
    cuurentPage++;
    if(cuurentPage>onBoardingList.length-1){
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    }else{
      pageController.animateToPage(cuurentPage, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    cuurentPage = index;
    update();
  }
  @override
  void dispose() {
    pageController.dispose(); // تنظيف الموارد
    super.dispose();
  }
}