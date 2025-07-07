import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String bodyText;
  const CustomTextBodyAuth({super.key, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
        border: Border.all(
          color: AppColor.primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Text(
        bodyText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade700,
          height: 1.5,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
