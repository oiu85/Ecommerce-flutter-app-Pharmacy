import 'package:get/get.dart';

validInput(String val, int min,int  max, String type){
  if(type=="username"){
    if(!GetUtils.isUsername(val)){
      return "34".tr;  //     "34":"Not Valid Username",
    }
  }
  if(type=="email"){
    if(!GetUtils.isEmail(val)){
      return "35".tr; // "35":"Not Valid Email",
    }
  }
  if(type=="phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "36".tr;// "36":"Not Valid Phone Number",
    }
  }
  if(val.isEmpty){
    return "39".tr; // "39":"Can't be Empty",
  }
  if(val.length<min){
    return "37".tr+min.toString(); // "37":"Can't Be Less than",
  }
  if(val.length>max){
    return "38".tr+max.toString();// "38":"Can't Be Larger than",
  }

}