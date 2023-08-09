import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/maintinance/maintinanceHomeController.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/core/functions/alertexitapp.dart';
import 'package:opticalproject/view/warehouse/widget/homewidget.dart';

class maintinanceHome extends StatelessWidget {
  const maintinanceHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MaintinanceHomeControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("177".tr),
      ),
      body: GetBuilder<MaintinanceHomeControllerImp>(
        builder: (controller) {
          return WillPopScope(
            onWillPop: () => alertExitApp(),
            child: ListView(children: [
              Center(
                  child: LottieBuilder.asset(
                "assets/lottie/onboardin1.json",
                height: 200,
                width: 200,
              )),
              HomeWidgetWareHouse(
                title: "176".tr,
                function: () => controller.gotoNewOrder(),
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
    );
  }
}
