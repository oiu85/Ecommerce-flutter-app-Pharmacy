import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';
import '../../../data/datasource/static/static.dart';

class CustomsliderOnBoading extends GetView<onBoardingControllerImp> {
  const CustomsliderOnBoading({super.key});
  
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Container(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(40)),
        child: Column(
          children: [
             SizedBox(height: Responsive.h(40)),
            Container(
              height: Get.width / 1.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Responsive.radius(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Responsive.radius(50)),
                child: Image.asset(
                  onBoardingList[i].image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
             SizedBox(height: Responsive.h(100)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Responsive.padding(20), vertical: Responsive.padding(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Responsive.radius(30)),
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
                  Text(
                    onBoardingList[i].titel!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.font(50),
                      color: AppColor.black,
                      letterSpacing: 0.5,
                    ),
                  ),
                   SizedBox(height: Responsive.h(40)),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: Responsive.h(3),
                        color: AppColor.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: Responsive.font(32),
                      ),
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
}
