import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/settings_controrller.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade50, Colors.white],
          stops: const [0.0, 0.3],
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2.5,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: Get.width / 3.5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage:  AssetImage(AppImageAsset.oavatar),
                  ),
                ),
              ),
              SizedBox(height: 2,),
            ],
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              elevation: 5,
              shadowColor: Colors.blue.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // _buildSettingItem(
                  //   title: '108'.tr, // Disable Notifications
                  //   trailing: Switch(
                  //     value: true,
                  //     onChanged: (val) {},
                  //     activeColor: AppColor.primaryColor,
                  //   ),
                  // ),
                  // _buildDivider(),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.mdicinfo);
                    },
                    title: '157'.tr,
                    trailing:  const Icon(Icons.medical_information_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.orederspending);
                    },
                    title: '109'.tr, // Orders
                    trailing:  const Icon(Icons.delivery_dining_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.ordersarchive);
                    },
                    title: '110'.tr, // Archived Orders
                    trailing: const Icon(Icons.archive_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.rejectedorders);
                    },
                    title: "158".tr,
                    trailing: const Icon(Icons.report_problem_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    onTap: (){
                      Get.toNamed(AppRoute.addressview);
                    },
                    title: '111'.tr, // Address
                    trailing: const Icon(Icons.location_on_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    title: '112'.tr, // About Us
                    trailing: const Icon(Icons.help_outline_outlined, color: AppColor.primaryColor,size: 30),
                    onTap: (){
                      Get.defaultDialog(
                        title: 'من نحن',
                        titleStyle: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        radius: 20,
                        content: Container(
                          width: double.maxFinite,
                          height: Get.height * 0.6, // 60% من ارتفاع الشاشة
                          child: const SingleChildScrollView(
                            child: Text(
                              "مرحباً بكم في"
                                  " تطبيق صيدليتك أونلاين،\nأنا عبدالله، مطور هذا التطبيق، وأسعى من خلاله لتوفير تجربة سهلة"
                                  " وآمنة للوصول إلى أدويتك ومستلزماتك الصحية بكل سهولة وراحة، من دون الحاجة للانتقال"
                                  "إلى الصيدلية.\n\nهدفنا هو تمكين المستخدمين من الحصول على ما يحتاجونه بسرعة وبثقة،"
                                  " مع توفير معلومات دقيقة وموثوقة عن الأدوية، وخدمة توصيل سريعة إلى باب "
                                  "بيتك.\n\nنسعى لأن نكون شركاء في صحة مجتمعنا، ونساهم في جعل الرعاية الصحية"
                                  " أقرب إليكم، وذلك من خلال استخدام"
                                  " أحدث التقنيات وتقديم أفضل الخدمات.\n\n",
                              style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        confirm: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'إغلاق',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    onTap: ()async {
                      await launchUrl(Uri.parse("tel:+963996094461"));
                    },
                    title: '113'.tr, // Contact Us
                    trailing: const Icon(Icons.phone_callback_outlined, color: AppColor.primaryColor,size: 30),
                  ),
                  _buildDivider(),
                  _buildSettingItem(
                    title: "114".tr, // Logout
                    trailing: const Icon(Icons.exit_to_app, color: Colors.red,size: 30),
                    onTap: () => controller.logout(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
              child:
              Text("All Copy Rights is Reserved @2025",
            style: TextStyle(color: AppColor.secondColor,fontWeight: FontWeight.bold),
              )
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 0.2,
      thickness: 2,
      color: Colors.grey.withOpacity(0.1),
    );
  }
}
