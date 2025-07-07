import 'package:ecommerce_app/data/datasource/remote/orders/archive_data.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';

class OrdersArchiveController extends GetxController{



  List categories = [];
  String? catid;
  int? selectedCat;
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val){
    if(val == "0"){
      return "137".tr; //Delivery
    }else {
      return "138".tr; //Local
    }
  }

  String printPaymentMethod(String val){
    if(val == "0"){
      return "139".tr; //Cash On Delivery
    }else {
      return "140".tr; //Syriatel Cash
    }
  }

  String printOrdersStatus(String val){
    if(val == "0"){
      return "141".tr; //Pending Approval
    }else if(val == "1"){
      return "142".tr; //The Order is Being Prepared
    }else if(val == "2"){
      return "Ready To Pickup By Delivery Man"; //On The Way
    }else if(val == "3"){
      return "On The Way"; //On The Way
    }else{
      return "144".tr; //Archive
    }
  }


  getOrders()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.getData(myServices.sharedPreferences.getString("id")!);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listdata = response['data'];
        data.addAll(listdata.map((e)=>OrdersModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }


  SubmitRating(String ordersid, String comment, double rating)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData.rating(ordersid, comment, rating.toString());
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        getOrders();
      }
      else{
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  refreshOrder(){
    getOrders();
  }




  @override
  void onInit() {
    getOrders();
    super.onInit();
  }




}