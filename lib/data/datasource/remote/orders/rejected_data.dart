import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class OrdersRejectedData {
  Crud crud;
  OrdersRejectedData(this.crud);
  
  getData(String userid) async {
    var response = await crud.postData(AppLink.rejectedorders, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
