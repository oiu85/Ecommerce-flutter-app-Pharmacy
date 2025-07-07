import 'package:ecommerce_app/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce_app/view/widget/auth/customtexttitelauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/custombuttomauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   // ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    Get.lazyPut(()=>ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Forget Password",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.grey),),
      ),
      body:GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=>
          GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=>

              HandlingDataRequest( statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:const  BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Form(
                            key: controller.formstate,
                            child: ListView(
                children:[
                  const SizedBox(height: 10),
                  const Icon(
                    Icons.lock_reset_outlined,
                    size: 100,
                    color: AppColor.primaryColor,
                  ),
                  const SizedBox(height: 20),
                  CustomTextTitelAuth(text: '21'.tr,), //"Check email"
                  const SizedBox(height: 10,),

                     CustomTextBodyAuth(bodyText: "24".tr), //"please Enter Email Address To Receive A verification Code

                  const SizedBox(height: 25,),
                  CustomTextFormAuth(
                    isNumber: false,
                    // isNumber: false,
                    valid: (val){
                      return validInput(val!,5, 100, "email");
                    },
                    hintText: "4".tr, //"Enter Your Email"
                    labelText: "Email",
                    iconDate: Icons.email_outlined,
                    mycontroller: controller.email,
                  ),
                  const SizedBox(height: 20,),
                  CustomButtomAuth(
                    text:"22".tr,  //Check
                    onPressed: (){
                      controller.checkemail();
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
