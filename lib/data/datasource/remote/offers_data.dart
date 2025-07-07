import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class OffersData{
  Crud crud;
  OffersData(this.crud);
  getData()async{
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r,);

  }

}