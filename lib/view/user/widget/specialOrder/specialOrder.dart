// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/data/user/model/orderDetailsModel.dart';

class SpecialOrderWidget extends StatelessWidget {
  final String number;
  final String status;
  final String date;
  final String totalprice;
  final String orderType;
  final List<orderDetailsModel>? orederelement;
  final void Function()? recieveFunction;
  final void Function()? messageread;

  const SpecialOrderWidget(
      {super.key,
      required this.number,
      required this.status,
      required this.date,
      required this.totalprice,
      required this.orderType,
      required this.orederelement,
      this.recieveFunction,
      this.messageread});

  @override
  Widget build(BuildContext context) {
    String order = "";
    if (orederelement != null) {
      for (var i = 0; i < orederelement!.length; i++) {
        order = "$order numberModel ${orederelement![i].numberModel}\n";
        order =
            order + " quantity " + orederelement![i].quantity.toString() + "\n";
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
            height: Get.height / 3,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, child: Text(order)),
          )),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: Get.height / 2,
        child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1, color: AppColor.primaryColor)),
          color: Color.fromARGB(255, 240, 240, 240),
          child:
              //? main colomun
              Padding(
            padding: EdgeInsets.all(5),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("66".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(number))
                ],
              ),

              //!

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("146".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(orderType))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("67".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(status))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("68".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(date))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("69".tr,
                      style: const TextStyle(
                          color: AppColor.card6,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(child: Text(totalprice))
                ],

                //! button
              ),

              status == "جاري شحن الطلب"
                  ? Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 10),
                        onPressed: recieveFunction,
                        color: AppColor.primaryColor,
                        textColor: Colors.white,
                        child: Text("173".tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    )
                  : Container(),
              status == "تم تنفيذ الصيانة عن طريق إرسال رسالة"
                  ? Container(
                      color: AppColor.card6,
                      margin: const EdgeInsets.only(top: 5),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width / 10),
                        onPressed: messageread,
                        color: AppColor.card6,
                        textColor: Colors.black,
                        child: Text("187".tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    )
                  : Container()
            ]),
          ),
        ),
      ),
    );
  }
}
