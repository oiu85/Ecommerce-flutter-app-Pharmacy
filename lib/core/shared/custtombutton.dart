import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custtombutton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Custtombutton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        onPressed:onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
