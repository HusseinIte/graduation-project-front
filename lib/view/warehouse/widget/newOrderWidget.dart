// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';

class NewOrderWidget extends StatelessWidget {
  final orderModel ordermodel;
  final void Function()? excute;
  final void Function()? reject;

  const NewOrderWidget({
    super.key,
    required this.ordermodel,
    required this.excute,
    required this.reject,
  });

  @override
  Widget build(BuildContext context) {
    String order = "";
    if (ordermodel.orderItem != null) {
      for (var i = 0; i < ordermodel.orderItem!.length; i++) {
        order = "$order numberModel ${ordermodel.orderItem![i].numberModel}\n";
        order = "$order quantity ${ordermodel.orderItem![i].quantity}\n";
        order = "$order--------\n";
      }
    }

    return InkWell(
      onTap: () => Get.defaultDialog(
          title: "170".tr,
          titleStyle: const TextStyle(fontSize: 26),
          middleText: "",
          textCustom: "",
          confirm: SizedBox(
            width: Get.width,
            height: Get.height / 4,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, child: Text(order)),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        height: Get.height / 2.5,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("66".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(ordermodel.id.toString()))
                ],
              ),

              //!

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("146".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(ordermodel.orderType ?? ""))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("69".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(ordermodel.totalPrice.toString()))
                ],
              ),

              //! buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Color.fromARGB(255, 74, 153, 54)),
                      onPressed: excute,
                      child: Row(
                        children: [
                          Text("149".tr),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.done,
                            ),
                          ),
                        ],
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor:
                              const Color.fromARGB(255, 153, 61, 54)),
                      onPressed: reject,
                      child: Row(
                        children: [
                          Text("150".tr),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.delete,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
