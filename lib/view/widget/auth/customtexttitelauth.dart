import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextTitelAuth extends StatelessWidget {
  final String text;
  const CustomTextTitelAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 0.5,
              height: 1.5,
              shadows: [
                Shadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
