import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/menuController.dart';
import 'package:opticalproject/core/constant/color.dart';

Widget buildTile(
    String? title, Color? backgroundColor, MenuControllerImp controller) {
  return InkWell(
    onTap: () => controller.handlingMenuRoute(title),
    child: Container(
        height: Get.height / 12,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          color: backgroundColor,
        ),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(width: 1, color: AppColor.primaryColor)),
            child: Center(
                child: Text(title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black))))),
  );
}
