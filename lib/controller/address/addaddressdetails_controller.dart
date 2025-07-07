
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/NotificationService.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

class AddAddressDetailsController extends GetxController{

String? lat;
String? long;
TextEditingController? name;
TextEditingController? city ;
TextEditingController? street;
TextEditingController? note;

  StatusRequest statusRequest = StatusRequest.none;
AddressData addressData = AddressData(Get.find());


NotificationService notificationService = Get.find();
MyServices myServices = Get.find();
  intialData(){
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    note = TextEditingController();

    lat = Get.arguments["lat"];
    long= Get.arguments["long"];
    print("================$lat==========");
    print("================$long==========");

  }

addAddress()async{

    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        note!.text,
        lat!,
        long!);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        Get.offAllNamed(AppRoute.homepage);
        notificationService.showErrorNotification(title: "Good".tr, message: "Now, You Can Orders To This Address");
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
}

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

}