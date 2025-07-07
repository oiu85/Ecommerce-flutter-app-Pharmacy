import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import 'buttonorder.dart';
import 'custombuttoncoupon.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String totalprice;
  final shipping;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavigationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalprice,
    required this.controllercoupon,
    required this.onApplyCoupon,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 15, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                              hintText: "83".tr,   //Enter Coupon Code
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              prefixIcon: Icon(Icons.discount_outlined, color: AppColor.primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textButton: "84".tr,   //Apply
                            onPressed: onApplyCoupon,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.primaryColor, width: 1),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: AppColor.primaryColor),
                        SizedBox(width: 10),
                        Text(
                          "${"85".tr}${controller.couponname!}",
                          style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColor.primaryColor.withOpacity(0.3), width: 1),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildPriceRow("86".tr, "$price\$", false), //Price
                const SizedBox(height: 6),
                _buildPriceRow("87".tr, "$discount", false), //discount
                const SizedBox(height: 6),
                _buildPriceRow("88".tr, "$shipping\$", false), //Shipping
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
                _buildPriceRow("89".tr, "$totalprice\$", true),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CoustombuttonCart(
              textButton: "90".tr, //order
              onPressed: () {
                controller.goToPageCheckout();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, String value, bool isTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColor.primaryColor : Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColor.primaryColor : Colors.black87,
          ),
        ),
      ],
    );
  }
}
