import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitelauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/verfiycode_controller.dart';


class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodeControllerImp controller = Get.put(VerfiyCodeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Verification Code",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),),
      ),
      body:Container(
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
                Icons.security,
                size: 80,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextTitelAuth(text: '23'.tr,), //"Check Code"
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
              child: CustomTextBodyAuth(bodyText: "${"25".tr}\n${controller.email}"), //"Please Enter The Digit Code Sent To love14144Mn@gmail.com"
            ),
            const SizedBox(height: 25,),
            Directionality(
              textDirection: TextDirection.ltr,
              child: OtpTextField(
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: AppColor.primaryColor,
                focusedBorderColor: AppColor.primaryColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  controller.goToRestPassword(verificationCode);
                }, // end onSubmit
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            // CustomButtomAuth(
            //   text:"22".tr,//Check
            //   onPressed: (){},
            // ),


          ],
        ),
      ),
    );
  }
}
