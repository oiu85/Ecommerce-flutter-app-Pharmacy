import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/notification_data.dart';

class NotificationContrller extends GetxController{

  MyServices myServices = Get.find();

  NotificationData notificationData = NotificationData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  getData()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){

        data.addAll(response['data']);
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