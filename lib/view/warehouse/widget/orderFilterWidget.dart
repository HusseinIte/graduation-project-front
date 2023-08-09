import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/data/user/model/orderModel.dart';

class OrderFilterWidget extends StatelessWidget {
  final orderModel ordermodel;

  const OrderFilterWidget({
    super.key,
    required this.ordermodel,
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
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        height: Get.height / 2.8,
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
            ]),
          ),
        ),
      ),
    );
  }
}
