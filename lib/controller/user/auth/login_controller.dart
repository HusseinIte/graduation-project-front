import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/data/user/model/usermodel.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/user/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  loinasvistor();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //! save in shared

          myServices.sharedPreferences
              .setString("reole", response['user']['role']);
          myServices.sharedPreferences
              .setString("token", response['authorisation']['token']);
          myServices.sharedPreferences.setString("step", "2");

          if (response["user"]["role"] == "costumer") {
            UserModel user = UserModel(
              address: response["user"]["customer"]["address"],
              centerName: response["user"]["customer"]["centerName"],
              city: response["user"]["customer"]["city"],
              email: response["user"]["email"],
              firstName: response["user"]["customer"]["firstName"],
              id: response["user"]["customer"]["id"].toString(),
              user_id: response["user"]["customer"]["user_id"].toString(),
              lastName: response["user"]["customer"]["lastName"],
              phone: response["user"]["customer"]["phone"],
            );
            myServices.sharedPreferences.setString("step", "2");
            myServices.sharedPreferences.setString("user", json.encode(user));
            Get.offNamed(AppRoute.homescreen);
          } else if (response["user"]["role"] == "warehouse") {
            myServices.sharedPreferences.setString("step", "3");
            Get.offNamed(AppRoute.warehouse);
          } else if (response["user"]["role"] == "delivary") {
            myServices.sharedPreferences.setString("step", "4");
            Get.offNamed(AppRoute.homedelivery);
          } else if (response["user"]["role"] == "maintenance") {
            myServices.sharedPreferences.setString("step", "5");
            Get.offNamed(AppRoute.maintinanceHome);
          }
        } else if (response['status'] == "error") {
          Get.snackbar("", "86".tr,
              backgroundColor: const Color.fromARGB(255, 215, 210, 210));
        } else {
          customAlertDialg();
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
    // Get.offNamed(AppRoute.homescreen);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  loinasvistor() {
    Get.offNamed(AppRoute.homescreen);
  }
}
