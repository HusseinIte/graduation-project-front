// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/maintinance/maintinanceData.dart';
import 'package:opticalproject/data/user/model/maintinanceOrderModel.dart';

// ignore: camel_case_types
abstract class MaintinanceDetailsController extends GetxController {
  mainByMessage(int id, String decs);
  mainBySendGroub(int id);
  mainBywarehouse(int id);
  mainexcute(int id, String price, String Status);

  bool btnstatusMessage(MaintinanveOrderModel order);
  bool btnstatusGroub(MaintinanveOrderModel order);
  bool btnstatusWareHouse(MaintinanveOrderModel order);
  bool btnstatusend(MaintinanveOrderModel order);
}

// ignore: camel_case_types
class MaintinanceDetailsControllerImp extends MaintinanceDetailsController {
  late TextEditingController decr;
  late TextEditingController price;

  GlobalKey<FormState> formstatedecr = GlobalKey<FormState>();
  GlobalKey<FormState> formstateprice = GlobalKey<FormState>();

  @override
  void dispose() {
    decr.dispose();
    price.dispose();
    super.dispose();
  }

  MyServices myServices = Get.find();
  MaintinanceData maintinanceData = MaintinanceData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    decr = TextEditingController();
    price = TextEditingController();

    super.onInit();
  }

  @override
  mainByMessage(int id, String decs) async {
    if (formstatedecr.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await maintinanceData.mainByMessage(id, decs);
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          customSucsessDialog();
          Get.offNamed(AppRoute.maintinanceNeworder);

          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
      }

      update();
    }
  }

  @override
  mainBySendGroub(int id) async {
        statusRequest = StatusRequest.loading;
    update();
    var response = await maintinanceData.mainByGroub(id);
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        customSucsessDialog();
           Get.offNamed(AppRoute.maintinanceNeworder);
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.serverfailure;
        customAlertDialg();
      }
      update();
    } else {
      statusRequest = StatusRequest.serverfailure;
      customAlertDialg();
      update();
    }
  }

  @override
  mainBywarehouse(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await maintinanceData.mainByWareHouse(id);
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        customSucsessDialog();
           Get.offNamed(AppRoute.maintinanceNeworder);
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.serverfailure;
        customAlertDialg();
      }
      update();
    } else {
      statusRequest = StatusRequest.serverfailure;
      customAlertDialg();
      update();
    }
  }

  @override
  mainexcute(int id, String price, String Status) async {
    if (Status != "الطلب قيد الإنتظار في الصيانة") {
      if (formstateprice.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await maintinanceData.mainend(id, price);
        print(response);
        statusRequest = handlingData(response);
        print(response);
        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            customSucsessDialog();
            Get.offNamed(AppRoute.maintinanceNeworder);
          } else {
            statusRequest = StatusRequest.serverfailure;
            customAlertDialg();
          }
          update();
        } else {
          statusRequest = StatusRequest.serverfailure;
          customAlertDialg();
          update();
        }
      }
    }
  }

  @override
  bool btnstatusGroub(MaintinanveOrderModel order) {
    if (order.orderStatus == "تم تنفيذ الصيانة عن طريق إرسال رسالة") {
      return false;
    }
    return true;
  }

  @override
  bool btnstatusMessage(MaintinanveOrderModel order) {
    if (order.orderStatus == "تم تنفيذ الصيانة") {
      return false;
    }
    if (order.orderStatus ==
        "يحتاج للفحص من قريق الصيانة الذي سيقوم بزيارة المتجر") {
      return false;
    }
    if (order.orderStatus == "يحتاج للشحن من قيل عامل التوصيل") {
      return false;
    }

    return true;
  }

  @override
  bool btnstatusWareHouse(MaintinanveOrderModel order) {
    if (order.orderStatus == "تم تنفيذ الصيانة عن طريق إرسال رسالة") {
      return false;
    }
    return true;
  }

  @override
  bool btnstatusend(MaintinanveOrderModel order) {
    if (order.orderStatus == "الطلب قيد الإنتظار في الصيانة") {
      return true;
    } else {
      return true;
    }
  }
}









//الطلب قيد الإنتظار في الصيانة
//تم تنفيذ الصيانة عن طريق إرسال رسالة
//"يحتاج للفحص من قريق الصيانة الذي سيقوم بزيارة المتجر"
//"يحتاج للشحن من قيل عامل التوصيل"
//"تم تنفيذ الصيانة"