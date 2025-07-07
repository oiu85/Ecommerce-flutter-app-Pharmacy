import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/data/datasource/remote/offers_data.dart';
import 'package:ecommerce_app/data/datasource/remote/test_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

class OffersController extends SearchMixController{

  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];



  getData()async{

    statusRequest = StatusRequest.loading;

    var response = await offersData.getData();

   // await Future.delayed(const Duration(seconds: 3));

    print("========================================Controller  $response");
    statusRequest = handlingData(response);

    if(StatusRequest.success==statusRequest){

      if(response['status']=="success"){

       List listdata2 = response['data'];

       data.addAll(listdata2.map((e)=>ItemsModel.fromJson(e)));

      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

}