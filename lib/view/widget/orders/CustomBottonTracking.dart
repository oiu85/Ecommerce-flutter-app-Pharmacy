import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/functions/responsivehelper.dart';

class CustomBottonTracking extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBottonTracking({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Responsive.h(80),
      margin:  EdgeInsets.only(top: Responsive.margin(40)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Responsive.radius(45)),
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor.withOpacity(0.7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
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
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Responsive.radius(45)),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delivery_dining_outlined,
              size: Responsive.font(40),
            ),
            SizedBox(width: Responsive.w(20)),
            Text(
              text,
              style: TextStyle(
                fontSize: Responsive.font(30),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
