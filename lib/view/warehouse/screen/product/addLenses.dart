// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:opticalproject/controller/warehouse/home/product/lensesproductController.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/core/functions/validinput.dart';
import 'package:opticalproject/view/user/widget/auth/customtextformauth.dart';

class AddLenses extends StatelessWidget {
  const AddLenses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LensesroductControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("112".tr),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.warehouse,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GetBuilder<LensesroductControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  //!!!!!!!!!!!!!!!!!!!!!!!!

                  CustomTextFormAuth(
                    isNumber: true,

                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    mycontroller: controller.numberModel,
                    hinttext: "",
                    iconData: Icons.airplay_sharp,
                    labeltext: "115".tr,
                    // mycontroller: ,
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!
                  CustomTextFormAuth(
                    isNumber: false,

                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    mycontroller: controller.manufactureCompany,
                    hinttext: "",
                    iconData: Icons.email_outlined,
                    labeltext: "116".tr,
                    // mycontroller: ,
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!
                  CustomTextFormAuth(
                    isNumber: true,

                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    mycontroller: controller.amount,
                    hinttext: "",
                    iconData: Icons.email_outlined,
                    labeltext: "117".tr,
                    // mycontroller: ,
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!
                  CustomTextFormAuth(
                    isNumber: true,

                    valid: (val) {
                      return validInput(val!, 1, 10, "");
                    },
                    mycontroller: controller.price,
                    hinttext: "",
                    iconData: Icons.email_outlined,
                    labeltext: "135".tr,
                    // mycontroller: ,
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!

                  CustomTextFormAuth(
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    mycontroller: controller.alertAmount,
                    hinttext: "",
                    iconData: Icons.email_outlined,
                    labeltext: "118".tr,
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!

                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 1, 3, "");
                    },
                    mycontroller: controller.spherical,
                    hinttext: "78".tr,
                    iconData: Icons.email_outlined,
                    labeltext: "77".tr,
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!

                  CustomTextFormAuth(
                    isNumber: true,

                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    mycontroller: controller.cylinder,
                    hinttext: "",
                    iconData: Icons.email_outlined,
                    labeltext: "80".tr,
                    // mycontroller: ,
                  ),

                  //!!!!!!!!!!!!!!!!!!!!!!!!

                  //!!!!!!!!!!!!!!!!!!!!!!!!
                  Container(
                    decoration: BoxDecoration(
                        // border: BoxBorder(),
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text("175".tr),
                        items: controller.classtypelist
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: controller.selectedValueclass,
                        onChanged: (value) {
                          controller.selectedValueclass = value;
                          controller.update();
                        },
                        isExpanded: true,
                      ),
                    ),
                  ),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  Container(
                      decoration: BoxDecoration(
                          // border: BoxBorder(),
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        hint: Text("133".tr),
                        items: controller.genderItemstype
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: controller.selectedValuetype,
                        onChanged: (value) {
                          controller.selectedValuetype = value;
                          controller.update();
                        },
                        isExpanded: true,
                      ))),
                  //!!!!!!!!!!!!!!!!!!!!!!!!!!!

                  ElevatedButton(
                      onPressed: () => controller.getImage(ImageSource.gallery),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "119".tr,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const Icon(
                            Icons.image_search_rounded,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      )),

                  //!!!!!!!!!!!!!!!!!!
                  SizedBox(
                    height: 25,
                  ),

                  ElevatedButton(
                      onPressed: () => controller.stroeLenses(),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "75".tr,
                            style: TextStyle(color: Colors.black, fontSize: 26),
                          ),
                          const Icon(
                            Icons.send,
                            color: AppColor.black,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
