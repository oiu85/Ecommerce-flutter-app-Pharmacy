import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _TestState();
}
class _TestState extends State<Test> {
  myRequestPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
  @override
  void initState() {
    myRequestPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),
      body: Container(),
    );
  }
}











// // حذف متغير positionStream
// final Completer<GoogleMapController> _controller =
// Completer<GoogleMapController>();
//
// static const CameraPosition _kGooglePlex = CameraPosition(
//   target: LatLng(37.42796133580664, -122.085749655962),
//   zoom: 14.4746,
// );
// CameraPosition cameraPosition = const CameraPosition(target: LatLng(36.186374, 37.122575),zoom: 14);
// List<Marker> markers = [];
//
// getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if(!serviceEnabled){
//     print("خدمات الموقع غير مفعلة");
//     return;
//   }
//
//   permission = await Geolocator.checkPermission();
//   if(permission == LocationPermission.denied){
//     permission = await Geolocator.requestPermission();
//     if(permission == LocationPermission.denied){
//       print("تم رفض إذن الموقع");
//       return;
//     }
//   }
//
//   if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
//     try {
//       Position position = await Geolocator.getCurrentPosition();
//       setState(() {
//         markers.clear();
//         markers.add(Marker(
//           markerId: const MarkerId("current_location"),
//           position: LatLng(position.latitude, position.longitude),
//           infoWindow: const InfoWindow(title: "موقعك الحالي"),
//         ));
//       });
//     } catch (e) {
//       print("حدث خطأ في تحديد الموقع: $e");
//     }
//   }
// }
//
// @override
// void initState() {
//   super.initState();
//   getCurrentLocation(); // استدعاء الموقع الحالي
//
// }


//
// Column(
// children: [
// Expanded(child:
// GoogleMap(
// onTap: (LatLng latLang) async {
// setLocaleIdentifier("en");
// try {
// List<Placemark> placemarks = await placemarkFromCoordinates(
// latLang.latitude,
// latLang.longitude,
// // Set locale explicitly
// ).timeout(
// const Duration(seconds: 20),
// onTimeout: () => throw TimeoutException('Geocoding timed out'),
// );
//
// if (placemarks.isNotEmpty) {
// print("======================================");
// print("Country: ${placemarks[0].country}");
// print("Street: ${placemarks[0].street}");
// print("Locality: ${placemarks[0].locality}");
// print("Postal Code: ${placemarks[0].postalCode}");
// print("Administrative Area: ${placemarks[0].administrativeArea}");
//
// // Add marker for the tapped location
// setState(() {
// markers.add(
// Marker(
// markerId: const MarkerId("tapped_location"),
// position: latLang,
// infoWindow: InfoWindow(
// title: placemarks[0].street ?? "Selected Location",
// snippet: placemarks[0].locality ?? ""
// )
// )
// );
// });
// }
// } catch (e) {
// print("Geocoding error: $e");
// // Fallback - just show coordinates
// setState(() {
// markers.add(
// Marker(
// markerId: const MarkerId("tapped_location"),
// position: latLang,
// infoWindow: InfoWindow(
// title: "Coordinates",
// snippet: "${latLang.latitude}, ${latLang.longitude}"
// )
// )
// );
// });
// }
// },
// markers: markers.toSet(),
// mapType: MapType.normal,
// initialCameraPosition: cameraPosition,
// onMapCreated: (GoogleMapController controller) {
// _controller.complete(controller);
// },
// myLocationEnabled: true, // تفعيل زر موقعي الحالي
// myLocationButtonEnabled: true, // إظهار زر الموقع الحالي
// ),
// ),
// ],
// )




