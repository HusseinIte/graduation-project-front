// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/warehouse/home/product/lensesproductController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/view/warehouse/widget/lensWidget.dart';

class GetLensesProduct extends StatelessWidget {
  const GetLensesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LensesroductControllerImp());

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            LensesroductControllerImp().gotoStroreLenses();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text("112".tr),
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
        body: GetBuilder<LensesroductControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: controller.getlensList.length,
                    itemBuilder: (context, index) => LensWidget(
                          showbag: false,
                          element: controller.getlensList[index],
                        )),
              )),
        ));
  }
}
