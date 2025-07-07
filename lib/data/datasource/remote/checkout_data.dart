import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class CheckoutData{
  Crud crud;
  CheckoutData(this.crud);
  checkoutData(Map data)async{
    var response = await crud.postData(AppLink.checkout,data);
    return response.fold((l) => l, (r) => r,);

  }

}