import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/medicalinfo_data.dart';
import 'package:ecommerce_app/data/model/medicalinfomodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/services/NotificationService.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';

class MediaclInfoController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  MedicalInfoData medicalInfoData = MedicalInfoData(Get.find());
  NotificationService notificationService = Get.find<NotificationService>();

  // Text controllers for form fields
  late TextEditingController ageController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController chronicDiseasesController;
  late TextEditingController allergiesController;
  late TextEditingController medicationsController;
  late TextEditingController notesController;

  // Selected values for dropdowns
  String? selectedGender;
  String? selectedBloodType;

  List<MedicalInfoModel> data = [];
  late StatusRequest statusRequest;
  MedicalInfoModel? existingInfo;

  @override
  void onInit() {
    ageController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    chronicDiseasesController = TextEditingController();
    allergiesController = TextEditingController();
    medicationsController = TextEditingController();
    notesController = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    chronicDiseasesController.dispose();
    allergiesController.dispose();
    medicationsController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void updateGender(String? value) {
    selectedGender = value;
    update();
  }

  void updateBloodType(String? value) {
    selectedBloodType = value;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await medicalInfoData.getData(myServices.sharedPreferences.getString("id")!);
    print("========================================Controller  $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.clear();
        if (datalist.isNotEmpty) {
          data.addAll(datalist.map((e) => MedicalInfoModel.fromJson(e)).toList());
          existingInfo = data.first;
          populateFormWithExistingData();
        } else {
          data.clear();
          existingInfo = null;
          ageController.clear();
          heightController.clear();
          weightController.clear();
          selectedGender = null;
          selectedBloodType = null;
          chronicDiseasesController.clear();
          allergiesController.clear();
          medicationsController.clear();
          notesController.clear();
        }
      } else {
        data.clear();
        existingInfo = null;
      }
    }
    update();
  }

  void populateFormWithExistingData() {
    if (existingInfo != null) {
      ageController.text = existingInfo!.medicalInfoAge?.toString() ?? '';
      heightController.text = existingInfo!.medicalInfoHeight?.toString() ?? '';
      weightController.text = existingInfo!.medicalInfoWeight?.toString() ?? '';
      selectedGender = existingInfo!.medicalInfoGender;
      selectedBloodType = existingInfo!.medicalInfoBloodType;
      chronicDiseasesController.text = existingInfo!.medicalInfoChronicDiseases ?? '';
      allergiesController.text = existingInfo!.medicalInfoAllergies ?? '';
      medicationsController.text = existingInfo!.medicalInfoCurrentMedications ?? '';
      notesController.text = existingInfo!.medicalInfoAdditionalNotes ?? '';
    }
  }

  Future<void> saveMedicalInfo() async {
    try {
      if (!formstate.currentState!.validate()) {
        return;
      }

      if (selectedGender == null || selectedBloodType == null) {
        notificationService.showErrorNotification(
            title: "Warning",
            message: "Please fill in all required fields"
        );
        return;
      }

      // Validate numeric fields
      if (int.tryParse(ageController.text) == null ||
          int.tryParse(heightController.text) == null ||
          int.tryParse(weightController.text) == null) {
        notificationService.showErrorNotification(
            title: "Warning",
            message: "Please enter valid numbers for age, height, and weight"
        );
        return;
      }

      statusRequest = StatusRequest.loading;
      update();

      Map data = {
        "userid": myServices.sharedPreferences.getString("id"),
        "age": ageController.text,
        "height": heightController.text,
        "weight": weightController.text,
        "gender": selectedGender!,
        "type": selectedBloodType!,
        "diseases": chronicDiseasesController.text,
        "allergies": allergiesController.text,
        "medications": medicationsController.text,
        "additional_notes": notesController.text,
      };

      print("+++++++++++++++++++++++++++++++++++++++++Sending data to server: $data"); // Debug print

      var response;
      if (existingInfo != null) {
        Map updateData = {
          "id": existingInfo!.medicalInfoId.toString(),
          "userid": myServices.sharedPreferences.getString("id"),
          "age": ageController.text,
          "height": heightController.text,
          "weight": weightController.text,
          "gender": selectedGender!,
          "type": selectedBloodType!,
          "diseases": chronicDiseasesController.text,
          "allergies": allergiesController.text,
          "medications": medicationsController.text,
          "additional_notes": notesController.text,
        };
        print("+++++++++++++++++++++++++++++++++++++++++Sending update data to server: $updateData"); // Debug print
        response = await medicalInfoData.updateData(updateData);
      } else {
        response = await medicalInfoData.addData(data);
      }

      print("===============================================Server response: $response"); // Debug print

      if (response == null) {
        throw Exception("No response from server");
      }

      if (response is StatusRequest) {
        if (response == StatusRequest.serverException) {
          notificationService.showErrorNotification(
              title: "Server Error",
              message: "Unable to connect to the server. Please check your internet connection and try again."
          );
          statusRequest = StatusRequest.serverException;
          return;
        } else if (response == StatusRequest.offlinefailuer) {
          notificationService.showErrorNotification(
              title: "No Internet",
              message: "Please check your internet connection and try again."
          );
          statusRequest = StatusRequest.offlinefailuer;
          return;
        } else if (response == StatusRequest.serverfailuer) {
          notificationService.showErrorNotification(
              title: "Server Error",
              message: "The server is currently unavailable. Please try again later."
          );
          statusRequest = StatusRequest.serverfailuer;
          return;
        }
      }

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          notificationService.showSuccessNotification(
              title: "Success",
              message: existingInfo != null ? "Medical information updated successfully" : "Medical information added successfully"
          );
          await getData(); // Refresh data
        } else {
          String errorMessage = response['message'] ?? "An error occurred while saving the information";
          notificationService.showErrorNotification(
              title: "Error",
              message: errorMessage
          );
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      print("Error in saveMedicalInfo: $e"); // Debug print
      notificationService.showErrorNotification(
          title: "Error",
          message: "An unexpected error occurred. Please try again."
      );
      statusRequest = StatusRequest.failure;
    } finally {
      update();
    }
  }
}