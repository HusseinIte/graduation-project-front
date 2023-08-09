import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/maintinance/newOrderMaintinanceController.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/data/user/model/maintinanceOrderModel.dart';

import 'package:opticalproject/linkapi.dart';

class MaintinanceWidget extends StatelessWidget {
  final MaintinanveOrderModel maintinanveOrderModel;
  const MaintinanceWidget({
    super.key,
    required this.maintinanveOrderModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(newOrderMaintinanceControllerImp());
    return InkWell(
      onTap: () => newOrderMaintinanceControllerImp()
          .gotoOrderDetails(maintinanveOrderModel),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: Get.height / 2,
        child: SingleChildScrollView(
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
              child: Column(children: [
                Row(
                  children: [
                    Text("66".tr,
                        style: const TextStyle(
                            color: AppColor.card6,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    Text(maintinanveOrderModel.id.toString())
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
                    Text(maintinanveOrderModel.orderType!)
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
                            style: const TextStyle(fontSize: 10)))
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
                            style: const TextStyle(fontSize: 10)))
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
                        child:
                            Text(maintinanveOrderModel.totalPrice!.toString()))
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
                    Expanded(
                        child: Text(maintinanveOrderModel.createdAt!,
                            style: const TextStyle(fontSize: 10)))
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
