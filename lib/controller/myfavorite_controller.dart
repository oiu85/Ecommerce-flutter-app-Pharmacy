import 'package:ecommerce_app/core/services/NotificationService.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/model/myfavorite.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  NotificationService notificationService = Get.find<NotificationService>();

  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    // Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e)=> MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    //End
    update();
  }

  deleteFromFavorite(String favoriteid) async {
    // تغيير الحالة إلى تحميل
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.deleteData(favoriteid);
    print("========================================Controller  $response");
    if (response != null && response['status'] == "success") {
      // حذف  من القائمة
      data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
      statusRequest = StatusRequest.success;
      print("Done deleted the remain items ${data.length}");
    } else {
      // في حالة فشل
      statusRequest = StatusRequest.failure;
      print("فشل في حذف العنصر");
    }

    // تحديث الواجهة
    update();
    notificationService.showErrorNotification(title: "71".tr, message: "Item has been deleted successfully");
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
