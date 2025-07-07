import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitelauth.dart';
import 'package:ecommerce_app/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>LoginControllerImp());
  //  LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Sign In",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),),
      ),
      body:GetBuilder<LoginControllerImp>(builder: (controller)=>PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, bool? result) async {
          if (!didPop) {
            alertExitApp();
          }
        },
       child: GetBuilder<LoginControllerImp>(
    builder:  (controller)=>HandlingDataRequest(statusRequest:  controller.statusRequest,
    widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
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
              shrinkWrap: true,
              children:[
                const LogoAuth(),
                CustomTextTitelAuth(text: '2'.tr,),
                const SizedBox(height: 3,),
                CustomTextBodyAuth(bodyText: "3".tr),
                const SizedBox(height: 8,),
                CustomTextFormAuth(
                  isNumber: false,
                  // isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 100, "email");
                  },
                  hintText: "4".tr,// "Enter Your Email"
                  labelText: "Email",
                  iconDate: Icons.email_outlined,
                  mycontroller: controller.email,
                ),
                GetBuilder<LoginControllerImp>(builder: (controller)=>CustomTextFormAuth(
                  obscuretext: controller.isShowPassword,
                  onTapIcon: (){
                    controller.showPassword();
                  },
                  isNumber: false,
                  // isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 30, "password");

                  },
                  hintText: "5".tr, //"Enter Your Password"
                  labelText: "Password",
                  iconDate: controller.isShowPassword==true? Icons.remove_red_eye_outlined:Icons.lock_outlined,
                  mycontroller: controller.password,
                ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.goToForgetPassword();
                      },
                      child: Container(
                        padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColor.primaryColor.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "7".tr, //"Forget Password"
                          style:const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    CustomTextSignUpOrSignIn(
                      textOne: "8".tr, //"Don't have account ?"
                      textTwo: "9".tr, //" Sign Up",
                      onTap: (){
                        controller.goToSignUp();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                CustomButtomAuth(
                  text:"6".tr, //"Sign In"
                  onPressed: (){
                    controller.login();
                  },
                ),

              ],
            ),
          ),
               ),),
       ),
      ),
      ),
    );
  }
}
