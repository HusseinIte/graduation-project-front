// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/class/statusrequest.dart';

import 'package:opticalproject/core/constant/routes.dart';

import 'package:opticalproject/core/functions/handingdatacontroller.dart';

import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/maintinance/maintinanceData.dart';
import 'package:opticalproject/data/user/model/maintinanceOrderModel.dart';

// ignore: camel_case_types
abstract class newOrderMaintinanceController extends GetxController {
  getNewMaintinanceOrder();

  gotoOrderDetails(MaintinanveOrderModel maintinanveOrderModel);
}

// ignore: camel_case_types
class newOrderMaintinanceControllerImp extends newOrderMaintinanceController {
  @override
  void dispose() {
    super.dispose();
  }

  MyServices myServices = Get.find();
  MaintinanceData maintinanceData = MaintinanceData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<MaintinanveOrderModel> dataviewnew = [];

  @override
  getNewMaintinanceOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await maintinanceData.getNewMaintinance();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      dataviewnew.clear();
      print(response);
      var data = response["data"];
      for (var i = 0; i < data.length; i++) {
        if (data[i]["orderStatus"] != "تم تنفيذ الصيانة" &&
            data[i]["orderStatus"] != "تم تنفيذ الصيانة عن طريق إرسال رسالة") {
          dataviewnew.add(MaintinanveOrderModel.fromJson(data[i]));
        }
      }
      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    // ignore: prefer_is_empty
    if (dataviewnew.length == 0) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getNewMaintinanceOrder();
    super.onInit();
  }

  @override
  gotoOrderDetails(MaintinanveOrderModel maintinanveOrderModel) {
    Get.offNamed(AppRoute.maintinanceDetails, arguments: maintinanveOrderModel);
  }
}









//الطلب قيد الإنتظار في الصيانة
//تم تنفيذ الصيانة عن طريق إرسال رسالة
//"يحتاج للفحص من قريق الصيانة الذي سيقوم بزيارة المتجر"
//"يحتاج للشحن من قيل عامل التوصيل"
//"تم تنفيذ الصيانة"