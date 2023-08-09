// ignore_for_file: camel_case_types, file_names

import 'package:get/get.dart';

import 'package:opticalproject/core/class/statusrequest.dart';

import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/delivery/deliveryOrderData.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';

abstract class deliverOrderNewController extends GetxController {
  getNewOrderDelivery();
  startDelivery(int index);
  endDeliveryTocostumer(int index);
}

class deliverOrderNewControllerIm extends deliverOrderNewController {
  DeliveryData deliveryData = DeliveryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<orderModel> viewData = [];
  List<bool> statusControl = [];

  MyServices myServices = Get.find();

  getNewOrderDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deliveryData.getnewOrderDelivery();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      viewData.clear();
      statusControl.clear();
      for (var i = 0; i < response.length; i++) {
        if (response[i]["orderType"] == "شراء") {
          viewData.add(
            orderModel(
              id: response[i]["id"],
              centerName: response[i]["customer_id"].toString(),
              createdAt: response[i]["created_at"],
              orderItem: [],
              orderStatus: response[i]["orderStatus"],
              orderType: response[i]["orderType"],
              totalPrice: response[i]["totalPrice"],
              updatedAt: response[i]["updated_at"],
            ),
          );
          statusControl.add(
              response[i]["orderStatus"] == "الطلب جاهز في المستودع"
                  ? true
                  : false);
        }
      }
      // ignore: prefer_is_empty
      if (viewData.length == 0) {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      customAlertDialg();
    }
    update();
  }

  startDelivery(int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await deliveryData.receiveOrderFromWareHouse(viewData[index].id!);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "جاري شحن الطلب") {
        statusControl[index] = false;
        customSucsessDialog();
        statusRequest = StatusRequest.loading;
        update();

        getNewOrderDelivery();
      } else {
        customAlertDialg();
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      customAlertDialg();
    }
    update();
  }

  endDeliveryTocostumer(int index) async {
    if (viewData[index].orderStatus == "تم استلام الطلب") {
      statusRequest = StatusRequest.loading;
      update();

      var response = await deliveryData.deliverdOrder(viewData[index].id!);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          customSucsessDialog();

          getNewOrderDelivery();
        } else {
          customAlertDialg();
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
        customAlertDialg();
      }
      update();
    } else {
      Get.snackbar("", "178".tr);
    }
  }

  @override
  void onInit() {
    getNewOrderDelivery();
    super.onInit();
  }
}
