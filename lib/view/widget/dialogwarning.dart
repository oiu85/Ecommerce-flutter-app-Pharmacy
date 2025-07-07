import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWarning extends StatelessWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final Color titleColor;
  final Color textColor;
  final Color buttonColor;
  final String? buttonText;
  final VoidCallback? onConfirm;

  const DialogWarning({
    super.key,
    required this.title,
    required this.message,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.textColor = Colors.black,
    this.buttonColor = Colors.red,
    this.buttonText,
    this.onConfirm,
  });

  void showWarningDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        backgroundColor: backgroundColor,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 50,
                color: buttonColor,
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              MaterialButton(
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm!();
                  } else {
                    Get.back();
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: buttonColor,
                minWidth: 200,
                height: 45,
                elevation: 2,
                child: Text(
                  buttonText ?? "OK",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty container as this widget is only used for showing dialog
  }
}