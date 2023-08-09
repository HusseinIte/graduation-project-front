
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/user/remote/auth/verifycode.dart';
import 'package:opticalproject/data/user/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class VervivationController extends GetxController {
  verfication(String email, String code);
}

class VervivationControllerImp extends VervivationController {
  MyServices myServices = Get.find();
  String? email;
  String? code;
  StatusRequest statusRequest = StatusRequest.none;
  late UserModel userModel;

  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());

  @override
  verfication(String email, String code) async {
    final prefs = await SharedPreferences.getInstance();

    if (email.isNotEmpty && code.isNotEmpty) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodeData.postdata(email, code);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("", "108".tr,
              backgroundColor: Color.fromARGB(255, 41, 159, 35));
          Get.offNamed(AppRoute.login);
        } else {
          Get.snackbar("", "99".tr);
        }
      }
    } else {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }
}
