import 'package:ecommerce_app/controller/orders/archive_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../core/functions/responsivehelper.dart';


void ShowDilaogRating(BuildContext context, String ordersid){
showDialog(
context: context,
barrierDismissible: true, // set to false if you want to force a rating
builder: (context) =>   RatingDialog(
  initialRating: 1.0,
  // your app's name?
  title: Text(
    '198'.tr,
    textAlign: TextAlign.center,
    style:  TextStyle(
      fontSize: Responsive.font(50),
      fontWeight: FontWeight.bold,
    ),
  ),
  // encourage your user to leave a high rating?
  message:  Text(
    '199'.tr,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 15),
  ),
  // your app's logo?
  image: Image.asset(AppImageAsset.rating, width: 200,height: 200,),
  submitButtonText: "201".tr,
  submitButtonTextStyle: TextStyle(
    color: AppColor.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  commentHint: '200'.tr,
  onCancelled: () => print('cancelled'),
  onSubmitted: (response) {
    OrdersArchiveController controller = Get.find();
    print('rating: ${response.rating}, comment: ${response.comment}');
    controller.SubmitRating(ordersid, response.comment, response.rating);
  },
),
);

}
