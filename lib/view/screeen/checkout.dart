import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widget/checkout/carddeliverytype.dart';
import '../widget/checkout/cardnotesfield.dart';
import '../widget/checkout/cardshippingaddress.dart';
import '../widget/checkout/cartpaymentmethod.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller =Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('94'.tr), //Checkout
      ),
      bottomNavigationBar: 
      Container(
        padding: const  EdgeInsets.symmetric(horizontal: 20),

        child: MaterialButton(
          color: AppColor.secondColor,
          textColor: Colors.white,

          onPressed: (){
            String diseases =controller.diseasesController.text;
            String medications = controller.medicationsController.text;
            String notes = controller.notesController.text;

            print("🧠 Chronic Diseases: $diseases");
            print("💊 Other Medications: $medications");
            print("📋 Doctor Notes: $notes");

            controller.checkout(
              diseases ,
              medications ,
              notes ,
            );
          },

          child: Text("107".tr, //Check out
            style: const  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children:  [
               Text("95".tr,
                style: const  TextStyle(color: AppColor.secondColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: ElevatedButton.icon(
                  onPressed: () => controller.useMedicalProfile(),
                  icon: const Icon(Icons.medical_information, color: Colors.white),
                  label: Text("Use Medical Profile".tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              CardNotesFieldInput(
                titleInput: "96".tr, //Do you suffer from chronic diseases?
                controllerInput: controller.diseasesController,
              ),
              const SizedBox(height: 10),
              CardNotesFieldInput(
                titleInput: "97".tr, //Do you take other medications?
                controllerInput: controller.medicationsController,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CardNotesFieldInput(
                      titleInput: "Age (years)",
                      controllerInput: controller.ageController,
                      isNumber: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CardNotesFieldInput(
                      titleInput: "Height (cm)",
                      controllerInput: controller.heightController,
                      isNumber: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CardNotesFieldInput(
                      titleInput: "Weight (kg)",
                      controllerInput: controller.weightController,
                      isNumber: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedGender,
                      decoration: InputDecoration(
                        labelText: "Gender",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: "Male", child: Text("Male")),
                        DropdownMenuItem(value: "Female", child: Text("Female")),
                      ],
                      onChanged: controller.updateGender,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedBloodType,
                      decoration: InputDecoration(
                        labelText: "Blood Type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: "A+", child: Text("A+")),
                        DropdownMenuItem(value: "A-", child: Text("A-")),
                        DropdownMenuItem(value: "B+", child: Text("B+")),
                        DropdownMenuItem(value: "B-", child: Text("B-")),
                        DropdownMenuItem(value: "AB+", child: Text("AB+")),
                        DropdownMenuItem(value: "AB-", child: Text("AB-")),
                        DropdownMenuItem(value: "O+", child: Text("O+")),
                        DropdownMenuItem(value: "O-", child: Text("O-")),
                      ],
                      onChanged: controller.updateBloodType,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CardNotesFieldInput(
                titleInput: "Allergies",
                controllerInput: controller.allergiesController,
              ),
              const SizedBox(height: 10),
              CardNotesFieldInput(
                titleInput: "98".tr, //Notes or advice from the doctor
                controllerInput: controller.notesController,
              ),

               Text("99".tr, //Choose Payment Method
                style: const TextStyle(color: AppColor.secondColor,fontWeight: FontWeight.bold,fontSize: 18),
              ),
              const SizedBox(height: 10,),
              InkWell(
                  onTap: (){
                    controller.choosePaymentMethod("0"); //0=> cash
                  },
                  child: CartPaymentMethodChecked(
                    title: "100".tr,
                    isActive: controller.paymentMethod == "0"?true:false,
                  )
              ),

              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  controller.choosePaymentMethod("1"); // 1=> Syriatel Cash
                },
                child:Container(
                    child:  CartPaymentMethodChecked(
                      title: "101".tr, //Syriatel Cash
                      isActive: controller.paymentMethod == "1"?true:false,)
                ),
              ),
              const SizedBox(height: 20,),
               Text("102".tr, //Choose Delivery Method
                style: const TextStyle(color: AppColor.secondColor,fontWeight: FontWeight.bold,fontSize: 18),
              ),
              const SizedBox(height: 10,),
              Row(
                  children:[
                    InkWell(
                      onTap: (){
                        controller.chooseDeliveryType("0"); //0=> delivery
                      },
                      child: CardDeliveryTypeCheckout(imagename: AppImageAsset.delivery,
                        title: "103".tr, //Delivery
                        isActive: controller.deliveryType == "0"?true:false,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        controller.chooseDeliveryType("1"); // 1=> local
                      },
                      child: CardDeliveryTypeCheckout(imagename: AppImageAsset.local2,
                        title: "104".tr, //Local
                        isActive: controller.deliveryType == "1"?true:false,
                      ),
                    ),
                  ]
              ),
              const SizedBox(height: 20,),
              if(controller.deliveryType=="0")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(controller.dataaddress.isNotEmpty)
                   Text("105".tr, //Choose Shipping Address
                    style: const TextStyle(color: AppColor.secondColor,fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  if(controller.dataaddress.isEmpty)
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoute.addressadd);
                      },
                      child: Container(
                        child: Center(
                            child: Text("please add some address\n Click here",textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.primaryColor,fontSize: 20),
                            ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10,),
                  ...List.generate(
                      controller.dataaddress.length, (index) =>
                      InkWell(
                        onTap: (){
                          controller.chooseShippingAddress(controller.dataaddress[index].addressId!.toString());
                        },
                        child: CardShippingAddressCheckout(
                                            title: "${controller.dataaddress[index].addressName}",
                                            body: "${controller.dataaddress[index].addressCity}${controller.dataaddress[index].addressStreet}",
                                            isActive: controller.addressId == controller.dataaddress[index].addressId.toString()?true:false,

                                          ),
                      )
                  ),
                ],
              ),

            ],
          ),
        ),),

      )
    );
  }
}
