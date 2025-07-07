import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CardNotesFieldInput extends StatelessWidget {
  final TextEditingController? controllerInput;
  final String titleInput;
  final bool isNumber;
  
  const CardNotesFieldInput({
    super.key, 
    required this.controllerInput, 
    required this.titleInput,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: AppColor.primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey.shade50,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 5),
              child: Text(
                titleInput,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            TextField(
              controller: controllerInput,
              keyboardType: isNumber ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: "106".tr, //"Type Here...",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                suffixIcon: Icon(
                  isNumber ? Icons.numbers : Icons.health_and_safety_outlined,
                  color: AppColor.primaryColor,
                  size: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
              maxLines: isNumber ? 1 : 2,
              minLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
