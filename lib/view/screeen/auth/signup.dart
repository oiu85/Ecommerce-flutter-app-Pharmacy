import 'package:ecommerce_app/controller/auth/signup_contrller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitelauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>SignUpControllerImp());
    // SignUpControllerImp controller = Get.put(SignUpControllerImp()); // this is if i want to use Get.delete instead of lazy put
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Sign Up",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),),
      ),
      body:GetBuilder<SignUpControllerImp>(builder: (controller)=>PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, bool? result) async {
          if (!didPop) {
            alertExitApp();
          }
        },
        child: GetBuilder<SignUpControllerImp>( builder: (controller)=> //wee add this builder for adding loading animation

        HandlingDataRequest( statusRequest: controller.statusRequest,
           widget:Container( //if want to use get.delete should don't use getBuilder
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                  CustomTextTitelAuth(text: '2'.tr,), //"Welcome Back"
                  const SizedBox(height: 5,),
                  CustomTextBodyAuth(bodyText: "18".tr), //"sign Up using email and password or  social media"
                  const SizedBox(height: 10,),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val){
                      return validInput(val!, 3, 8, "username");
                    },
                    hintText: "16".tr, //"Enter Your Username"
                    labelText: "UserName",
                    iconDate: Icons.person_outline,
                    mycontroller: controller.username,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val){
                      return validInput(val!, 5, 100, "email");
                    },
                    hintText: "4".tr, //"Enter Your Email"
                    labelText: "Email",
                    iconDate: Icons.email_outlined,
                    mycontroller: controller.email,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    valid: (val){
                      return validInput(val!, 10, 14, "phone");
                    },
                    hintText: "17".tr, // "Enter Your Phone"
                    labelText: "Phone",
                    iconDate: Icons.phone_outlined,
                    mycontroller: controller.phone,
                  ),
                  GetBuilder<SignUpControllerImp>(builder: (controller)=>CustomTextFormAuth(
                    obscuretext: controller.isShowPassword,
                    onTapIcon: (){
                      controller.showPassword();
                    },
                    isNumber: false,
                    valid: (val){
                      return validInput(val!, 5, 30,"password");
                    },
                    hintText: "5".tr, //"Enter Your Password"
                    labelText: "Password",
                    iconDate:controller.isShowPassword==true?Icons.remove_red_eye_outlined: Icons.lock_outlined,
                    mycontroller: controller.password,
                  ),),
                  const SizedBox(height: 15,),
                  CustomButtomAuth(
                    text:"9".tr, //"Sign In"
                    onPressed: (){
                      controller.signUp();
                    },
                  ),
                  const SizedBox(height: 10,),
                  CustomTextSignUpOrSignIn(
                    textOne: "19".tr, //" Do you have an account ?"
                    textTwo: "20".tr, //" Sign In",
                    onTap: (){
                      controller.goToSignIn();
                    },
                  ),
                ],
              ),
            ),
                  ),
         ),
        ),
      ),
      ),
    );
  }
}
