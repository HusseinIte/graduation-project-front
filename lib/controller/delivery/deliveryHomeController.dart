// ignore: file_names
import 'package:get/get.dart';

import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/services/services.dart';

abstract class DleiveryHOmeController extends GetxController {
  gotoOrdernew();
  gotoOrddone();
  gotonotification();
  logout();
}

class DleiveryHOmeControllerIm extends DleiveryHOmeController {
  MyServices myServices = Get.find();

  @override
  logout() {
    myServices.sharedPreferences.setString("user", "");
    myServices.sharedPreferences.setString("token", "");
    myServices.sharedPreferences.setString("reole", "");
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  @override
  gotoOrddone() {
    Get.toNamed(AppRoute.orderdonedelivery);
  }

  @override
  gotoOrdernew() {
    Get.toNamed(AppRoute.neworderdelivery);
  }

  @override
  gotonotification() {
    Get.toNamed(AppRoute.notificationscreen);
  }
}
