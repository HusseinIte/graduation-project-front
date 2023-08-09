import 'package:flutter/material.dart';

import 'package:get/get_utils/get_utils.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/lensOrderController.dart';
import 'package:opticalproject/core/functions/validinput.dart';
import 'package:opticalproject/view/user/widget/auth/customtextformauth.dart';

class CustomTextFieldMad extends StatelessWidget {
  final LensOrderControllerImp controller;
  const CustomTextFieldMad({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormAuth(
        onTapIcon: () => controller.sph.text = "",
        hinttext: "78".tr,
        labeltext: "77".tr,
        iconData: Icons.input,
        mycontroller: controller.sph,
        valid: (val) => validInput(val!, 1, 10, ""),
        isNumber: false);
  }
}
