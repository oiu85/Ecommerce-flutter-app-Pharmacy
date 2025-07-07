

import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../constant/color.dart';


/*
am abd lessen carefully i had al ot of research about this function so please be nice with it
this function i have made it for google map polyline but
 You must enable Billing on the Google Cloud Project at https://console.cloud.google.com/project/_/billing/enable
 its work i don't know how , but its work no body touch it 😑😑

*/




Future getPolyLine(lat ,  long , destlat , destlong ) async {
  Set<Polyline> polylineSet = {};
  List<LatLng> polylineco = [] ;
  PolylinePoints polylinePoints = PolylinePoints();

  String  url = "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyDS2gU2fTsXjHNcebRtaHcUxWkyWO2pdFs";

  var response = await http.post(Uri.parse(url));
  print("============================goggel response : " );
  print(response.statusCode);
  print("============================ Google Response Body:");
  print(response.body);


  var responsebody = jsonDecode(response.body);
  var point = responsebody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if(result.isNotEmpty){

    result.forEach((PointLatLng pointlatlong){
      polylineco.add(LatLng(pointlatlong.latitude, pointlatlong.longitude));
    });

  }
  Polyline polyline = Polyline(polylineId: PolylineId("Abdullah"), color: AppColor.red , width: 5, points: polylineco );

  polylineSet.add(polyline);

  return polylineSet;

}





























