import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../constant/color.dart';
// عدل المسار حسب مشروعك

double? routeDistance; // متر
double? routeDuration; // ثانية

Future<Set<Polyline>> getPolyLineWithOSRM(double startLat, double startLng, double endLat, double endLng) async {
  Set<Polyline> polylineSetLocal = {};
  List<LatLng> polylineco = [];
  try {
    final url = "http://router.project-osrm.org/route/v1/driving/$startLng,$startLat;$endLng,$endLat?overview=full&geometries=geojson";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData['routes'].isNotEmpty) {
        final route = jsonData['routes'][0];

        final coords = route['geometry']['coordinates'];
        routeDistance = (route['distance'] as num).toDouble();
        routeDuration = (route['duration'] as num).toDouble() + 600;

        for (var coord in coords) {
          double lon = coord[0];
          double lat = coord[1];
          polylineco.add(LatLng(lat, lon));
        }

        final polyline = Polyline(
          polylineId: PolylineId("route_osrm"),
          color: AppColor.red,
          width: 5,
          points: polylineco,
        );

        polylineSetLocal.add(polyline);
        return polylineSetLocal;
      } else {
        print("❌ لا يوجد مسارات من OSRM.");
      }
    } else {
      print("❌ فشل جلب المسار. كود الحالة: ${response.statusCode}");
    }
  } catch (e) {
    print("❌ خطأ أثناء جلب المسار: $e");
  }

  return {};
}
