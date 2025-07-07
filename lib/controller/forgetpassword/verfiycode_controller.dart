import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/verfiycode.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../view/widget/dialogwarning.dart';

abstract class VerfiyCodeController extends GetxController{
  checkCode();
  goToRestPassword(String verfiycode);

}
class VerfiyCodeControllerImp extends VerfiyCodeController{
  VerfiyCodeForgetPasswordData verfiyCodeForgetPasswordData = VerfiyCodeForgetPasswordData(Get.find());
  String? email;
  StatusRequest? statusRequest;

  @override
  checkCode() {
  }
  @override
  goToRestPassword(verfiycode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeForgetPasswordData.postData(email! , verfiycode);
    await Future.delayed(const Duration(seconds: 3));
    print("========================================Controller $response==============");
    statusRequest = handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        Get.offNamed(AppRoute.resetPassword,arguments: {"email":email});
      }else{
      //  Get.defaultDialog(title: "44".tr ,middleText: "46".tr); // "Warning  Verfiy Code Not Correct"
        statusRequest = StatusRequest.failure;
        DialogWarning(
          title: "44".tr,
          message: "46".tr,
          titleColor: AppColor.redDark,
          textColor: AppColor.redDark,
          buttonColor: AppColor.redDark,
        ).showWarningDialog();
      }
    }
    update();
    print("valid");
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}