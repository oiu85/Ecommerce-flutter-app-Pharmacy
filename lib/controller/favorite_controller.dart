import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/NotificationService.dart';
import '../core/services/services.dart';

class FavoriteController extends GetxController{

  FavoriteData favoriteData = FavoriteData(Get.find());
  NotificationService notificationService = Get.find<NotificationService>();
  List data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();


  Map isFavorite = {};
  // key => id items
  // value =>  1 OR 0
  setFavorite(id, val ){
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(myServices.sharedPreferences.getString("id")!,itemsid);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    // Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        notificationService.showSuccessNotification(title: "71".tr, message: "69".tr); //notification // done adding product to favorite
       // data.addAll(response['data']);
      }
      else {
        statusRequest = StatusRequest.failure;
      }
    }
  //End
  }


  removeFavorite(String itemsid)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(myServices.sharedPreferences.getString("id")!,itemsid);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    //Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        notificationService.showSuccessNotification(title: "71".tr, message: "70".tr); //notification // done removing product from favorite
      //  data.addAll(response['data']);
      }
      else {
        statusRequest = StatusRequest.failure;
      }
    }
    //End
  }














}