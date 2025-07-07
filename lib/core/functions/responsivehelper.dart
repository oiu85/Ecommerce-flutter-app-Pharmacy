import 'package:get/get.dart';

class Responsive {
  static double get screenWidth => Get.width;
  static double get screenHeight => Get.height;
  static double get shortestSide =>
      screenWidth < screenHeight ? screenWidth : screenHeight;

  static double scale(double px) {
    // ❌ لا شاشة مرجعية – فقط نسبة حقيقية حسب الجهاز نفسه
    double factor = shortestSide / 652; // مقياس مرن ومفتوح
    return px * factor;
  }

  static double w(double px) => scale(px);
  static double h(double px) => scale(px);
  static double font(double px) => scale(px);
  static double icon(double px) => scale(px);
  static double radius(double px) => scale(px);
  static double padding(double px) => scale(px);
  static double margin(double px) => scale(px);
}
