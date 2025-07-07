
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class UsersData{
  Crud crud;
  UsersData(this.crud);

  getData()async{
    var response = await crud.postData(AppLink.usersview, {});
    return response.fold((l) => l, (r) => r,);

  }



}