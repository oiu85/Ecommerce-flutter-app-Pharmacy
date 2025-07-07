import 'package:ecommerce_app/core/class/crud.dart';
import 'package:get/get.dart';

class IntiallBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}