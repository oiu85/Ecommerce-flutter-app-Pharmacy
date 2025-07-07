import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hidenText=true;
  double textheight=250;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textheight){
      firstHalf = widget.text.substring(0,textheight.toInt());
      secondHalf = widget.text.substring(textheight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty?Text(firstHalf,style: const TextStyle(fontSize: 16),):Column(
    //  child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor,size:Dimensions.font16,text: firstHalf):Column(
        children: [
          Text(hidenText?("$firstHalf..."):(firstHalf+secondHalf), style: const TextStyle(fontSize: 16),),
         // SmallText(height: 1.8,color: AppColors.paraColor,size: Dimensions.font16,text:hidenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hidenText=!hidenText;
              });
            },
            child: Row(
              children: [
                const Text( "Show more",style: TextStyle(color: AppColor.primaryColor),),
                Icon(hidenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColor.primaryColor,),
              ],
            ),
          )
        ],
      ),
    );

  }
}
