import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Responsive.radius(30)),
      ),
      margin:  EdgeInsets.symmetric(horizontal: Responsive.margin(20), vertical: Responsive.margin(16)),
      child: Container(
        padding:  EdgeInsets.all(Responsive.padding(26)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // رأس البطاقة مع رقم الطلب والوقت
            Row(
              children: [
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(18), vertical: Responsive.padding(8)),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Responsive.radius(13)),
                  ),
                  child: Text(
                    "${"129".tr}${listdata.ordersId}", //Order number is
                    style:  TextStyle(
                      fontSize: Responsive.font(28),
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                      fontFamily: "Ciro",
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.access_time_rounded,
                  size: Responsive.icon(30),
                  color: AppColor.primaryColor,
                ),
                 SizedBox(width: Responsive.w(7)),
                Text(
                  " ${Jiffy.parse(listdata.ordersDatetime!).fromNow()} ",
                  style:  TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.font(25),
                    fontFamily: "Ciro",
                  ),
                ),
              ],
            ),
             SizedBox(height: Responsive.h(30)),

            // معلومات الطلب
            Container(
              padding:  EdgeInsets.all(Responsive.padding(20)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(Responsive.radius(20)),
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
                  if(listdata.ordersType != "1")
                  const Divider(height: 16),
                  if(listdata.ordersType != "1")
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
                    padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(30), vertical: Responsive.padding(15)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Responsive.radius(15)),
                    ),
                  ),
                  icon: const Icon(Icons.visibility),
                  label: Text("136".tr,style: TextStyle(color: Colors.white),), //Details
                ),
                const Spacer(),
                const SizedBox(width: 1,),
                if(listdata.ordersStatus == "0")ElevatedButton.icon(
                  onPressed: () {
                    controller.deleteOrders(listdata.ordersId.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.redDark,
                    foregroundColor: Colors.white,
                    padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(30), vertical: Responsive.padding(15)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Responsive.radius(15)),
                    ),
                  ),
                  icon: const Icon(Icons.delete_outline,color: Colors.white,),
                  label: Text("Delete",style: TextStyle(color: Colors.white),), //Details
                ),
                if(listdata.ordersStatus == 3)ElevatedButton.icon(
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
                  label: Text("Tracking",style: TextStyle(color: Colors.white),), //Details
                ),
              ],
            ),
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(20), vertical: Responsive.padding(12)),
                  decoration: BoxDecoration(
                    color: AppColor.secondColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Responsive.radius(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(
                        Icons.monetization_on,
                        color: AppColor.secondColor,
                        size: Responsive.icon(24),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${"135".tr} ${listdata.ordersTotalprice!.round()}\$",textAlign: TextAlign.center, //Total Price
                        style:  TextStyle(
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.icon(30),
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
          size: Responsive.icon(30),
          color: AppColor.primaryColor,
        ),
         SizedBox(width: Responsive.w(10)),
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
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Responsive.icon(25),
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
         Icon(
          Icons.info_outline,
          size: Responsive.icon(30),
          color: AppColor.primaryColor,
        ),
        Text(
          "$title",
          style:  TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Responsive.font(30),
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(Responsive.radius(20)),
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