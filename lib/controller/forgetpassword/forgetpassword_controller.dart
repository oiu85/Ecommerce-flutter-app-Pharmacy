import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;

  @override
  checkemail() async{
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      await Future.delayed(const Duration(seconds: 3));
      print("========================================Controller $response=======================================");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          Get.offNamed(AppRoute.verfiyCode, arguments: {"email":email.text} );
        }else{
          Get.defaultDialog(title: "44".tr ,middleText: "48".tr); // "Warning  Email Not Exists"
          statusRequest = StatusRequest.failure;
        }
      }
      update();
      print("valid");


    }else
    {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}