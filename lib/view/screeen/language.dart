import 'package:ecommerce_app/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';
import '../widget/language/coustombuttonlanguage.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20,),
            //now when you Choose any language it will be save at the sharedpref and the application will start as this language
            //and for me the programmer if i want to test if choosing language is work
            //every time you change the language to test if its will start from this language you must unstall the app from your device
            Coustombuttonlanguage(textButton: "Ar",onPressed: (){
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onBoarding);
            }),
            Coustombuttonlanguage(textButton: "En",onPressed: (){
              controller.changeLang("en");
              Get.toNamed(AppRoute.onBoarding);
            }),

            
          ],
        ),
      ),
    );
  }
}
