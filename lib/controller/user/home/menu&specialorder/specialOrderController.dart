// ignore: file_names
import 'package:get/get.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/data/user/model/orderDetailsModel.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';
import 'package:opticalproject/data/user/remote/orderData.dart';

abstract class SpecialOrderController extends GetxController {
  getMyOrder(bool doneOrNor);
  recieveOrder(int id);
}

class SpecialOrderControllerImp extends SpecialOrderController {
  final bool specialOrderDone;

  SpecialOrderControllerImp({required this.specialOrderDone});

  List data = [];

  List<orderModel> viewdatalist = [];
  OrderData orderdata = OrderData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  getMyOrder(bool doneOrNor) async {
    viewdatalist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.getOrder(doneOrNor);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      data = response["data"];
      for (var i = 0; i < data.length; i++) {
        List<orderDetailsModel> orderitem = [];
        if (data[i]["orderItem"] != null) {
          for (var j = 0; j < data[i]["orderItem"].length; j++) {
            orderitem.add(orderDetailsModel(
                id: data[i]["orderItem"][j]["id"],
                numberModel: data[i]["orderItem"][j]["numberModel"],
                productType: data[i]["orderItem"][j]["productType"],
                quantity: data[i]["orderItem"][j]["quantity"]));
          }
        }

        if (doneOrNor) {
          if (data[i]["orderStatus"] == "الطلب جاهز في المستودع" ||
              data[i]["orderStatus"] == "تم تسليم الطلب" ||
              data[i]["orderStatus"] == "جاري شحن الطلب") {
            viewdatalist.add(orderModel(
                createdAt: data[i]["created_at"],
                id: data[i]["id"],
                orderStatus: data[i]["orderStatus"],
                orderType: data[i]["orderType"],
                totalPrice: data[i]["totalPrice"],
                updatedAt: data[i]["updatedAt"],
                centerName: data[i]["centerName"],
                orderItem: orderitem));
          }
        } else {
          if (data[i]["orderStatus"] != "الطلب جاهز في المستودع" &&
              data[i]["orderStatus"] != "تم تسليم الطلب" &&
              data[i]["orderStatus"] != "جاري شحن الطلب") {
            viewdatalist.add(orderModel(
                createdAt: data[i]["created_at"],
                id: data[i]["id"],
                orderStatus: data[i]["orderStatus"],
                orderType: data[i]["orderType"],
                totalPrice: data[i]["totalPrice"],
                updatedAt: data[i]["updatedAt"],
                centerName: data[i]["centerName"],
                orderItem: orderitem));
          }
        }
      }

      // ignore: prefer_is_empty
      if (viewdatalist.length == 0) {
        statusRequest = StatusRequest.failure;
      }
    } else {
      customAlertDialg();
      statusRequest = StatusRequest.serverfailure;
    }

    update();
  }

  @override
  void onInit() {
    getMyOrder(specialOrderDone);
    super.onInit();
  }

  @override
  recieveOrder(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.recieveOrder(id);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        getMyOrder(specialOrderDone);
        customSucsessDialog();
      } else {
        customAlertDialg();
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }
}
