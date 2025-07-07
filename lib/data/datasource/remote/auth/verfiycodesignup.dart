import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class VerfiycodeSignUpData{
  Crud crud;
  VerfiycodeSignUpData(this.crud);
  postData( String email , String verfiycode )async{
    var response = await crud.postData(AppLink.verfiycodesignup, {
      "email":email,
      "verfiycode": verfiycode,

    });
    return response.fold((l) => l, (r) => r,);

  }
  resendData(String email)async{
    var response = await crud.postData(AppLink.resend, {"email":email,});
    return response.fold((l) => l, (r) => r,);
  }













}