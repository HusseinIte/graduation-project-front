import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';

import 'package:opticalproject/core/constant/color.dart';

import 'package:opticalproject/linkapi.dart';

class DeviceWidget extends StatelessWidget {
  final CartControllerImp cartvontroller;
  final Map element;
  final bool showbag;
  const DeviceWidget(
      {super.key,
      required this.element,
      required this.showbag,
      required this.cartvontroller});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () => Get.defaultDialog(
            title: "attribute",
            titleStyle: const TextStyle(fontSize: 26),
            middleText: "",
            textCustom: "",
            confirm: SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: element["attribute"] == null
                      ? const Text("No attribute")
                      : Text(
                          element["attribute"]["details"].toString(),
                        )),
            )),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          height: Get.height / 2,
          width: Get.width,
          child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side:
                      const BorderSide(width: 1, color: AppColor.primaryColor)),
              color: const Color.fromARGB(255, 240, 240, 240),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("114".tr),
                          Expanded(child: Text(element["productType"]))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("115".tr),
                          Expanded(child: Text(element["numberModel"]))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("116".tr),
                          Expanded(child: Text(element["manufactureCompany"]))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("117".tr),
                          Expanded(child: Text(element["amount"].toString()))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("118".tr),
                          Expanded(child: Text(element["price"].toString()))
                        ],
                      ),
                      Text("119".tr),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, i) => FullScreenWidget(
                                disposeLevel: DisposeLevel.High,
                                child: CachedNetworkImage(
                                  height: 75,
                                  width: 75,
                                  imageUrl: AppLink.baseUrl +
                                      AppLink.imagelink +
                                      element["images"][i],
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                          itemCount: element["images"].length),
                    ],
                  ),
                ),
              )),
        ),
      ),
      showbag
          ? Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: IconButton(
                    onPressed: () => cartvontroller.addtoCart(element),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Color.fromARGB(255, 238, 104, 95),
                      size: 60,
                    )),
              ),
            )
          : Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: IconButton(
                    onPressed: () => cartvontroller.deletePoduct(element["id"]),
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 238, 104, 95),
                      size: 40,
                    )),
              ),
            )
    ]);
  }
}
