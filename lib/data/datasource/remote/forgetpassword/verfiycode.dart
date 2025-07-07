import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class VerfiyCodeForgetPasswordData{
  Crud crud;
  VerfiyCodeForgetPasswordData(this.crud);
  postData( String email ,String verfiycode)async{
    var response = await crud.postData(AppLink.verfiycodeforgetpassword, {
      "email":email,
      "verfiycode":verfiycode,
    });
    return response.fold((l) => l, (r) => r,);

  }

}