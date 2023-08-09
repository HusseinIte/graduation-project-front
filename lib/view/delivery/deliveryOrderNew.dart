import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/delivery/deliverOrderNewController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/delivery/widget/neworderdeliveryWidget.dart';

class DeliveryOrderNew extends StatelessWidget {
  const DeliveryOrderNew({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(deliverOrderNewControllerIm());
    return Scaffold(
        body: GetBuilder<deliverOrderNewControllerIm>(
      builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.viewData.length,
            itemBuilder: (context, index) => newOrderDeliveryWidget(
                buttonshow: true,
                statusControl: controller.statusControl[index],
                ordermodel: controller.viewData[index],
                deliveryOrder: () => controller.startDelivery(index),
                deliveryOrderDone: () =>
                    controller.endDeliveryTocostumer(index)),
          )),
    ));
  }
}
