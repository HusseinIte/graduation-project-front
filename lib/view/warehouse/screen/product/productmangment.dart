import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/warehouse/home/product/productmangment.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/view/warehouse/widget/homewidget.dart';

class ProductMangment extends StatelessWidget {
  const ProductMangment({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductMangmentControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("103".tr),
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
      body: GetBuilder<ProductMangmentControllerImp>(
        builder: (controller) => Column(children: [
          HomeWidgetWareHouse(
            title: "113".tr,
            function: () {
              controller.gotoDevice();
            },
            widget: Container(),
          ),
          HomeWidgetWareHouse(
            title: "112".tr,
            function: () {
              controller.gotoLenses();
            },
            widget: Container(),
          ),
          HomeWidgetWareHouse(
            title: "111".tr,
            function: () {
              controller.gotoFrame();
            },
            widget: Container(),
          )
        ]),
      ),
    );
  }
}
