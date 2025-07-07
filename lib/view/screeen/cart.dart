import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/translatedatabase.dart';
import '../widget/cart/appbarcart.dart';
import '../widget/cart/custombottomnavigationbarcart.dart';
import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
   CartController cartcontroller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("78".tr,), //My Cart
      ),
      backgroundColor: Colors.grey[50],
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBarCart(
            price: cartcontroller.priceorders.toStringAsFixed(2),
            discount: '${controller.discountcoupon} %',
            totalprice: '${controller.getTotalPrice()}',
            shipping: 10000.0,
            controllercoupon: controller.controllercoupon!,
            onApplyCoupon: () {
              controller.checkCoupon();
            },
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: controller.data.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue.shade50, Colors.white],
                      stops: const [0.0, 0.4],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/images/empty_cart.png",
                            height: 150,
                            width: 150,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "79".tr, //"Your Cart is Empty"
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                         "80".tr, // "Looks like you haven't added\n anything to your cart yet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),

                      ],
                    ),
                  ),
                )
              : Container(
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
                      // const TopAppBarCart(title: "My Cart"),
                      const SizedBox(height: 15),
                      TopCardCart(
                        message: "${"81".tr}${cartcontroller.totalcountitems}${"82".tr}", //You Have X Items In Your list
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartcontroller.data.length,
                              (index) => Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: TweenAnimationBuilder(
                                  duration: Duration(milliseconds: 400 + (index * 100)),
                                  tween: Tween<double>(begin: 0, end: 1),
                                  builder: (context, double value, child) {
                                    return Transform.scale(
                                      scale: value,
                                      child: CustomItemsCartList(
                                        name: translateDatabase(controller.data[index].itemsNameAr,cartcontroller.data[index].itemsName),

                                        price:(

                                            cartcontroller.data[index].itemsPrice! -
                                                cartcontroller.data[index].itemsPrice! * cartcontroller.data[index].itemsDiscount! /
                                                    100).toStringAsFixed(2),

                                        Count: "${cartcontroller.data[index].countitems}",
                                        imagename: "${cartcontroller.data[index].itemsImage}",
                                        onAdd: () async {
                                          await cartcontroller.add(cartcontroller.data[index].itemsId!.toString());
                                          cartcontroller.refreshPage();
                                        },
                                        onRemove: () async {
                                          await cartcontroller.delete(cartcontroller.data[index].itemsId!.toString());
                                          cartcontroller.refreshPage();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
        ),
      )
    );
  }
}
