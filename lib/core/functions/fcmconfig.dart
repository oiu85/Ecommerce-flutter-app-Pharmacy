import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../controller/orders/pending_controller.dart';
requestPermissionNotification() async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}
fcmconfig(){
  FirebaseMessaging.onMessage.listen((message){
    print("================================= Notification=================================" );
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}
refreshPageNotification(data){
  print("============================page id==========================");
  print(data['pageid']);
  print("============================page name==========================");
  print(data['pagename']);
  print("============================Current Route========================");
  print(Get.currentRoute);

  if(Get.currentRoute == "/orederspending" && data['pagename'] == "refreshorderpending"){
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}

//firebase + streaming
//socket io
//Notification refresh