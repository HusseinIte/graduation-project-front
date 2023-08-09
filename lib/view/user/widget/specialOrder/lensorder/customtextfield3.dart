import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/lensOrderController.dart';
import 'package:opticalproject/core/functions/validinput.dart';
import 'package:opticalproject/view/user/widget/auth/customtextformauth.dart';

class CustomTextFieldAmount extends StatelessWidget {
  final LensOrderControllerImp controller;
  const CustomTextFieldAmount({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormAuth(
        onTapIcon: () => controller.amount.text = "",
        hinttext: "betwen 1 - 10000 ",
        labeltext: "82".tr,
        iconData: Icons.input,
        mycontroller: controller.amount,
        valid: (val) {
          return validInputNumber(val!, 1, 10000);
        },
        isNumber: true);
  }
}
