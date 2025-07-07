import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToSignIn();

}
class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;

   StatusRequest statusRequest = StatusRequest.none;
  bool isShowPassword=true;

  showPassword(){
    isShowPassword= isShowPassword==true?false:true;
    update();
  }


  SignUpData signupData = SignUpData(Get.find());

  List data = [];

  @override
  signUp() async{

    var formdata = formstate.currentState;
    if(formdata!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(username.text, password.text, email.text, phone.text);
      await Future.delayed(const Duration(seconds: 3));
      print("========================================Controller $response==============");
      statusRequest = handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){

          // data.addAll(response['data']);

          Get.offNamed(AppRoute.verfiyCodeSignUp,arguments: {"email":email.text} );
        }else{
          Get.defaultDialog(title: "44".tr ,middleText: "45".tr); // Warning   Phone Number Or Email Already Exists
          statusRequest = StatusRequest.serverfailuer;
        }
      }
      update();
      print("valid");


     // Get.delete<SignUpControllerImp>(); //when i use routes in map not in get x this line is work to dispose the information in the text form filed after moving to another page And instead of it we use lazy.put()
    }else {
      print("not valid");
    }
  }
  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

}