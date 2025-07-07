import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';
import '../../../data/model/ordersmodel.dart';
import 'dialograting.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrdersListArchive({super.key, required this.listdata});

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
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${"129".tr}${listdata.ordersId}", //Order number is
                    style:  TextStyle(
                      fontSize: Responsive.font(32),
                      fontFamily: "ciro",
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                const Spacer(),
                 Icon(
                  Icons.access_time_rounded,
                  size: Responsive.icon(35),
                  color: AppColor.primaryColor,
                ),
                 SizedBox(width: Responsive.w(8)),
                Text(
                  " ${Jiffy.parse(listdata.ordersDatetime!).fromNow()} ",
                  style:  TextStyle(
                    fontFamily: "ciro",
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.font(32),
                  ),
                ),
              ],
            ),
             SizedBox(height: Responsive.h(30)),

            Container(
              padding:  EdgeInsets.all(Responsive.padding(24)),
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

             SizedBox(height: Responsive.h(32)),

            Row(
              children: [
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: Responsive.padding(30), vertical: Responsive.padding(16)),
                  decoration: BoxDecoration(
                    color: Color(0xFF00FF3C).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Responsive.radius(16)),
                  ),
                  child: Row(
                    children: [
                       Icon(
                        Icons.monetization_on,
                        color: AppColor.secondColor,
                        size: Responsive.icon(50),
                      ),
                       SizedBox(width: Responsive.w(8)),
                      Text(
                        "${"135".tr} ${listdata.ordersTotalprice!.round()}\$",
                        style:  TextStyle(
                          fontFamily: "ciro",
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.font(30),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),


              ],
            ),
            Row(
              children: [
                Flexible(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails, arguments: {
                        "ordersmodel": listdata
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.visibility),
                    label: Text("136".tr, overflow: TextOverflow.ellipsis),
                  ),
                ),

                const SizedBox(width: 6),
                if(listdata.ordersRating == "0")   Flexible(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ShowDilaogRating(context,listdata.ordersId!.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.star_rate),
                    label: Text("196".tr, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


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
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            fontFamily: "ciro",
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow({required String title, required String value, required String status}) {
    Color statusColor;

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
        const SizedBox(width: 8),
        Text(
          "$title ",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Container(
          width: Get.width * 0.35,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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