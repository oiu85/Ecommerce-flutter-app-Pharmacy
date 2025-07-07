import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class OrdersArchiveData{
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid)async{
    var response = await crud.postData(AppLink.ordersarchive, {"id":userid,});
    return response.fold((l) => l, (r) => r,);

  }
  rating(String ordersid, String comment, String rating)async{
    var response = await crud.postData(AppLink.rating, {"id":ordersid,"rating":rating,"comment":comment});
    return response.fold((l) => l, (r) => r,);

  }

}