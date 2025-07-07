import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/widget/flashmessagescreen.dart';
import '../constant/color.dart';

class NotificationService extends GetxService {

  void showSuccessNotification({
    required String title, 
    required String message,
    Duration? duration,
    Color? backgroundColor,
    Color? iconColor,
    Color? bubbleColor,
    Color? textColor,
    String? customIconPath,
  })
  {
    CustomFlashMessage.showMessage(
      message: message,
      title: title,
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: backgroundColor ?? AppColor.primaryColor,
      iconColor: iconColor ?? AppColor.primaryColor,
      bubbleColor: bubbleColor ?? AppColor.secondColor,
      textColor: textColor ?? Colors.white,
      customIconPath: customIconPath ?? "assets/images/check1.svg",
    );
  }

  void showErrorNotification({
    required String title, 
    required String message,
    Duration? duration,
    Color? backgroundColor,
    Color? iconColor,
    Color? bubbleColor,
    Color? textColor,
    String? customIconPath,
  }) {
    CustomFlashMessage.showMessage(
      message: message,
      title: title,
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: backgroundColor ?? AppColor.redDark,
      iconColor: iconColor ?? AppColor.redLight,
      bubbleColor: bubbleColor ?? AppColor.redLight,
      textColor: textColor ?? Colors.white,
      customIconPath: customIconPath ?? "assets/images/check1.svg",
    );
  }
  
  // دالة عامة لعرض الإشعارات مع تخصيص كامل
  void showCustomNotification({
    required String title, 
    required String message,
    Duration? duration,
    Color? backgroundColor,
    Color? iconColor,
    Color? bubbleColor,
    Color? textColor,
    String? customIconPath,
  }) {
    CustomFlashMessage.showMessage(
      message: message,
      title: title,
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: backgroundColor ?? Colors.blue,
      iconColor: iconColor ?? Colors.white,
      bubbleColor: bubbleColor ?? Colors.blue.shade300,
      textColor: textColor ?? Colors.white,
      customIconPath: customIconPath ?? "assets/images/notification.svg",
    );
  }
}