import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid)async{
    var response = await crud.postData(
        AppLink.cartAdd, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r,);

  }
  deleteCart(String usersid, String itemsid)async{
    var response = await crud.postData(
        AppLink.cartDelete, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r,);

  }

  getCountCart(String usersid, String itemsid)async{
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid":usersid,"itemsid":itemsid});
    return response.fold((l) => l, (r) => r,);

  }

  viewCart(String usersid)async{
    var response = await crud.postData(
        AppLink.cartview, {"usersid":usersid});
    return response.fold((l) => l, (r) => r,);

  }


  checkCoupon(String couponname)async{
    var response = await crud.postData(
        AppLink.checkCoupon, {"couponname":couponname});
    return response.fold((l) => l, (r) => r,);
  }
}