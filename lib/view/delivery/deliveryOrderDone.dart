import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/delivery/deliveryOrderDoneController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/delivery/widget/neworderdeliveryWidget.dart';

class DeliveryOrderDone extends StatelessWidget {
  const DeliveryOrderDone({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(deliveryOrderDoneControllerIm());
    return Scaffold(
        body: GetBuilder<deliveryOrderDoneControllerIm>(
      builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            reverse: true,
            itemCount: controller.viewData.length,
            itemBuilder: (context, index) => newOrderDeliveryWidget(
                buttonshow: false,
                statusControl: true,
                ordermodel: controller.viewData[index],
                deliveryOrder: () {},
                deliveryOrderDone: () {}),
          )),
    ));
  }
}
