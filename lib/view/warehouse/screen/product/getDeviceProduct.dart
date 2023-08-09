// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:opticalproject/controller/warehouse/home/product/deviceproductController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';

import 'package:opticalproject/view/warehouse/widget/deviceWidget.dart';

class GetDeviceProduct extends StatelessWidget {
  const GetDeviceProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeviceProductControllerImp());

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            DeviceProductControllerImp().gotostoreDevice();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text("113".tr),
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
        body: GetBuilder<DeviceProductControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
               
                    itemCount: controller.getdeviceList.length,
                    itemBuilder: (context, index) => DeviceWidget(
                          showbag: false,
                          cartvontroller: Get.find(),
                          element: controller.getdeviceList[index],
                        )),
              )),
        ));
  }
}
