// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/repearorderController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';

class RepearOrder extends StatelessWidget {
  const RepearOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RepearOrderControllerImp());
    return GetBuilder<RepearOrderControllerImp>(
      builder: (controller) => Scaffold(
          body: HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(children: [
                      Text("70".tr,
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28)),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.room_preferences_outlined,
                        color: AppColor.primaryColor,
                        size: 40,
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.image == null
                      ? Text("71".tr)
                      : Image.file(
                          controller.image!,
                          height: 200,
                          width: 200,
                          cacheHeight: 200,
                          cacheWidth: 200,
                        ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () =>
                            controller.getImage(ImageSource.camera),
                        child: Text("72".tr),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 40,
                      ),
                      MaterialButton(
                        onPressed: () =>
                            controller.getImage(ImageSource.gallery),
                        child: Text("73".tr),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                    width: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: controller.description,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: "",
                          hintStyle: const TextStyle(fontSize: 14),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: Text("74".tr)),
                          suffixIcon: const Icon(
                              Icons.report_gmailerrorred_sharp,
                              color: AppColor.primaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    height: Get.height / 14,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      minWidth: Get.width / 1.1,
                      color: AppColor.card2,
                      onPressed: () => controller.sendRepearOrder(),
                      child: Text("75".tr,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                    ),
                  )
                ],
              ))),
    );
  }
}
