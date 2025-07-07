import 'dart:async';

import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/routes.dart';

class AdDAddressController extends GetxController{

  List<Marker> markers= [];

  double? lat;
  double? long;
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? Completercontroller ;

  Position? position;

   CameraPosition? kGooglePlex ;


addMarkers(LatLng latLng){
  markers.clear();
  markers.add(Marker(markerId: const MarkerId("1"),position: latLng));
  lat = latLng.latitude;
  long = latLng.longitude;
  update();
}

goToPageAddDetailsAddress(){
  Get.toNamed(AppRoute.addressadddetails,arguments: {
    "lat": lat.toString(),
    "long": long.toString(),
  });
}

  getCurrentLocation()async{
   position = await Geolocator.getCurrentPosition();
   kGooglePlex = CameraPosition(
     target: LatLng(position!.latitude,position!.longitude),
     zoom: 14.4746,
   );
   addMarkers(LatLng(position!.latitude, position!.longitude));
   statusRequest = StatusRequest.none;
   update();
  }


  @override
  void onInit() {
    getCurrentLocation();
    Completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }

}