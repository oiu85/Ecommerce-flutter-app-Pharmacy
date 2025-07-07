import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/itemsmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

abstract  class HomeController extends SearchMixController{
initialData();
getData();
goToItems(List categories, selectedCat, String categoryid);
goToSubCategories(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();


  String? username;
  String? id;
  String? lang;

  String titelhomeCard= '';
  String bodyhomeCard=  '';
  String deliverytime = '';
  
  HomeData homeData = HomeData(Get.find());

  List data = [];
  List categories = [];
  List items = [];

  List settingsdata=[];

  @override
  initialData(){
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }



  @override
  getData() async{
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    // await Future.delayed(const Duration(seconds: 3));
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      listdata.clear();
      if(response['status']=="success"){
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data'] as Iterable);
        settingsdata.addAll(response['settings']['data']);


        titelhomeCard=settingsdata[0]['settings_titel'];
        bodyhomeCard = settingsdata[0]['settings_body'];
        myServices.sharedPreferences.setString("deliverytime", settingsdata[0]['settings_deliverytime'].toString());
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }




  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsModel": itemsModel});
  }


  @override
  goToItems(categories,selectedCat,categoryid) {
    Get.toNamed(AppRoute.items,
        arguments:{
          "categories":categories,
          "selectedCat":selectedCat,
          "categoryid": categoryid,
        },

     );
    print("success go to selected=======");
  }

  @override
  goToSubCategories(categories, selectedCat,categoryid) {
    Get.toNamed(AppRoute.home2,
      arguments:{
        "categories":categories,
        "selectedCat":selectedCat,
        "categoryid": categoryid,
      },

    );
    print("success go to selected====================================");
  }


  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

}

//========================

class SearchMixController extends GetxController{
  List <ItemsModel> listdata=[];
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  bool isSearch=false;
  TextEditingController? search;
  checkSearch(val){
    if(val==""){
      statusRequest = StatusRequest.none;
      isSearch =false;
    }
    update();
  }

  onSearchItems(){
    if(search!.text.isEmpty) {
      isSearch = false;
      listdata.clear();
      update();
      return;
    }
    isSearch = true;
    listdata.clear();
    searchData();
    update();
  }
  searchData() async{
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    // await Future.delayed(const Duration(seconds: 3));
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List resbosedata= response['data'];
        listdata.addAll(resbosedata.map((e)=>ItemsModel.fromJson(e)));
      }
      else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}



