import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';

import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';

import 'package:opticalproject/data/user/remote/orderData.dart';

abstract class MaintinanceOrderController extends GetxController {
  getMyMaintinanceOrder();
  readMessage(int id);
}

class MaintinanceOrderControllerImp extends MaintinanceOrderController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());

  List<orderModel> viewdatalist = [];

  @override
  void onInit() {
    getMyMaintinanceOrder();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  getMyMaintinanceOrder() async {
    viewdatalist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.getmainOrder();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List data = response["data"];
      for (var i = 0; i < data.length; i++) {
        viewdatalist.add(orderModel.fromJson(data[i]));
      }
    } else {
      statusRequest = StatusRequest.serverException;
      customAlertDialg();
    }
    update();
  }

  @override
  readMessage(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.readMessage(id);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      String message = response["desc"];
      Get.defaultDialog(
          title: "",
          content: SingleChildScrollView(
              child: Row(
            children: [Expanded(child: Text(message))],
          )));
    } else {
      statusRequest = StatusRequest.serverException;
      customAlertDialg();
    }
    update();
  }
}
