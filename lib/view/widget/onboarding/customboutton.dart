import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';

class CustomBouttonOnBoarding extends GetView<onBoardingControllerImp> {
  const CustomBouttonOnBoarding({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: Responsive.margin(60)),
      height: Responsive.h(90),
      width: Responsive.w(400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Responsive.radius(50)),
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Responsive.radius(50)),
          ),
          padding: EdgeInsets.zero,
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Countinue",
              style: TextStyle(
                fontSize: Responsive.font(32),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(width: Responsive.w(15)),
            Icon(
              Icons.arrow_forward,
              size: Responsive.icon(40),
            ),
          ],
        ),
      ),
    );
  }
}
