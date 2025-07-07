import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../controller/address/add_controller.dart';
import '../../controller/address/addaddressdetails_controller.dart';
import '../../core/shared/custtombutton.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller = Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("118".tr), //Add Details Address
      ),
      body: Container(
        padding: EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
              builder: (controller)=>
                  HandlingDataView(statusRequest: controller.statusRequest,
              widget:  ListView(
                children: [
                  CustomTextFormAuth(
                      hintText: "119".tr, //Your City
                      labelText: "120".tr, //City
                      iconDate: Icons.location_city_outlined,
                      mycontroller: controller.city,
                      valid: (val){

                      },
                      isNumber: false
                  ),
                  CustomTextFormAuth(
                      hintText: "121".tr, // Your Street
                      labelText: "122".tr, //Street
                      iconDate: Icons.streetview_outlined,
                      mycontroller: controller.street,
                      valid: (val){

                      },
                      isNumber: false
                  ),
                  CustomTextFormAuth(
                      hintText: "123".tr, //Your location name
                      labelText: "124".tr, //name
                      iconDate: Icons.near_me_rounded,
                      mycontroller: controller.name,
                      valid: (val){

                      },
                      isNumber: false
                  ),
                  CustomTextFormAuth(
                      hintText: "125".tr, //Any Note
                      labelText: "126".tr, //note
                      iconDate: Icons.sticky_note_2_outlined,
                      mycontroller: controller.note,
                      valid: (val){

                      },
                      isNumber: false
                  ),
                  Custtombutton(text: "127".tr, //Add
                    onPressed: (){
                    controller.addAddress();
                  },
                  ),
                ],
              )
          )
          )
      ),
    );
  }
}
