// ignore: file_names

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/constant/color.dart';

import 'package:opticalproject/view/user/widget/home/animatedgridForCategory.dart';
import 'package:opticalproject/view/user/widget/home/animatedgridview.dart';
import 'package:opticalproject/view/user/widget/home/customcardhome.dart';

import '../../../../controller/user/home/main/home_controller.dart';

class BasicHomeWidget extends StatelessWidget {
  const BasicHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: controller.formstate,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height / 4,
                          width: Get.width,
                          child: PageView(
                            controller: controller.pageController,
                            children: [
                              CustomCardHome(
                                  color1: AppColor.card1,
                                  color2: AppColor.card2,
                                  title: "46".tr,
                                  body: "47".tr),
                              CustomCardHome(
                                  color1: AppColor.card3,
                                  color2: AppColor.card4,
                                  title: "48".tr,
                                  body: "49".tr),
                              CustomCardHome(
                                  color1: AppColor.card5,
                                  color2: AppColor.card6,
                                  title: "50".tr,
                                  body: "51".tr),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            showCursor: true,
                            readOnly: true,
                            onTap: () => Get.defaultDialog(
                                cancel: TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text("148".tr)),
                                confirm: TextButton(
                                    onPressed: () {
                                      Get.back();
                                      // ignore: void_checks
                                      return controller.gotoViewItem(
                                          4, controller.searchnew.text);
                                    },
                                    child: Text("147".tr)),
                                middleText: "",
                                content: TextFormField(
                                  controller: controller.searchnew,
                                ),
                                title: "140".tr,
                                titleStyle: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor)),
                            decoration: InputDecoration(
                                focusColor: AppColor.primaryColor,
                                hoverColor: AppColor.primaryColor,
                                hintText: "140".tr,
                                hintStyle: const TextStyle(fontSize: 12),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                label: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 9),
                                    child: Text("140".tr)),
                                suffixIcon: InkWell(
                                    onTap: () => controller.gotoViewItem(
                                        4, controller.searchnew.text),
                                    child: const Icon(Icons.search)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "141".tr,
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            height: Get.height / 6.5,
                            child: const AnimatedGridView()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "142".tr,
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            height: Get.height / 7.5,
                            child: const AnimatedGridViewForCategory()),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
