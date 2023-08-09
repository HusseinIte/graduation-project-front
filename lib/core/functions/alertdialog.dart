// ignore_for_file: prefer_const_constructors

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

customAlertDialg() {
  Get.snackbar("83".tr, "84".tr,
      borderRadius: 10, backgroundColor: Color.fromARGB(255, 175, 79, 72));
}

customOfflineDialog() {
  Get.snackbar("83".tr, "85".tr,
      borderRadius: 10, backgroundColor: Color.fromARGB(255, 72, 86, 175));
}

customSucsessDialog() {
  Get.snackbar("", "32".tr,
      borderRadius: 10, backgroundColor: Color.fromARGB(255, 76, 182, 49));
}
