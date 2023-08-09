// ignore_for_file: prefer_is_empty

import 'package:get/get.dart';

import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/data/user/model/orderDetailsModel.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';
import 'package:opticalproject/data/warehouse/orderdata.dart';

abstract class NewOrderController extends GetxController {
  excute(int idorder);
  reject(int idorder);
  getNewOrder();
}

class NewOrderControllerImp extends NewOrderController {
  orderwarehouseData orderwarehousedata = orderwarehouseData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<orderModel> dataviewnew = [];
  List<orderModel> dataviewinwarehouse = [];
  List<orderModel> dataviewreject = [];
  List<orderModel> dataviewdelevery = [];
  @override
  void onInit() {
    getNewOrder();
    super.onInit();
  }

  @override
  getNewOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderwarehousedata.getNewOrder();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      var data = response["data"];
      print(data);
      for (var i = 0; i < data.length; i++) {
        if (data[i]["orderStatus"] == "الطلب مرفوض") {
        } else {
          List<orderDetailsModel>? itemedetails = [];
          for (var j = 0; j < data[i]["orderItem"].length; j++) {
            itemedetails
                .add(orderDetailsModel.fromJson(data[i]["orderItem"][j]));
          }
          dataviewnew.add(orderModel(
            orderItem: itemedetails,
            id: data[i]["id"],
            createdAt: data[i]["created_at"],
            orderStatus: data[i]["orderStatus"],
            orderType: data[i]["orderType"],
            totalPrice: data[i]["totalPrice"],
            updatedAt: data[i]["updated_at"],
            centerName: data[i]["customer_id"].toString(),
          ));
        }
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    if (dataviewnew.length == 0) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  excute(int idorder) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderwarehousedata.excuteorder(idorder);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        customSucsessDialog();
      } else {
        statusRequest = StatusRequest.failure;
        customAlertDialg();
      }
      update();
    } else {
      statusRequest = StatusRequest.failure;
      customAlertDialg();
    }
    dataviewnew.clear();

    await getNewOrder();
  }

  @override
  reject(int idorder) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderwarehousedata.rejectOrder(idorder);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      customSucsessDialog();
    } else {
      statusRequest = StatusRequest.failure;
      customAlertDialg();
    }
    dataviewnew.clear();

    await getNewOrder();
  }
}
