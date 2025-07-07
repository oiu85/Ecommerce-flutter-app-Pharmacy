import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home2_data.dart';
import 'package:ecommerce_app/data/model/home2model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/data/model/itemsmodel.dart';

abstract class Home2Controller extends GetxController {
  initialData();
  getSubCategories(String categoryId);
  goToItems(List subcategories, int selectedCat, String categoryid);
  checkSearch(String val);
  onSearchItems();
}

class Home2ControllerImp extends Home2Controller {
  Home2Data home2Data = Home2Data(Get.find());
  
  List categories = [];
  String? categoryid;
  int? selectedCat;
  
  List subcategories = [];
  List subcategoriesSearch = [];
  List<ItemsModel> listdata = []; // إضافة قائمة للمنتجات
  
  late StatusRequest statusRequest;
  
  TextEditingController? search;
  bool isSearch = false;
  
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    categoryid = Get.arguments['categoryid'].toString();
    getSubCategories(categoryid!);
  }

  @override
  getSubCategories(categoryId) async {
      subcategories = [];
  statusRequest = StatusRequest.loading;
  update();
  
  var response = await home2Data.getData(categoryId);
  print("Response: $response");
  statusRequest = handlingData(response);
  
  if (StatusRequest.success == statusRequest) {
    if (response['status'] == "success" && 
        response['categories'] != null && 
        response['categories']['data'] != null) {
          print(response);
      List responsedata = response['categories']['data'];
      subcategories.addAll(responsedata.map((e) => Home2Model.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
  }
  update();
  }

  @override
  goToItems(subcategories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "subcategoryid": subcategories[selectedCat].subcategoryId.toString(),
      "categoryid": subcategories[selectedCat].subcategoryId.toString() // استخدام subcategoryId بدلاً من categoryid
    });
  }

  @override
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      subcategoriesSearch = [];
      listdata.clear(); // مسح نتائج البحث السابقة
      statusRequest = StatusRequest.none;
    }
    update();
  }

  @override
  onSearchItems() {
    if(search!.text.isEmpty) {
      isSearch = false;
      listdata.clear();
      update();
      return;
    }
    isSearch = true;
    listdata.clear(); // مسح النتائج السابقة
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    
    // استخدام دالة البحث من HomeData
    var response = await home2Data.searchData(search!.text);
    print("Search Response: $response");
    statusRequest = handlingData(response);
    
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    search!.dispose();
    super.dispose();
  }
}