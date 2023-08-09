import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/notificationController.dart';
import 'package:opticalproject/controller/warehouse/home/homeController.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/core/functions/alertexitapp.dart';
import 'package:opticalproject/view/warehouse/widget/homewidget.dart';
import 'package:badges/badges.dart' as badges;

class HomeWareHouse extends StatelessWidget {
  const HomeWareHouse({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeWareHouseControllerImp());
    HomeWareHouseControllerImp homeWareHouseControllerImp =
        HomeWareHouseControllerImp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("103".tr),
        actions: [
          GetBuilder<NotificationControllerIm>(
            builder: (controller) => InkWell(
              onTap: () => homeWareHouseControllerImp.gotonotification(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: badges.Badge(
                  position: badges.BadgePosition.topStart(),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.black,
                  ),
                  badgeContent: Text(controller.viewData.length.toString(),
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                  //! change notification here
                  child: const Icon(
                    size: 40,
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<HomeWareHouseControllerImp>(
        builder: (controller) {
          return WillPopScope(
            onWillPop: () => alertExitApp(),
            child: Column(children: [
              HomeWidgetWareHouse(
                title: "104".tr,
                function: () => controller.gotoOrder(),
                widget: Lottie.asset(
                  "assets/lottie/order.json",
                  height: 100,
                  width: 100,
                ),
              ),
              HomeWidgetWareHouse(
                title: "105".tr,
                function: () => controller.gotoProduct(),
                widget: Lottie.asset(
                  "assets/lottie/product.json",
                  height: 100,
                  width: 100,
                ),
              ),
              HomeWidgetWareHouse(
                title: "61".tr,
                function: () => controller.logout(),
                widget: Lottie.asset(
                  "assets/lottie/nologin.json",
                  height: 100,
                  width: 100,
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
