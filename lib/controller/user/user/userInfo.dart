import 'dart:convert';

import 'package:get/get.dart';
import 'package:opticalproject/core/constant/routes.dart';

import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/data/user/model/usermodel.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserInfoController extends GetxController {
  logout();
}

class UserInfoControllerImp extends UserInfoController {
  MyServices myServices = Get.find();
  late SharedPreferences prefs;

  Rx<UserModel> user = UserModel(
          address: "",
          email: "",
          centerName: "",
          firstName: "غير",
          lastName: "مسجل",
          mobile: "",
          city: "")
      .obs;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    try {
      user.value = UserModel.fromJson(jsonDecode(prefs.getString("user")!));
    } catch (e) {}

    super.onInit();
  }

  @override
  logout() async {
    myServices.sharedPreferences.setString("user", "");
    myServices.sharedPreferences.setString("token", "");
    myServices.sharedPreferences.setString("reole", "");
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }
}
