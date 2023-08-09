import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/maintinanceOrderController.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/specialOrderController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/user/widget/specialOrder/specialOrder.dart';

class MaintinanceOrder extends StatelessWidget {
  const MaintinanceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MaintinanceOrderControllerImp());
    return Scaffold(
      body: GetBuilder<MaintinanceOrderControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.viewdatalist.length,
              itemBuilder: (context, index) => SpecialOrderWidget(
                recieveFunction: () {},
                orederelement: controller.viewdatalist[index].orderItem,
                orderType: controller.viewdatalist[index].orderType ?? "",
                date: controller.viewdatalist[index].createdAt ?? "",
                number: controller.viewdatalist[index].id.toString(),
                status: controller.viewdatalist[index].orderStatus ?? "",
                totalprice:
                    controller.viewdatalist[index].totalPrice.toString(),
                    messageread: () => controller.readMessage(controller.viewdatalist[index].id!),
              ),
            )),
      ),
    );
  }
}
