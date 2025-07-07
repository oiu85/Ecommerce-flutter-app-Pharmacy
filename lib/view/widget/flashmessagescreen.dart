import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FlashMessageScreen extends StatelessWidget {
  const FlashMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: CustomSnakBarMessage(errorText: " done removing from favorite",),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,

            ));
          },
          child: const Text("show message"),
        ),
      ),
    );
  }
}

// Widget لعرض رسالة منبثقة
// في class CustomFlashMessage
class CustomFlashMessage {
  static void showMessage({
    required String message,
    Color backgroundColor = const Color(0xFF2196F3),
    Color bubbleColor = const Color(0xFF1976D2),
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
    String title = "Message",
    Duration duration = const Duration(seconds: 2),
    String? customIconPath,
  }) {
    Get.snackbar(
      "",
      "",
      titleText: const SizedBox.shrink(),
      messageText: CustomSnakBarMessage(
        errorText: message,
        backgroundColor: backgroundColor,
        bubbleColor: bubbleColor,
        iconColor: iconColor,
        textColor: textColor,
        title: title,
        customIconPath: customIconPath,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      barBlur: 0,
      isDismissible: true,
      duration: duration,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 15,
        right: 15,
      ),
      padding: EdgeInsets.zero,
      animationDuration: const Duration(milliseconds: 400),
    );
  }
}

class CustomSnakBarMessage extends StatelessWidget {
  const CustomSnakBarMessage({
    super.key, 
    required this.errorText,
    this.backgroundColor = Colors.red,
    this.bubbleColor = const Color(0xFF801336),
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.title = "Oh Snap",
    this.customIconPath,
  });
  
  final String errorText;
  final Color backgroundColor;
  final Color bubbleColor;
  final Color iconColor;
  final Color textColor;
  final String title;
  final String? customIconPath;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      errorText,
                      style: TextStyle(
                        fontSize: 13,
                        color: textColor.withOpacity(0.9),
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/images/bubbles.svg",
              height: 58,
              width: 50,
              color: bubbleColor,
            ),
          ),
        ),
        Positioned(
          top: -15,
          left: 8,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: backgroundColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SvgPicture.asset(
              customIconPath ?? "assets/images/fail.svg",
              height: 20,
              color: backgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
