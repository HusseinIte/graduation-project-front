import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/view/user/widget/cart/cartWidget.dart';

import 'package:opticalproject/view/user/widget/cart/noitemcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) {
        return controller.threIsData
            ? HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: SizedBox(
                  height: Get.height / 8,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => CartWidget(
                          cartController: controller,
                          index: index,
                        ),
                        itemCount: controller.cartcountlist.length,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "64".tr,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.totalprice.value.toString(),
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            margin: const EdgeInsets.only(bottom: 30, top: 30),
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColor.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 125, vertical: 15),
                                textColor: Colors.white,
                                onPressed: () => controller.sendOrder(),
                                child: Text("65".tr)),
                          )
                        ]),
                      ),
                    ],
                  ),
                ))
            : const NoItemCartidget();
      },
    );
  }
}
