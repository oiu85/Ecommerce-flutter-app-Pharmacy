import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitelauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/coustomtextformauth.dart';
import '../../widget/auth/custombuttomauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   // ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    Get.lazyPut(()=>ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Reset Password",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),),
      ),
      body:GetBuilder<ResetPasswordControllerImp>(builder: (controller)=>
          GetBuilder<ResetPasswordControllerImp>(
            builder: (controller)=>
                HandlingDataRequest( statusRequest: controller.statusRequest,
                  widget:Container(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Form(
                              key: controller.formstate,
                              child: ListView(
                                children:[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.lock_reset,
                      size: 80,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextTitelAuth(text: '26'.tr,), //New Password
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColor.primaryColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: CustomTextBodyAuth(bodyText: "27".tr), //"Please Enter New Password"
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFormAuth(
                    isNumber: false,
                    // isNumber: false,
                    valid: (val){
                      return validInput(val!, 5, 30, "password");
                    },
                    hintText: "5".tr, //"Enter Your Password"
                    labelText: "Password",
                    iconDate: Icons.lock_outlined,
                    mycontroller: controller.password,
                  ),
                  const SizedBox(height: 5,),
                  CustomTextFormAuth(
                    isNumber: false,
                    // isNumber: false,
                    valid: (val){
                      return validInput(val!, 5, 30, "password");
                    },
                    hintText: "29".tr, //" ReEnter Your Password"
                    labelText: "Password",
                    iconDate: Icons.lock_outlined,
                    mycontroller: controller.repassword,
                  ),
                  const SizedBox(height: 25,),
                  CustomButtomAuth(
                    text:"28".tr,//Save
                    onPressed: (){
                      controller.goToSuccessResetPassword();
                    },
                  ),
                                ],
                              ),
                      ),
                    ),
                ),
          )),
    );
  }
}
