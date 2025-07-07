import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isActive;
  const CardDeliveryTypeCheckout({super.key, required this.imagename, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.secondColor),
        color: isActive ?  AppColor.secondColor: null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagename,
            width: 60,
            color: isActive ? Colors.white: null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white: AppColor.secondColor,
                fontWeight:   FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
