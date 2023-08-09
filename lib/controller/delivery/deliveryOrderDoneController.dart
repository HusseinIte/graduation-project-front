import 'package:get/get.dart';
import 'package:opticalproject/core/class/statusrequest.dart';


import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/delivery/deliveryOrderData.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';

abstract class deliveryOrderDoneController extends GetxController {}

class deliveryOrderDoneControllerIm extends deliveryOrderDoneController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  DeliveryData deliveryData = DeliveryData(Get.find());

  List<orderModel> viewData = [];

  getmyOrderDeliveryed() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deliveryData.getmyOrderDeliveryed();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      viewData.clear();

      for (var i = 0; i < response.length; i++) {
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
      }
      if (viewData.length == 0) {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      customAlertDialg();
    }
    update();
  }

  @override
  void onInit() {
    getmyOrderDeliveryed();
    super.onInit();
  }
}
