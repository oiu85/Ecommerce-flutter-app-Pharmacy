import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/responsivehelper.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller)=>
       BottomAppBar(
        height: Responsive.h(110),
        shape: const CircularNotchedRectangle(),
        notchMargin: Responsive.margin(16),
        child:Row(
          children: [

            ...List.generate(
                controller.listPage.length+1,
                    (index){
                  int i= index>2? index-1 : index;
                  return  index==2? const Spacer(): CustomButtonAppBar(
                    onPressed:(){
                      controller.changePage(i);
                    },
                    textButton: controller.bottomappbar[i]["title"],
                    iconData: controller.bottomappbar[i]["icon"],
                    active: controller.currentPage== i? true:false,
                  );
                }
            ),
          ],
        ) ,
      ),
    );
  }
}
