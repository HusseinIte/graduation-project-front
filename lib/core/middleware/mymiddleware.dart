import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homescreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }

    if (myServices.sharedPreferences.getString("step") == "3") {
      return const RouteSettings(name: AppRoute.warehouse);
    }
    if (myServices.sharedPreferences.getString("step") == "4") {
      return const RouteSettings(name: AppRoute.homedelivery);
    }
    if (myServices.sharedPreferences.getString("step") == "5") {
      return const RouteSettings(name: AppRoute.maintinanceHome);
    }

    return null;
  }
}
