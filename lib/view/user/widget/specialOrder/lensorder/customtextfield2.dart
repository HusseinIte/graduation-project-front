import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/lensOrderController.dart';
import 'package:opticalproject/core/functions/validinput.dart';
import 'package:opticalproject/view/user/widget/auth/customtextformauth.dart';

class CustomTextFieldKesar extends StatelessWidget {
  final LensOrderControllerImp controller;
  const CustomTextFieldKesar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormAuth(
        onTapIcon: () => controller.cyl.text = "",
        hinttext: "betwen 0 & -4 ",
        labeltext: "80".tr,
        iconData: Icons.input,
        mycontroller: controller.cyl,
        valid: (val) {
          return validInputNumber(val!, -4, 1);
        },
        isNumber: true);
  }
}
