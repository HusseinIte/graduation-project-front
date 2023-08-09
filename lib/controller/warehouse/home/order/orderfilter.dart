import 'package:get/get.dart';

import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/data/user/model/orderDetailsModel.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';
import 'package:opticalproject/data/warehouse/orderdata.dart';

abstract class OrderFilterController extends GetxController {}

class OrderFilterControllerImp extends OrderFilterController {
  final int index;
  int itemcount = 0;
  orderwarehouseData orderwarehousedata = orderwarehouseData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<orderModel> dataviewinwarehouse = [];
  List<orderModel> dataviewreject = [];
  List<orderModel> dataviewdelevery = [];

  OrderFilterControllerImp({required this.index});

  getAllOrderAndfilter(int index) async {
    //?   : مسملة 1 و 2 جاهز في المستودع و 3 مرفوض

    dataviewdelevery.clear();
    dataviewinwarehouse.clear();
    dataviewreject.clear();
    statusRequest = StatusRequest.loading;
    update();
    var responsebody = await orderwarehousedata.getAllOrder();
    statusRequest = handlingData(responsebody);


    if (StatusRequest.success == statusRequest) {
      List response = responsebody["data"];


      List<orderDetailsModel> detailslist = [];

      if (index == 1) {
        for (var i = 0; i < response.length; i++) {
          if (response[i]["orderStatus"] == "تم تسليم الطلب") {
            for (var j = 0; j < response[i]["orderItem"].length; j++) {
              detailslist.add(orderDetailsModel(
                  id: response[i]["orderItem"][j]["id"],
                  numberModel: response[i]["orderItem"][j]["numberModel"],
                  productType: response[i]["orderItem"][j]["product_type"],
                  quantity: response[i]["orderItem"][j]["quantity"]));
            }
            dataviewdelevery.add(orderModel(
                id: response[i]["id"],
                orderStatus: response[i]["orderStatus"],
                orderType: response[i]["orderType"],
                totalPrice: response[i]["totalPrice"],
                createdAt: response[i]["created_at"],
                centerName: response[i]["center_name"],
                orderItem: detailslist));
          }
        }
        if (dataviewdelevery.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
        itemcount = dataviewdelevery.length;

      }

      if (index == 2) {
        for (var i = 0; i < response.length; i++) {
          if (response[i]["orderStatus"] == "الطلب جاهز في المستودع") {
            for (var j = 0; j < response[i]["orderItem"].length; j++) {
              detailslist.add(orderDetailsModel(
                  id: response[i]["orderItem"][j]["id"],
                  numberModel: response[i]["orderItem"][j]["numberModel"],
                  productType: response[i]["orderItem"][j]["product_type"],
                  quantity: response[i]["orderItem"][j]["quantity"]));
            }
            dataviewinwarehouse.add(orderModel(
                id: response[i]["id"],
                orderStatus: response[i]["orderStatus"],
                orderType: response[i]["orderType"],
                totalPrice: response[i]["totalPrice"],
                createdAt: response[i]["created_at"],
                centerName: response[i]["center_name"],
                orderItem: detailslist));
          }
          itemcount = dataviewinwarehouse.length;
        }
        if (dataviewinwarehouse.isEmpty) {
          statusRequest = StatusRequest.failure;
        }

      }

      if (index == 3) {
        for (var i = 0; i < response.length; i++) {
          if (response[i]["orderStatus"] == "الطلب مرفوض") {
            for (var j = 0; j < response[i]["orderItem"].length; j++) {
              detailslist.add(orderDetailsModel(
                  id: response[i]["orderItem"][j]["id"],
                  numberModel: response[i]["orderItem"][j]["numberModel"],
                  productType: response[i]["orderItem"][j]["product_type"],
                  quantity: response[i]["orderItem"][j]["quantity"]));
            }
            dataviewreject.add(orderModel(
                id: response[i]["id"],
                orderStatus: response[i]["orderStatus"],
                orderType: response[i]["orderType"],
                totalPrice: response[i]["totalPrice"],
                createdAt: response[i]["created_at"],
                centerName: response[i]["center_name"],
                orderItem: detailslist));
          }
        }
        if (dataviewreject.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
        itemcount = dataviewreject.length;

      }
    } else {
      statusRequest = StatusRequest.serverfailure;
      customAlertDialg();
    }
    update();
  }

  @override
  void onInit() {
    getAllOrderAndfilter(index);
    super.onInit();
  }
}
