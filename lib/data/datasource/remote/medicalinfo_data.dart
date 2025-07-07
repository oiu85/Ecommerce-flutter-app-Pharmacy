import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:intl/date_time_patterns.dart';

class MedicalInfoData {
  Crud crud;
  MedicalInfoData(this.crud);


  getData(String userId) async {
    var response = await crud.postData(AppLink.medicalInfoView, {
      "users_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }


  addData( Map data) async {
    var response = await crud.postData(AppLink.medicalInfoAdd, data );
    return response.fold((l) => l, (r) => r);
  }

  updateData(Map data) async {
    var response = await crud.postData(AppLink.medicalInfoUpdate,data );
    return response.fold((l) => l, (r) => r);
  }
}