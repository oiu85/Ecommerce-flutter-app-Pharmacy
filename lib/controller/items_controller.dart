import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/items_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/home_data.dart';
import 'home_controller.dart';

abstract class ItemsController extends SearchMixController{
intialData();
changeCat(int val,String catval);
getItems(String categoryid);
goToPageProductDetails(ItemsModel itemsModel);
}
class ItemsControllerImp extends ItemsController {

  List categories = [];
  String? catid;
  int? selectedCat;
  ItemsData testData = ItemsData(Get.find());

  List data = [];

  String deliverytime="";
   MyServices myServices = Get.find();

  @override
  void onInit() {
    search =TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    search;
    super.dispose();
  }

  @override
  @override
  @override
  intialData() {
    deliverytime = myServices.sharedPreferences.getString("deliverytime")!;
    // التحقق من وجود البيانات قبل استخدامها
    if (Get.arguments != null) {
      print("Get.arguments: ${Get.arguments}"); // طباعة جميع الوسائط المستلمة
      
      // استخدام الوسيطات التي تم تمريرها من home2_controller
      if (Get.arguments.containsKey('subcategoryid') && Get.arguments.containsKey('categoryid')) {
        print("تم استلام categoryid: ${Get.arguments['categoryid']}");
        // استخدام معرف القسم الفرعي للحصول على المنتجات
        catid = Get.arguments['categoryid'];
        getItems(catid!);
      } 
      // التعامل مع الوسيطات القديمة للحفاظ على التوافق
      else if (Get.arguments.containsKey('categories') && 
               Get.arguments.containsKey('selectedCat') && 
               Get.arguments.containsKey('categoryid')) {
        categories = Get.arguments['categories'] ?? [];
        selectedCat = Get.arguments['selectedCat'];
        catid = Get.arguments['categoryid'];
        
        if (catid != null) {
          getItems(catid!);
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }



  @override
  getItems(categoryid) async {
    print("Sending categoryid: $categoryid, userid: ${myServices.sharedPreferences.getString("id")}");
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    
    try {
      var response = await testData.getData(categoryid, myServices.sharedPreferences.getString("id")!);
      print("Response from server: $response");
      
      if (response is String) {
        print("Error: Response is a string - $response");
        statusRequest = StatusRequest.serverfailuer;
      } else {
        statusRequest = handlingData(response);
        
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            if (response['data'] != null && response['data'] is List && response['data'].isNotEmpty) {
              data.addAll(response['data']);
            } else {
              print("لا توجد بيانات متاحة أو تنسيق البيانات غير صحيح");
              statusRequest = StatusRequest.failure;
            }
          } else {
            statusRequest = StatusRequest.failure;
          }
        }
      }
    } catch (e) {
      print("حدث خطأ أثناء جلب البيانات: $e");
      statusRequest = StatusRequest.serverfailuer;
    }
    
    update();
  }


  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsModel": itemsModel});
  }







}
