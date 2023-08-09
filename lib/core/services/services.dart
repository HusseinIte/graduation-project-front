import 'dart:async';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }


}

initialServices() async {
  await Get.putAsync(() => MyServices().init());

}



/*

  Future<MyServices> init2() async {
    NotificationControllerIm notificationControllerIm =
        NotificationControllerIm();
    Timer.periodic(const Duration(seconds: 10), (timer) async {

      await notificationControllerIm.getnotification();
    });

    return this;
  }


*/