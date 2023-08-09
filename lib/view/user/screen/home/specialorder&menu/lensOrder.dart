import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/lensOrderController.dart';
import 'package:opticalproject/core/constant/color.dart';

import 'package:opticalproject/view/user/widget/specialOrder/lensorder/customtextfield1.dart';
import 'package:opticalproject/view/user/widget/specialOrder/lensorder/customtextfield2.dart';
import 'package:opticalproject/view/user/widget/specialOrder/lensorder/customtextfield3.dart';
import 'package:opticalproject/view/user/widget/specialOrder/lensorder/dropdownlensorder1.dart';
import 'package:opticalproject/view/user/widget/specialOrder/lensorder/dropdownlensorder2.dart';

class LensOrder extends StatelessWidget {
  const LensOrder({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LensOrderControllerImp());

    return Scaffold(
      body: GetBuilder<LensOrderControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Text("76".tr,
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.lens_blur_outlined,
                            color: AppColor.primaryColor,
                            size: 40,
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //! textfeild 1
                      CustomTextFieldMad(
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //! textfeild 2
                      CustomTextFieldKesar(
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      //! textfeild 3
                      //  CustomTextFieldAmount(controller: controller),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              //! lens drop text
              CustomDropDownLensKindt(controller: controller),
              const SizedBox(
                height: 15,
              ),
              //! lens drop text
              CustomDropDownLensType(controller: controller),
              //! Button
              const SizedBox(
                height: 15,
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
                  onPressed: () {
                    controller.sendLensOrder();
                  },
                  child: Text("75".tr,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
