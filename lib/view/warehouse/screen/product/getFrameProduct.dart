
// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:opticalproject/controller/warehouse/home/product/frameProductController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';

import 'package:opticalproject/view/warehouse/widget/frameWidget.dart';

class GetFrameProduct extends StatelessWidget {
  const GetFrameProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FrameProductControllerImp());

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            FrameProductControllerImp().gotostroreFrame();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text("111".tr),
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
        body: GetBuilder<FrameProductControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
        
                    itemCount: controller.getFrameList.length,
                    itemBuilder: (context, index) => FrameWidget(
                          element: controller.getFrameList[index],
                          showbag: false,
                          cartvontroller: Get.find(),
                        )),
              )),
        ));
  }
}
