import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class Home2Data{
  Crud crud;
  Home2Data(this.crud);
  getData(String categoryid, )async{
    var response = await crud.postData(AppLink.subcategories, {"categoryid":categoryid.toString(),});
    return response.fold((l) => l, (r) => r,);

  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }

}