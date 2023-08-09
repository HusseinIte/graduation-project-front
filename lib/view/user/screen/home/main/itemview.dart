// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/user/home/main/home_controller.dart';
import 'package:opticalproject/controller/user/home/main/homescreen_controller.dart';
import 'package:opticalproject/view/warehouse/widget/deviceWidget.dart';
import 'package:opticalproject/view/warehouse/widget/frameWidget.dart';
import 'package:opticalproject/view/warehouse/widget/lensWidget.dart';

class ItemView extends StatelessWidget {
  final HomeControllerImp controllerhome;
  const ItemView({super.key, required this.controllerhome});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    HomeControllerImp homecontroller = Get.find();
    HomeScreenControllerImp homescreencontroller = Get.find();

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          backgroundColor: Colors.black87,
          hoverColor: Colors.orange,
          onPressed: () {
            homecontroller.viewdatalist.clear();
            controllerhome.viewitemOrHome = true;
            controllerhome.update();
            homecontroller.update();
            homescreencontroller.update();
          },
          child: const Icon(Icons.arrow_back, color: Colors.lightBlueAccent),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: GetBuilder<HomeControllerImp>(
        // ignore: prefer_is_empty
        builder: (controller) => controller.viewdatalist.length == 0
            ? Lottie.asset("assets/lottie/nodata.json")
            : ListView.builder(
                itemCount: controllerhome.viewdatalist.length,
                itemBuilder: (context, index) => ChoisenWidget(
                    element: controller.viewdatalist[index],
                    kind: controller.viewdatalist[index]["productType"])),
      ),
    );
  }
}

class ChoisenWidget extends StatelessWidget {
  final Map element;
  final String kind;
  const ChoisenWidget({super.key, required this.element, required this.kind});

  @override
  Widget build(BuildContext context) {
    if (kind == "frame") {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: FrameWidget(
          cartvontroller: Get.find(),
          showbag: true,
          element: element,
        ),
      );
    }
    if (kind == "Device") {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: DeviceWidget(
            showbag: true, element: element, cartvontroller: Get.find()),
      );
    }
    if (kind == "Lenses") {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: LensWidget(showbag: true, element: element),
      );
    }
    return Container();
  }
}
