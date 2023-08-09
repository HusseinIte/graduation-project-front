// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';

// ignore: camel_case_types
class newOrderDeliveryWidget extends StatelessWidget {
  final bool buttonshow;
  final bool statusControl;
  final orderModel ordermodel;
  final void Function()? deliveryOrder;
  final void Function()? deliveryOrderDone;

  const newOrderDeliveryWidget({
    super.key,
    required this.ordermodel,
    required this.deliveryOrder,
    required this.deliveryOrderDone,
    required this.statusControl,
    required this.buttonshow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                Text("66".tr,
                    style: const TextStyle(
                        color: AppColor.card6,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Text(ordermodel.id.toString())
              ],
            ),

//!

            Row(
              children: [
                Text("146".tr,
                    style: const TextStyle(
                        color: AppColor.card6,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Text(ordermodel.orderType ?? "")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("67".tr,
                    style: const TextStyle(
                        color: AppColor.card6,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Expanded(child: Text(ordermodel.orderStatus ?? ""))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("68".tr,
                    style: const TextStyle(
                        color: AppColor.card6,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Expanded(child: Text(ordermodel.createdAt ?? ""))
              ],
            ),
            Row(
              children: [
                Text("69".tr,
                    style: const TextStyle(
                        color: AppColor.card6,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                Text(ordermodel.totalPrice.toString())
              ],
            ),

//! buttons
            buttonshow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10, backgroundColor: AppColor.card6),
                          onPressed: statusControl ? deliveryOrder : null,
                          child: Row(
                            children: [
                              Text("157".tr),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.done,
                                ),
                              ),
                            ],
                          )),
                      OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor:
                                  Color.fromARGB(192, 255, 235, 59)),
                          onPressed: !statusControl ? deliveryOrderDone : null,
                          child: Row(
                            children: [
                              Text("158".tr),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                : Container()
          ]),
        ),
      ),
    );
  }
}
