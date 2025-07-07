import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/address/add_controller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AdDAddressController controllerpage = Get.put(AdDAddressController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("116".tr), // Add New Address
      ),
      body: Container(
          child: GetBuilder<AdDAddressController>(
        builder: (controllerpage) => HandlingDataView(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: controllerpage.markers.toSet(),
                          onTap: (Latlang) {
                            controllerpage.addMarkers(Latlang);
                          },
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.Completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                              child: MaterialButton(
                                minWidth: 200,
                            onPressed:(){
                              controllerpage.goToPageAddDetailsAddress();
                            },
                            color: AppColor.primaryColor,
                            textColor: Colors.white,
                            child:  Text("117".tr,style: const TextStyle(fontSize: 18),),
                          )),
                        )
                      ],
                    ),
                  ),
              ],
            )),
      )),
    );
  }
}
