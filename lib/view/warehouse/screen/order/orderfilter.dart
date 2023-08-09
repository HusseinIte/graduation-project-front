import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/warehouse/home/order/orderfilter.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/warehouse/widget/orderFilterWidget.dart';

class OrderFilter extends StatelessWidget {
  final int index;
  const OrderFilter({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderFilterControllerImp(index: index));
    return Scaffold(
      body: GetBuilder<OrderFilterControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
        
            itemCount: controller.itemcount,
            itemBuilder: (context, counter) => OrderFilterWidget(
                ordermodel: index == 1
                    ? controller.dataviewdelevery[counter]
                    : index == 2
                        ? controller.dataviewinwarehouse[counter]
                        : index == 3
                            ? controller.dataviewreject[counter]
                            : controller.dataviewreject[counter]),
          ),
        ),
      ),
    );
  }
}
