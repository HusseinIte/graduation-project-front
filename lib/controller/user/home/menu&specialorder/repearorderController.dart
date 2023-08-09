// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/user/remote/orderData.dart';


abstract class RepearOrderController extends GetxController {}

class RepearOrderControllerImp extends RepearOrderController {
  late TextEditingController description;
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  File? image;

  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
    
    }
    update();
  }

  sendRepearOrder() async {
    if (myServices.sharedPreferences.getString("token") == null ||
        myServices.sharedPreferences.getString("token") == "") {
      Get.snackbar("", "144".tr,
          backgroundColor: Color.fromARGB(255, 171, 85, 67));
    } else {
      if (image == null) {
        customAlertDialg();
      } else {
        statusRequest = StatusRequest.loading;
        update();
        var response = await orderData.sendsendmaintenanceorderorder(
            description.text, image!.path);
        statusRequest = handlingData(response);

        if (statusRequest == StatusRequest.success) {
          Get.snackbar("", "145".tr,
              backgroundColor: const Color.fromARGB(255, 91, 184, 94));
          Get.offAllNamed(AppRoute.homescreen);
        } else {
          customAlertDialg();
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }
}
