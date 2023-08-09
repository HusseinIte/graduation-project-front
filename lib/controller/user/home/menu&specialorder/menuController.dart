import 'dart:ui';

import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/maintinanceOrderController.dart';

import 'package:opticalproject/controller/user/home/menu&specialorder/specialOrderController.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/services/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constant/color.dart';

abstract class MenuController extends GetxController {
  handlingMenuRoute(String title);
  gotospecialOrder();
  gotoSpecialOrderDone();
}

class MenuControllerImp extends MenuController {
  MyServices myServices = Get.find();
  late SharedPreferences prefs;
  final List<Map<String, dynamic>> data = [
    {
      'title': "56".tr,
      'backgroundColor': const Color.fromARGB(255, 230, 228, 228),
    },
    {
      'title': "57".tr,
      'backgroundColor': const Color.fromARGB(255, 230, 228, 228),
    },
    {
      'title': "185".tr,
      'backgroundColor': const Color.fromARGB(255, 230, 228, 228),
    },
    {
      'title': "58".tr,
      'backgroundColor': const Color.fromARGB(255, 230, 228, 228),
    },
    {
      'title': "59".tr,
      'backgroundColor': const Color.fromARGB(255, 230, 228, 228),
    },
    {
      'title': "60".tr,
      'backgroundColor': const Color.fromARGB(255, 230, 228, 228),
    },
    {
      'title': "61".tr,
      'backgroundColor': AppColor.primaryColor,
    },
  ];

  //for animated list

  @override
  gotoSpecialOrderDone() {
    Get.toNamed(AppRoute.specialOrderdone);
  }

  @override
  gotospecialOrder() {
    Get.toNamed(AppRoute.specialOrder);
  }

  @override
  handlingMenuRoute(String title) async {
    if (title == "56".tr) {
      gotoSpecialOrderDone();
    } else if (title == "185".tr) {
      MaintinanceOrderControllerImp().getMyMaintinanceOrder;
      Get.toNamed(AppRoute.mainView);
    } else if (title == "57".tr) {
      SpecialOrderControllerImp(specialOrderDone: false).getMyOrder(false);
      gotospecialOrder();
    } else if (title == "58".tr) {
      Get.toNamed(AppRoute.lensOrder);
    } else if (title == "59".tr) {
      Get.toNamed(AppRoute.repearorder);
    } else if (title == "61".tr) {
      myServices.sharedPreferences.setString("user", "");
      myServices.sharedPreferences.setString("token", "");
      myServices.sharedPreferences.setString("reole", "");
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    }
  }
}
