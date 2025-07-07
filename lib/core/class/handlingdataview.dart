import 'package:ecommerce_app/core/class/statusrequest.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final  StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading? Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 250), ) :
    statusRequest==StatusRequest.offlinefailuer ? Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250)) :
    statusRequest == StatusRequest.serverfailuer? Center(child: Lottie.network("https://lottie.host/6ad13945-607a-4fd4-b87a-eb753d81b6f4/xrzzZRAHmg.json")) :
    statusRequest == StatusRequest.failure ? Center(child:Lottie.network("https://lottie.host/cf7edde0-26fb-420b-90e0-5baea6462050/3zSoTC2Mmt.json")) :
        statusRequest == StatusRequest.serverException? Center(child: Lottie.network("https://lottie.host/6ad13945-607a-4fd4-b87a-eb753d81b6f4/xrzzZRAHmg.json"),):
    widget;
  }
}


class HandlingDataRequest extends StatelessWidget {
  final  StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading? Center(child:Lottie.asset(AppImageAsset.loading,width: 250,height: 250), ) :
    statusRequest==StatusRequest.offlinefailuer ? Center(child: Lottie.asset(AppImageAsset.offline,width: 250,height: 250)) :
    statusRequest == StatusRequest.serverfailuer? Center(child: Lottie.network("https://lottie.host/6ad13945-607a-4fd4-b87a-eb753d81b6f4/xrzzZRAHmg.json")) :
    statusRequest == StatusRequest.serverException? Center(child: Lottie.network("https://lottie.host/6ad13945-607a-4fd4-b87a-eb753d81b6f4/xrzzZRAHmg.json"),):
    widget;
  }
}