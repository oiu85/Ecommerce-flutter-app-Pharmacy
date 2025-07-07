import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/rejected_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrderRejected extends GetView<OrdersRejectedController> {
  final OrdersModel listdata;
  const CardOrderRejected({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // رأس البطاقة مع رقم الطلب والوقت
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${"129".tr}${listdata.ordersId}", //Order number is
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                      fontFamily: "Ciro",
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  size: 16,
                  color: AppColor.primaryColor,
                ),
                const SizedBox(width: 4),
                Text(
                  " ${Jiffy.parse(listdata.ordersDatetime!).fromNow()} ",
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Ciro",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // معلومات الطلب
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    icon: Icons.shopping_bag_outlined,
                    title: "130".tr,
                    value: controller.printOrderType(listdata.ordersType!.toString()),
                  ),
                  const Divider(height: 16),
                  _buildInfoRow(
                    icon: Icons.attach_money,
                    title: "131".tr,
                    value: "${listdata.ordersPrice}\$",
                  ),
                  const Divider(height: 16),
                  _buildInfoRow(
                    icon: Icons.delivery_dining,
                    title: "132".tr,
                    value: "${listdata.ordersPricedelivery}\$",
                  ),
                  const Divider(height: 16),
                  _buildInfoRow(
                    icon: Icons.payment,
                    title: "133".tr,
                    value: controller.printPaymentMethod(listdata.ordersPaymrntmethod!.toString()),
                  ),
                  const Divider(height: 16),
                  _buildStatusRow(
                    title: "134".tr,
                    value: controller.printOrdersStatus(listdata.ordersStatus!.toString()),
                    status: listdata.ordersStatus!.toString(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            //  = وزر التفاصيل
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails, arguments: {
                      "ordersmodel": listdata
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.visibility),
                  label: Text("136".tr,style: TextStyle(color: Colors.white),), //Details
                ),
                if(listdata.ordersType == "0" && listdata.ordersStatus == "3")
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.goToPageTracking(listdata);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.redDark,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.location_on_outlined,color: Colors.white,),
                    label: Text("Tracking",style: TextStyle(color: Colors.white),),
                  ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColor.secondColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: AppColor.secondColor,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "${"135".tr} ${listdata.ordersTotalprice!.round()}\$",textAlign: TextAlign.center, //Total Price
                    style: const TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لإنشاء صف معلومات
  Widget _buildInfoRow({required IconData icon, required String title, required String value}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColor.primaryColor,
        ),
        const SizedBox(width: 8),
        Text(
          "$title ",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: "Ciro",
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: "Ciro",
          ),
        ),
      ],
    );
  }

  // دالة مساعدة لإنشاء صف الحالة مع لون مناسب
  Widget _buildStatusRow({required String title, required String value, required String status}) {
    Color statusColor;

    // تحديد اللون بناءً على حالة الطلب
    switch (status) {
      case "0":
        statusColor = Colors.blue;
        break;
      case "1":
        statusColor = Colors.green;
        break;
      case "2":
        statusColor = Colors.orange;
        break;
      case "3":
        statusColor = Colors.red;
        break;
      case "-1":
        statusColor = Colors.red;
      default:
        statusColor = Colors.grey;
    }

    return Row(
      children: [
        const Icon(
          Icons.info_outline,
          size: 18,
          color: AppColor.primaryColor,
        ),
        Text(
          "$title ",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: statusColor,
            ),
          ),
        ),
      ],
    );
  }
}