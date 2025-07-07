import 'package:ecommerce_app/controller/productdetails_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/view/widget/productdetails/priceandcount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/translatedatabase.dart';
import '../widget/ExbandableTextWidget.dart';
import '../widget/dialogwarning.dart';
import '../widget/productdetails/topproductpagedetails.dart';

class ProductDetails extends StatelessWidget {

  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 55,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          color: AppColor.secondColor,
          child: Text(
            "68".tr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade50, Colors.white],
                stops: const [0.0, 0.3],
              ),
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const TopProductPageDetails(),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translateDatabase(
                          controller.itemsModel.itemsNameAr,
                          controller.itemsModel.itemsName,
                        ),
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: AppColor.fourthColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PriceAndCountItems(
                        count: "${controller.countitems}",
                        price: controller.itemsModel.itemsDiscount! > 0 ?
                             controller.itemsModel.itemspricediscount != null ? "${controller.itemsModel.itemsPrice!.toStringAsFixed(2)} ${controller.itemsModel.itemspricediscount!.toStringAsFixed(2)}\$"
                            : "${controller.itemsModel.itemsPrice!.toStringAsFixed(2)}\$ ${controller.itemsModel.itemspricediscount}"
                            : "${controller.itemsModel.itemsPrice}\$",
                        onAdd: () {
                          if (controller.itemsModel.itemsPrescription == 1) {
                            DialogWarning(
                              title: "71".tr,
                              message: "75".tr,
                              titleColor: AppColor.redDark,
                              textColor: AppColor.redDark,
                              buttonColor: AppColor.redDark,
                            ).showWarningDialog();
                            return;
                          }
                          controller.add();
                        },
                        onRemove: () {
                          if (controller.itemsModel.itemsPrescription == 1) {
                            DialogWarning(
                              title: "71".tr,
                              message: "75".tr,
                              titleColor: AppColor.redLight,
                              backgroundColor: AppColor.redDark,
                              textColor: Colors.white,
                              buttonColor: AppColor.redLight,
                            ).showWarningDialog();
                            return;
                          }
                          controller.remove();
                        },
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.description_outlined, color: AppColor.primaryColor),
                                const SizedBox(width: 8),
                                Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 20),
                            ExpandableTextWidget(
                              text: translateDatabase(
                                controller.itemsModel.itemsDescAr,
                                controller.itemsModel.itemsDesc,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "64".tr,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: AppColor.fourthColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
