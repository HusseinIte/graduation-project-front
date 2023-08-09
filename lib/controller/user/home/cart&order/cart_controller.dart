// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/warehouse/home/product/deviceproductController.dart';
import 'package:opticalproject/controller/warehouse/home/product/frameProductController.dart';
import 'package:opticalproject/controller/warehouse/home/product/lensesproductController.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';

import 'package:opticalproject/data/user/model/productmoder.dart';
import 'package:opticalproject/data/user/remote/orderData.dart';
import 'package:opticalproject/data/warehouse/productData.dart';

abstract class CartController extends GetxController {
  sendOrder();
  addtoCart(Map element);
  deletePoduct(int id);
}

class CartControllerImp extends CartController {
  ProductData productData = ProductData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  bool threIsData = true;
  List<ProductModel> cartitemlest = [];
  List<int> cartcountlist = [];

  RxInt totalprice = 0.obs;


  @override
  sendOrder() async {
    if (myServices.sharedPreferences.getString("token") == null ||
        myServices.sharedPreferences.getString("token") == "") {
      Get.snackbar("", "144".tr,
          backgroundColor: Color.fromARGB(255, 171, 85, 67));
      Get.offAllNamed(AppRoute.login);
    } else {
      if (cartcountlist.length > 0) {
        statusRequest = StatusRequest.loading;
        update();
        List<Map<String, dynamic>> listforsend = [];

        for (var i = 0; i < cartitemlest.length; i++) {
          listforsend.add({
            "product_id": cartitemlest[i].id.toString(),
            "quantity": cartcountlist[i]
          });
        }

        var response =
            await orderData.sendOrderData(totalprice.value, listforsend);

        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          Get.snackbar("", "145".tr,
              backgroundColor: const Color.fromARGB(255, 91, 184, 94));
          cartcountlist.clear();
          cartitemlest.clear();
          totalprice.value = 0;
        } else {
          customAlertDialg();
          statusRequest = StatusRequest.failure;
        }
      } else {
        Get.snackbar("", "السلة فارغة");
      }
      update();
    }
  }

  @override
  addtoCart(Map element) {
    List<String> listimage = [];
    for (var i = 0; i < element["images"].length; i++) {
      listimage.add(element["images"][i]);
    }
    cartitemlest.add(ProductModel(
      productType: element["productType"],
      id: element["id"],
      amount: element["amount"],
      images: listimage,
      manufactureCompany: element["manufactureCompany"],
      numberModel: element["numberModel"],
      price: element["price"],
    ));
    cartcountlist.add(1);
    totalprice.value =
        totalprice.value + int.parse(element["price"].toString());
    update();
  }

  @override
  deletePoduct(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productData.deleteProduct(id);
    

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        customSucsessDialog();

        FrameProductControllerImp frame = Get.put(FrameProductControllerImp());
        LensesroductControllerImp lens = Get.put(LensesroductControllerImp());
        DeviceProductControllerImp device =
            Get.put(DeviceProductControllerImp());
        frame.getFrame();
        lens.getLenses();
        device.getDevice();
      } else {
        customAlertDialg();
        statusRequest = StatusRequest.serverfailure;
      }
    } else {
      customAlertDialg();
      statusRequest = StatusRequest.serverfailure;
    }

    update();
  }
}
