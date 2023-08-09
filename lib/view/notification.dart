import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/notificationController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/data/user/model/notificationModel.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put((NotificationControllerIm()));
    return GetBuilder<NotificationControllerIm>(
        builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Scaffold(
                body: GetBuilder<NotificationControllerIm>(
                  builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: controller.notificationCount.value == 0
                        ? Center(
                            child: Lottie.asset("assets/lottie/nodata.json",
                                height: 150, width: 150))
                        : ListView.builder(
                            itemCount: controller.viewData.length,
                            itemBuilder: (context, index) => NotificationWidget(
                                tonewOrder: () => controller.gotonewOrder(),
                                readnotification: () => controller
                                    .readAsMark(controller.viewData[index].id!),
                                notificationmodel: controller.viewData[index]),
                          ),
                  ),
                ),
              ),
            ));
  }
}

class NotificationWidget extends StatelessWidget {
  final notificationModel notificationmodel;
  final void Function()? readnotification;
  final void Function()? tonewOrder;
  const NotificationWidget({
    super.key,
    required this.notificationmodel,
    required this.readnotification,
    required this.tonewOrder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tonewOrder,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        height: Get.height / 2,
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1, color: AppColor.primaryColor)),
          color: const Color.fromARGB(255, 240, 240, 240),
          child:
              //? main colomun
              Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("159".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(
                    child: Text(
                      notificationmodel.id.toString(),
                    ),
                  )
                ],
              ),

              //!

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("160".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(notificationmodel.type!))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("161".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(
                      child: Text(notificationmodel.data!.orderId.toString()))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("162".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(
                      child: Text(notificationmodel.data!.title.toString()))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("163".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(notificationmodel.createdAt.toString()))
                ],
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              Container(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
                  onPressed: readnotification,
                  color: AppColor.primaryColor,
                  textColor: Colors.white,
                  child: Text("169".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10)),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
