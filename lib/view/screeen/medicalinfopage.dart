import 'package:ecommerce_app/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';

import '../../controller/medical_controller.dart';
import '../widget/auth/coustomtextformauth.dart';

class MedicalInfoScreen extends StatelessWidget {
  const MedicalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MediaclInfoController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("157".tr),
        elevation: 0,
      ),
      body: GetBuilder<MediaclInfoController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: controller.data.isEmpty 
            ? _buildAddForm(controller)
            : _buildViewData(controller),
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumber = false,
    String? Function(String?)? validator,
    String? hint,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColor.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildAddForm(MediaclInfoController controller) {
    return Form(
      key: controller.formstate,
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Icon(Icons.health_and_safety,
                  color: AppColor.primaryColor,
                  size: 60
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildCustomTextField(
                      controller: controller.ageController,
                      label: "161".tr,
                      icon: Icons.calendar_today,
                      isNumber: true,
                      hint: "162".tr,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "163".tr;
                        }
                        if (int.tryParse(val) == null) {
                          return "164".tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCustomTextField(
                      controller: controller.heightController,
                      label: "165".tr,
                      icon: Icons.height,
                      isNumber: true,
                      hint: "166".tr,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "167".tr;
                        }
                        if (int.tryParse(val) == null) {
                          return "164".tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildCustomTextField(
                      controller: controller.weightController,
                      label: "168".tr,
                      icon: Icons.monitor_weight_outlined,
                      isNumber: true,
                      hint: "169".tr,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "170".tr;
                        }
                        if (int.tryParse(val) == null) {
                          return "164".tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        value: controller.selectedGender,
                        decoration: InputDecoration(
                          labelText: "171".tr,
                          prefixIcon: Icon(Icons.person, color: AppColor.primaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AppColor.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: AppColor.primaryColor),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                        items:  [
                          DropdownMenuItem(value: "Male", child: Text("172".tr)),
                          DropdownMenuItem(value: "Female", child: Text("173".tr)),
                        ],
                        onChanged: controller.updateGender,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "174".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: DropdownButtonFormField<String>(
                        value: controller.selectedBloodType,
                        decoration: InputDecoration(
                          labelText: "175".tr,
                          prefixIcon: Icon(Icons.bloodtype, color: AppColor.primaryColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AppColor.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: AppColor.primaryColor),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                        items: const [
                          DropdownMenuItem(value: "A+", child: Text("A+")),
                          DropdownMenuItem(value: "A-", child: Text("A-")),
                          DropdownMenuItem(value: "B+", child: Text("B+")),
                          DropdownMenuItem(value: "B-", child: Text("B-")),
                          DropdownMenuItem(value: "AB+", child: Text("AB+")),
                          DropdownMenuItem(value: "AB-", child: Text("AB-")),
                          DropdownMenuItem(value: "O+", child: Text("O+")),
                          DropdownMenuItem(value: "O-", child: Text("O-")),
                        ],
                        onChanged: controller.updateBloodType,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "176".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildCustomTextField(
                controller: controller.chronicDiseasesController,
                label: "178".tr,
                icon: Icons.medical_information,
                hint: "179".tr,
              ),
              _buildCustomTextField(
                controller: controller.allergiesController,
                label: "180".tr,
                icon: Icons.warning_amber_rounded,
                hint: "181".tr,
            ),
              _buildCustomTextField(
                controller: controller.medicationsController,
                label: "182".tr,
                icon: Icons.medication_outlined,
                hint: "183".tr,
              ),
              _buildCustomTextField(
                controller: controller.notesController,
                label: "184".tr,
                icon: Icons.note_alt_outlined,
                hint:  "184".tr,
              ),
              const SizedBox(height: 20),
              CustomButtomAuth(
                text: "185".tr,
                onPressed: () {
                  controller.saveMedicalInfo();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewData(MediaclInfoController controller) {
    final info = controller.data.first;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Icon(Icons.health_and_safety, 
                color: AppColor.primaryColor, 
                size: 60
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow("161".tr, "${info.medicalInfoAge} ${"186".tr}"),
                    _buildInfoRow("165".tr, "${info.medicalInfoHeight} ${"187".tr}"),
                    _buildInfoRow("168".tr, "${info.medicalInfoWeight} ${"188".tr}"),
                    _buildInfoRow("171".tr, info.medicalInfoGender ?? "189".tr),
                    _buildInfoRow("175".tr, info.medicalInfoBloodType ?? "190".tr),
                    if (info.medicalInfoChronicDiseases?.isNotEmpty ?? false)
                      _buildInfoRow("178".tr, info.medicalInfoChronicDiseases!),
                    if (info.medicalInfoAllergies?.isNotEmpty ?? false)
                      _buildInfoRow("180".tr, info.medicalInfoAllergies!),
                    if (info.medicalInfoCurrentMedications?.isNotEmpty ?? false)
                      _buildInfoRow("182".tr, info.medicalInfoCurrentMedications!),
                    if (info.medicalInfoAdditionalNotes?.isNotEmpty ?? false)
                      _buildInfoRow("184".tr, info.medicalInfoAdditionalNotes!),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButtomAuth(
              text: "160".tr,
              onPressed: () {
                controller.data.clear();
                controller.update();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}