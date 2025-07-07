import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';

class ChatData{
  Crud crud;
  ChatData(this.crud);
  getMessages(String usersid, String adminid)async{
    var response = await crud.postData(AppLink.getmessage, {"usersid":usersid,"adminid":adminid});
    return response.fold((l) => l, (r) => r,);

  }

  sendMessages(String usersid, String adminid,String message)async{
    var response = await crud.postData(AppLink.getmessage, {"usersid":usersid,"adminid":adminid,"message":message});
    return response.fold((l) => l, (r) => r,);

  }


}