import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';

class OrdersPendingController extends GetxController{



  List categories = [];
  String? catid;
  int? selectedCat;
  OrdersPendingData oredersPendingData = OrdersPendingData(Get.find());

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
      return "300".tr;
    }else if(val == "3"){
      return "143".tr; //On The Way
    }
    else if (val == "-1"){
      return "Rejected";
    }else{
      return "144".tr; //Archive
    }
  }
  getOrders()async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await oredersPendingData.getData(myServices.sharedPreferences.getString("id")!);
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

  deleteOrders(String orderid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await oredersPendingData.deleteData(orderid);
    print("=====delete response ====Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        refreshOrder();
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


    refreshOrder(){
      getOrders();
    }

    goToPageTracking(OrdersModel ordersmodel){
      Get.toNamed(AppRoute.tracking, arguments: {
        "ordersmodel" : ordersmodel,

      });
    }


  @override
  void onInit() {
    getOrders();
    super.onInit();
  }




}