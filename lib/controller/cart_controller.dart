import 'package:ecommerce_app/data/model/cartmodel.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/couponmodel.dart';
import 'package:ecommerce_app/view/widget/dialogwarning.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/NotificationService.dart';
import '../core/services/services.dart';

class CartController extends GetxController {




  TextEditingController? controllercoupon;

  NotificationService notificationService = Get.find<NotificationService>();

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  CouponModel? couponModel;
  
  int discountcoupon = 0;
  
  String? couponname;
  String? couponid;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;


  add(String itemsid) async {
    update();
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    // Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        notificationService.showSuccessNotification(title: "71".tr, message: "73".tr); // warning , done adding product to cart
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    //End
  }

  delete(String itemsid) async {
    update();
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    // Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        notificationService.showErrorNotification(title: "71".tr, message: "74".tr); //warning , done deleting product from cart
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    //End
  }


  resetVarCart(){
    totalcountitems = 0;
    priceorders = 0.0 ;
    data.clear();
  }
  refreshPage(){
    resetVarCart();
    view();
    update();
  }

  view()async{
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    // Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if(response["datacart"]['status'] == 'success'){
          List dataresponse = response["datacart"]['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e)=>CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount'].toString());

          var totalPrice = dataresponsecountprice['totalprice'];  // معالجة السعر الإجمالي بغض النظر عن نوع البيانات
          priceorders = totalPrice is double 
              ? totalPrice 
              : double.parse(totalPrice.toString());

        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageCheckout(){
    if(data.isEmpty) return notificationService.showErrorNotification(title: "71".tr, message: "91".tr); // warning ,  Your Cart Is Empty
    if(!data.isEmpty) {
      Get.toNamed(AppRoute.checkout,arguments: {
      "couponid":couponid ?? "0",
      "priceorders": priceorders.toString(),
        "discountcoupon": discountcoupon.toString(),

    });
    }
  }


  getTotalPrice(){
    return( (priceorders - priceorders * discountcoupon! /100)+10000);
  }

  checkCoupon()async{
    update();
    statusRequest = StatusRequest.loading;
    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);
    // Start Backend
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       Map<String,dynamic> datacoupon = response['data'];
       couponModel = CouponModel.fromJson(datacoupon);
       discountcoupon  = int.parse(couponModel!.couponDiscount!.toString());
       couponname = couponModel!.couponName;
       couponid = couponModel!.couponId.toString();
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        notificationService.showErrorNotification(title: "93".tr, message: "92".tr); //Warning , coupon not found
      }
    }
    update();
    //End
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    update();
    super.onInit();
  }

}
