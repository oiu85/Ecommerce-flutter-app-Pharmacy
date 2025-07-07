import 'package:ecommerce_app/controller/auth/verfiycodedignup_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitelauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../core/class/handlingdataview.dart';
class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodeSignUpControllerImp controller = Get.put(VerfiyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Verification Code",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),),
      ),
      body:GetBuilder<VerfiyCodeSignUpControllerImp>( builder: (controller)=>
          HandlingDataRequest( statusRequest: controller.statusRequest,
           widget:Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
            child: ListView(
              children:[
                CustomTextTitelAuth(text: '23'.tr,), //"Check Code"
                const SizedBox(height: 10,),
                CustomTextBodyAuth(bodyText: "25".tr),//"Please Enter The Digit Code Sent To xxxxxxx@gmail.com"
                Center(child: Text(controller.email.toString(),style: const TextStyle(fontSize: 23),)),
                const SizedBox(height: 15,),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode){
                      controller.goToSuccesSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                ),
                // CustomButtomAuth(
                //   text:"22".tr,//Check
                //   onPressed: (){},
                // ),
                const SizedBox(height: 40,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 65),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:Border.all(color: AppColor.primaryColor),
                  ),
                  child: InkWell(
                    onTap: (){
                      controller.resend();
                    },
                    child: Center(
                        child: Text("72".tr,  //Resend Verfiy Code
                          style: const TextStyle(color: AppColor.primaryColor,fontSize: 20),)
                    ),
                  ),
                )
              ],
            ),
                   ),
         ),
      ),
    );
  }
}
