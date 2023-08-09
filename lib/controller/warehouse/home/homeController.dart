// ignore: file_names
import 'package:get/get.dart';

import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/services/services.dart';


abstract class HomeWareHouseController extends GetxController {
  gotoOrder();
  gotoProduct();
  logout();
  gotonotification();
}

class HomeWareHouseControllerImp extends HomeWareHouseController {
  MyServices myServices = Get.find();
  @override
  gotoOrder() {
    Get.toNamed(AppRoute.orderMangment);
  }

  @override
  gotoProduct() {
    Get.toNamed(AppRoute.ProductMangment);
  }

  @override
  logout() {
    myServices.sharedPreferences.setString("user", "");
    myServices.sharedPreferences.setString("token", "");
    myServices.sharedPreferences.setString("reole", "");
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  @override
  gotonotification() {
    Get.toNamed(AppRoute.notificationscreen);
  }
}
