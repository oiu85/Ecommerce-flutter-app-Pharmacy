import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

 alertExitApp(){
  return Get.defaultDialog(
    title: "40".tr,
    middleText: "41".tr,
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: Text("42".tr)),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("43".tr)),

    ],
  );
}