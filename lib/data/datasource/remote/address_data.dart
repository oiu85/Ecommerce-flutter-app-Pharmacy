import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class AddressData{
  Crud crud;
  AddressData(this.crud);
  getData(String usersid)async{
    var response = await crud.postData(AppLink.addressView, {
      "usersid":usersid,
    });
    return response.fold((l) => l, (r) => r,);

  }

  addData(String usersid,String name,String city,String street,String note,String lat,String long)async{
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid":usersid,
      "name":name,
      "city":city,
      "street":street,
      "note":note,
      "lat":lat,
      "long":long,
    });
    return response.fold((l) => l, (r) => r,);

  }

  deleteData(String addressid)async{
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid":addressid,
    });
    return response.fold((l) => l, (r) => r,);

  }

}