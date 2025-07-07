import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/orders/pending_controller.dart';
import '../widget/orders/orderslistarchive.dart';
import '../widget/orders/orderslistcard.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersArchiveController controller = Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Archive"), //Orders
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
              child: GetBuilder<OrdersArchiveController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.data.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 80,
                          color: AppColor.primaryColor.withOpacity(0.5),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "There is No Orders",
                          style:  TextStyle(
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
                    itemBuilder:
                        (context, index) =>
                        CardOrdersListArchive(
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


