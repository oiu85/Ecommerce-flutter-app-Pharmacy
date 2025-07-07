import 'package:ecommerce_app/controller/orders/rejected_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/orders/orderlistcardrejected.dart';
import '../widget/orders/orderslistcard.dart';

class OrdersRejectedView extends StatelessWidget {
  const OrdersRejectedView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersRejectedController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Rejected Orders".tr),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.primaryColor.withOpacity(0.1), Colors.white],
            stops: const [0.0, 0.3],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<OrdersRejectedController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.data.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                size: 80,
                                color: AppColor.primaryColor.withOpacity(0.5),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "No Rejected Orders".tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) => CardOrderRejected(
                            listdata: controller.data[index],
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
