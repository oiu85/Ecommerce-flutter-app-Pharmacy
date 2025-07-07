import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/responsivehelper.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Responsive.margin(10), bottom: Responsive.margin(10), left: Responsive.margin(5), right: Responsive.margin(5)),
      child: Row(
        children: [
          Container(
            width: Responsive.w(10),
            height: Responsive.h(50),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(Responsive.radius(20)),
            ),
          ),
           SizedBox(width: Responsive.w(20)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: Responsive.font(36),
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    offset: const Offset(0.5, 0.5),
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
