import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/maintinance/mainDeatilsController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';

import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/core/functions/validinput.dart';
import 'package:opticalproject/data/user/model/maintinanceOrderModel.dart';
import 'package:opticalproject/linkapi.dart';

class MaintinanceDeatils extends StatelessWidget {
  final MaintinanveOrderModel maintinanveOrderModel = Get.arguments;

  MaintinanceDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MaintinanceDetailsControllerImp());
    return Scaffold(
      body: GetBuilder<MaintinanceDetailsControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(children: [
                Row(
                  children: [
                    Text("66".tr,
                        style: const TextStyle(
                            color: AppColor.card6,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Text(maintinanveOrderModel.id.toString(),
                        style: const TextStyle(fontSize: 12))
                  ],
                ),

                //!

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("146".tr,
                        style: const TextStyle(
                            color: AppColor.card6,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Expanded(
                      child: Text(maintinanveOrderModel.orderType!,
                          style: const TextStyle(fontSize: 12)),
                    )
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
                    Expanded(
                        child: Text(maintinanveOrderModel.orderStatus!,
                            style: const TextStyle(fontSize: 12)))
                  ],
                ),

                //!
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("186".tr,
                        style: const TextStyle(
                            color: AppColor.card6,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Expanded(
                        child: Text(maintinanveOrderModel.description!,
                            style: const TextStyle(fontSize: 12)))
                  ],
                ),

                //!
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("118".tr,
                        style: const TextStyle(
                            color: AppColor.card6,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Expanded(
                        child: Text(
                            maintinanveOrderModel.totalPrice!.toString(),
                            style: const TextStyle(fontSize: 12)))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("68".tr,
                        style: const TextStyle(
                            color: AppColor.card6,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Expanded(
                      child: Text(maintinanveOrderModel.createdAt!,
                          style: const TextStyle(fontSize: 12)),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(5),
                  child: FullScreenWidget(
                    disposeLevel: DisposeLevel.High,
                    child: CachedNetworkImage(
                      height: 75,
                      width: 75,
                      imageUrl: AppLink.baseUrl +
                          AppLink.imagelink +
                          maintinanveOrderModel.image.toString(),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
//! message
                Form(
                  key: controller.formstatedecr,
                  child: TextFormField(
                    maxLines: 3,
                    validator: (val) {
                      return validInput(val!, 1, 1000, "");
                    },
                    controller: controller.decr,
                    decoration: InputDecoration(
                        focusColor: AppColor.primaryColor,
                        hoverColor: AppColor.primaryColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 30),
                        label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text("183".tr)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
//! btn by message
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, backgroundColor: AppColor.card6),
                    onPressed:
                        controller.btnstatusMessage(maintinanveOrderModel)
                            ? () => controller.mainByMessage(
                                maintinanveOrderModel.id!, controller.decr.text)
                            : null,
                    child: Row(
                      children: [
                        Text("179".tr),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.done,
                          ),
                        ),
                      ],
                    )),
//! btn by send groub
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, backgroundColor: AppColor.card6),
                    onPressed: controller.btnstatusGroub(maintinanveOrderModel)
                        ? () => controller
                            .mainBySendGroub(maintinanveOrderModel.id!)
                        : null,
                    child: Row(
                      children: [
                        Text("180".tr),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.done,
                          ),
                        ),
                      ],
                    )),
                //! btn by send to ware house
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, backgroundColor: AppColor.card6),
                    onPressed:
                        controller.btnstatusWareHouse(maintinanveOrderModel)
                            ? () => controller
                                .mainBywarehouse(maintinanveOrderModel.id!)
                            : null,
                    child: Row(
                      children: [
                        Text("181".tr),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.done,
                          ),
                        ),
                      ],
                    )),

                SizedBox(
                  height: 20,
                ),

                Form(
                  key: controller.formstateprice,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      return validInput(val!, 1, 1000, "");
                    },
                    controller: controller.price,
                    decoration: InputDecoration(
                        focusColor: AppColor.primaryColor,
                        hoverColor: AppColor.primaryColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 30),
                        label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text("184".tr)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                //! btn by send to ware house
                OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, backgroundColor: AppColor.card6),
                    onPressed: controller.btnstatusend(maintinanveOrderModel)
                        ? () => controller.mainexcute(
                            maintinanveOrderModel.id!,
                            controller.price.text,
                            maintinanveOrderModel.orderStatus!)
                        : null,
                    child: Row(
                      children: [
                        Text("182".tr),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.done,
                          ),
                        ),
                      ],
                    )),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
