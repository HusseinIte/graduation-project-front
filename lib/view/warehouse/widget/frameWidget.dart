// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';
import 'package:opticalproject/core/constant/color.dart';

import 'package:opticalproject/linkapi.dart';

class FrameWidget extends StatelessWidget {
  final CartControllerImp cartvontroller;
  final showbag;
  final Map element;
  const FrameWidget(
      {super.key,
      required this.element,
      required this.showbag,
      required this.cartvontroller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => Get.defaultDialog(
              title: "attribute",
              titleStyle: const TextStyle(fontSize: 26),
              middleText: "",
              textCustom: "",
              confirm: SizedBox(
                height: Get.height / 4,
                width: Get.width,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: element["attribute"] == null
                        ? const Text("No attribute")
                        : ListView(
                            children: [
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("frameType :"),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["frameType"]
                                            .toString(),
                                      ),
                                    ),
                                  ]),
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("size :"),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["size"].toString(),
                                      ),
                                    ),
                                  ]),
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("arm : "),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["arm"].toString(),
                                      ),
                                    ),
                                  ]),
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("bridge : "),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["bridge"]
                                            .toString(),
                                      ),
                                    ),
                                  ]),
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("frameShape : "),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["frameShape"]
                                            .toString(),
                                      ),
                                    ),
                                  ]),
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("frameClass : "),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["frameClass"]
                                            .toString(),
                                      ),
                                    ),
                                  ]),
                              //!
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("color : "),
                                    Expanded(
                                      child: Text(
                                        element["attribute"]["color"]
                                            .toString(),
                                      ),
                                    ),
                                  ]),
                            ],
                          )),
              )),
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            height: Get.height / 2.6,
            child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        width: 1, color: AppColor.primaryColor)),
                color: const Color.fromARGB(255, 240, 240, 240),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          Text("114".tr),
                          Text(element["productType"])
                        ],
                      ),
                      Row(
                        children: [
                          Text("115".tr),
                          Text(element["numberModel"])
                        ],
                      ),
                      Row(
                        children: [
                          Text("116".tr),
                          Text(element["manufactureCompany"])
                        ],
                      ),
                      Row(
                        children: [
                          Text("117".tr),
                          Text(element["amount"].toString())
                        ],
                      ),
                      Row(
                        children: [
                          Text("118".tr),
                          Text(element["price"].toString())
                        ],
                      ),
                      Text("119".tr),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, i) => FullScreenWidget(
                              disposeLevel: DisposeLevel.High,
                              child: CachedNetworkImage(
                                height: 50,
                                width: 50,
                                imageUrl: AppLink.baseUrl +
                                    AppLink.imagelink +
                                    element["images"][i],
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )),
                          itemCount: element["images"].length),
                    ],
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
                      onPressed: () =>
                          cartvontroller.deletePoduct(element["id"]),
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 238, 104, 95),
                        size: 40,
                      )),
                ),
              )
      ],
    );
  }
}
