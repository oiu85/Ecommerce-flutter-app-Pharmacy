import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.primaryColor.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Image.asset(
          AppImageAsset.logo,
          height: 150,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
