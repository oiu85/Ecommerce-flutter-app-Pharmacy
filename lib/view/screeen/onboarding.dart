import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../widget/onboarding/customboutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotscontroller.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.backgroundCoor,
      body: SafeArea(
        child: Column(children: [
            Expanded(
              flex: 4,
              child: CustomsliderOnBoading(),
            ),
            Expanded(
              flex: 1,
                child:Column(
                  children: [
                    CoustomDotControllerOnBoarding(),
                    Spacer(flex: 2,),
                    CustomBouttonOnBoarding(),
                  ],
                ) )
          ],
        ),
      ),
    );
  }
}
