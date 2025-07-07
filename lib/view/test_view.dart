import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundCoor,
        title: const Text("titel"),
      ),
      body: GetBuilder<TestController>(builder: (controller){
        
        return  HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context,index){
              return Text("${controller.data}");
            })
        );
      }),
    );
  }
}
