import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/specialOrderController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/user/widget/specialOrder/specialOrder.dart';

class SpecialOrder extends StatelessWidget {
  final bool specialOrderDone;
  const SpecialOrder({super.key, required this.specialOrderDone});

  @override
  Widget build(BuildContext context) {
    Get.put(SpecialOrderControllerImp(specialOrderDone: specialOrderDone));
    return Scaffold(
      body: GetBuilder<SpecialOrderControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.viewdatalist.length,
              itemBuilder: (context, index) => SpecialOrderWidget(
                recieveFunction: () =>
                    controller.recieveOrder(controller.viewdatalist[index].id!),
                orederelement: controller.viewdatalist[index].orderItem,
                orderType: controller.viewdatalist[index].orderType ?? "",
                date: controller.viewdatalist[index].createdAt ?? "",
                number: controller.viewdatalist[index].id.toString(),
                status: controller.viewdatalist[index].orderStatus ?? "",
                totalprice:
                    controller.viewdatalist[index].totalPrice.toString(),
              ),
            )),
      ),
    );
  }
}
