// ignore: file_names
import 'package:get/get.dart';

import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/services/services.dart';

abstract class MaintinanceHomeController extends GetxController {
  logout();
  gotoNewOrder();
}

class MaintinanceHomeControllerImp extends MaintinanceHomeController {
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
  gotoNewOrder() {
    Get.toNamed(AppRoute.maintinanceNeworder);
  }
}
