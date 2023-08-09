import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/maintinance/newOrderMaintinanceController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/maintanace/mintinanceWidget.dart';

class NewMintinance extends StatelessWidget {
  const NewMintinance({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put((newOrderMaintinanceControllerImp()));

    return Scaffold(
      body: GetBuilder<newOrderMaintinanceControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.dataviewnew.length,
            itemBuilder: (context, index) => MaintinanceWidget(
                maintinanveOrderModel: controller.dataviewnew[index]),
          ),
        ),
      ),
    );
  }
}
