import 'dart:async';

import 'package:get/get.dart';
import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';

import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/notificationData.dart';
import 'package:opticalproject/data/user/model/notificationModel.dart';

abstract class NotificationController extends GetxController {
  getnotification();
  readAllAsMark();
  readAsMark(String id);
  gotonewOrder();
}

class NotificationControllerIm extends NotificationController {
  NotificationData notificationData = NotificationData(Get.put(Crud()));
  StatusRequest statusRequest = StatusRequest.none;
  List<notificationModel> viewData = [];
  RxInt notificationCount = 0.obs;

  MyServices myServices = Get.find();

  @override
  getnotification() async {
    try {
      var response = await notificationData.genotification();

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        viewData.clear();
        notificationCount.value = 0;
        for (var i = 0; i < response.length; i++) {
          viewData.add(notificationModel.fromJson(response[i]));
        }
        notificationCount.value = viewData.length;
 
        update();
      }
    } catch (_) {}
  }

  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
   
      await getnotification();
    });

    super.onInit();
  }

  @override
  readAllAsMark() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.markAllRead();

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response == "1") {
        customSucsessDialog();
        Get.back();
      }
    } else {
      customAlertDialg();
      Get.back();
    }
  }

  @override
  readAsMark(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.markRead(id);

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response == "success") {
        customSucsessDialog();
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    } else {
     // customAlertDialg();
      statusRequest = StatusRequest.serverfailure;
    }

    getnotification();
    update();
  }

  @override
  gotonewOrder() {
    if (myServices.sharedPreferences.getString("reole") == "delivary") {
      Get.toNamed(AppRoute.neworderdelivery);
    }
    if (myServices.sharedPreferences.getString("reole") == "warehouse") {
      Get.toNamed(AppRoute.newOrders);
    }
    if (myServices.sharedPreferences.getString("reole") == "costumer") {
      //    Get.toNamed(AppRoute.adddevice);
    }
  }
}
