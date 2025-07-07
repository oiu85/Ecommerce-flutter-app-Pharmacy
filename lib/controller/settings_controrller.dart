import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/users_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/model/usersmodel.dart';

class SettingsController extends GetxController{

MyServices myServices = Get.find();
List<UsersModel>data = [];
late StatusRequest statusRequest;
UsersData usersData = UsersData(Get.find());



  logout(){
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

getData()async{
  statusRequest = StatusRequest.loading;

  var response = await usersData.getData();
  print("========================================Controller  $response");
  statusRequest = handlingData(response);
  if(StatusRequest.success==statusRequest){
    if(response['status']=="success"){

      List datalist = response['data'];
      data.addAll(datalist.map((e) => UsersModel.fromJson(e)).toList());
    }

    else{
      statusRequest = StatusRequest.failure;
    }
  }
  update();
}

@override
  void onInit() {
    getData();
    super.onInit();
  }

}