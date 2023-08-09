import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';

import 'package:opticalproject/data/user/remote/orderData.dart';

abstract class LensOrderController extends GetxController {
  sendLensOrder();
}

class LensOrderControllerImp extends LensOrderController {
  final CartControllerImp cartControllerImp = Get.find();
  late TextEditingController sph;
  late TextEditingController cyl;
  late TextEditingController amount;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formstateclass = GlobalKey<FormState>();
  GlobalKey<FormState> formstatetype = GlobalKey<FormState>();

  final List<String> genderItemsclass = [
    'Glass',
    'Palstic',
  ];

  final List<String> genderItemstype = ['com', 'anti', "bluecut", "normal"];

  String? selectedValueclass;

  String? selectedValuetype;

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());

  @override
  sendLensOrder() async {
    if (formKey.currentState!.validate() &&
        formstateclass.currentState!.validate() &&
        formstatetype.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await orderData.lensOrder(
          sph.text, cyl.text, selectedValueclass!, selectedValuetype!);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.snackbar("", "171".tr, backgroundColor: Colors.green);
          cartControllerImp.addtoCart({
            "productType": "lenses",
            "id": response["product"]["id"],
            "amount":response["product"]["amount"],
            "images": [],
            "manufactureCompany":response["product"]["manufactureCompany"],
            "numberModel": response["product"]["numberModel"],
            "price": response["product"]["price"],
          });
        
        } else {
          Get.snackbar("", "172".tr, backgroundColor: Colors.grey);
        }
        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.serverException;
      }
    }
    update();
  }

  @override
  void onInit() {

    sph = TextEditingController();
    cyl = TextEditingController();
    amount = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    sph.dispose();
    cyl.dispose();
    amount.dispose();
    super.dispose();
  }
}
