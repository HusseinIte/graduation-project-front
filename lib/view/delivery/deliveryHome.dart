import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/delivery/deliveryHomeController.dart';
import 'package:opticalproject/controller/notificationController.dart';

import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/core/functions/alertexitapp.dart';
import 'package:opticalproject/view/warehouse/widget/homewidget.dart';
import 'package:badges/badges.dart' as badges;

class DeliveryHome extends StatelessWidget {
  const DeliveryHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DleiveryHOmeControllerIm());

    DleiveryHOmeControllerIm dleiveryHOmeControllerIm =
        DleiveryHOmeControllerIm();
    return GetBuilder<NotificationControllerIm>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.primaryColor,
                title: Text("156".tr),
                actions: [
               GetBuilder<NotificationControllerIm>(builder: (controller) => InkWell(onTap: () => dleiveryHOmeControllerIm.gotonotification(),child:    Padding(
                    padding: const EdgeInsets.all(10),
                    child: badges.Badge(
                      position: badges.BadgePosition.topStart(),
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: Colors.black,
                      ),
                      badgeContent: Text(controller.viewData.length.toString(),
                          style: const TextStyle(fontSize: 26, color: Colors.white)),
                      //! change notification here
                      child: const Icon(
                        size: 40,
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ))) ,
                ],
              ),
              body: GetBuilder<DleiveryHOmeControllerIm>(
                builder: (controller) {
                  return WillPopScope(
                    onWillPop: () => alertExitApp(),
                    child: ListView(children: [
                      Center(
                          child: LottieBuilder.asset(
                        "assets/lottie/delivery.json",
                        height: 200,
                        width: 200,
                      )),
                      HomeWidgetWareHouse(
                        title: "152".tr,
                        function: () => controller.gotoOrdernew(),
                        widget: Container(),
                      ),
                      HomeWidgetWareHouse(
                        title: "155".tr,
                        function: () => controller.gotoOrddone(),
                        widget: Container(),
                      ),
                      HomeWidgetWareHouse(
                        title: "61".tr,
                        function: () => controller.logout(),
                        widget: Container(),
                      )
                    ]),
                  );
                },
              ),
            ));
  }
}
