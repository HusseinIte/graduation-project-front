import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/warehouse/home/order/ordermangment.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/view/warehouse/widget/homewidget.dart';

class OrderMangment extends StatelessWidget {
  const OrderMangment({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderMangmentControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("104".tr),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.warehouse,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GetBuilder<OrderMangmentControllerImp>(
        builder: (controller) => ListView(children: [
          HomeWidgetWareHouse(
            title: "152".tr,
            function: () => controller.gotoNewOrder(),
            widget: Lottie.asset(
              "assets/lottie/order.json",
              height: 50,
              width: 50,
            ),
          ),
          HomeWidgetWareHouse(
            title: "155".tr,
            function: () => controller.gotoorderfilterdeleverycustomer(),
            widget: Lottie.asset(
              "assets/lottie/order.json",
              height: 50,
              width: 50,
            ),
          ),
          HomeWidgetWareHouse(
            title: "154".tr,
            function: () => controller.gotoorderfilterreadyinwarehouse(),
            widget: Lottie.asset(
              "assets/lottie/order.json",
              height: 50,
              width: 50,
            ),
          ),
          HomeWidgetWareHouse(
            title: "153".tr,
            function: () => controller.gotoorderfilterreject(),
            widget: Lottie.asset(
              "assets/lottie/order.json",
              height: 50,
              width: 50,
            ),
          )
        ]),
      ),
    );
  }
}












