import 'package:ecommerce_app/core/constant/apptheme.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../functions/fcmconfig.dart';
import '../services/NotificationService.dart';

class LocalController extends GetxController{
  NotificationService notificationService = Get.find<NotificationService>();
   Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar"? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }
  requestPerLocation()async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return notificationService.showErrorNotification(title: "71".tr, message: "Please Turn-on Location");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return notificationService.showErrorNotification(title: "71".tr, message: "Please Turn-on give permission ti access location");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return notificationService.showErrorNotification(title: "71".tr, message: "Can't use maps without give location permission ");

    }

  }

   @override
  void onInit() {
     requestPermissionNotification();
     fcmconfig();
     requestPerLocation();
    String? sharedPrefLang= myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang=="ar"){
      language = const Locale("ar");
      appTheme = themeArabic;
    }else if(sharedPrefLang=="en"){
      language = const Locale("en");
      appTheme = themeEnglish;
    }else{
        language = Locale(Get.deviceLocale!.languageCode);
        appTheme = themeEnglish;
      }
    super.onInit();
  }
}