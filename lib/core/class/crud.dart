import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud{
  Future <Either<StatusRequest,Map>> postData(String linkurl,  Map data) async{
    try{
      if(await checkInternet()){
        var response = await http.post(Uri.parse(linkurl),body: data);
        if(response.statusCode==200||response.statusCode==201){
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        }else{
          return left(StatusRequest.serverfailuer);
        }
      }else{
        return const Left(StatusRequest.offlinefailuer);
      }
    }catch(_){
      return left(StatusRequest.serverException);
    }
  }
}