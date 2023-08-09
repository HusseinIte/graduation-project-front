import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/constant/color.dart';

class HomeWidgetWareHouse extends StatelessWidget {
  final String title;
  final void Function()? function;
  final Widget widget;
  const HomeWidgetWareHouse(
      {super.key,
      required this.title,
      required this.function,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: Get.height / 8,
        width: Get.width,
        child: InkWell(
          onTap: function,
          child: Card(
              elevation: 16,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side:
                      const BorderSide(width: 1, color: AppColor.primaryColor)),
              color: const Color.fromARGB(255, 240, 240, 240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, color: AppColor.primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  widget
                ],
              )),
        ));
  }
}
