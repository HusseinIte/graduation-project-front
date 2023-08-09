import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/warehouse/home/order/neworderController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/warehouse/widget/newOrderWidget.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewOrderControllerImp());
    return Scaffold(
      body: GetBuilder<NewOrderControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
        
            itemCount: controller.dataviewnew.length,
            itemBuilder: (context, index) => NewOrderWidget(
              excute: () =>
                  controller.excute(controller.dataviewnew[index].id!),
              reject: () =>
                  controller.reject(controller.dataviewnew[index].id!),
              ordermodel: controller.dataviewnew[index],
            ),
          ),
        ),
      ),
    );
  }
}
