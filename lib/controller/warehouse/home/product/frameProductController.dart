import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/data/warehouse/getFrameData.dart';

abstract class FrameProductController extends GetxController {
  getFrame();

  stroreFrame();
  gotostroreFrame();
}

class FrameProductControllerImp extends FrameProductController {
  List<String> imageslist = [];

  File? image;

  final picker = ImagePicker();

  String? selectedValue;
  final List<String> frameClasslist = [
    'أطفال',
    'رجالي',
    'نسائي',
  ];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController numberModel;

  late TextEditingController manufactureCompany;

  late TextEditingController amount;
  late TextEditingController alertAmount;

  late TextEditingController price;

  late TextEditingController frameType;

  late TextEditingController size;

  late TextEditingController arm;

  late TextEditingController bridge;

  late TextEditingController frameShape;

  late TextEditingController frameClass;

  late TextEditingController color;

  List<Map<dynamic, dynamic>> getFrameList = [];
  StatusRequest statusRequest = StatusRequest.none;
  GetFrameData getFrameData = GetFrameData(Get.find());

  @override
  getFrame() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getFrameData.getData();


    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getFrameList.clear();
      for (var i = 0; i < response["data"].length; i++) {
        getFrameList.add(response["data"][i]);
      }
    } else {
      customAlertDialg();
      statusRequest = StatusRequest.failure;
    }
  
    update();
  }

  @override
  stroreFrame() async {
    if (formstate.currentState!.validate()) {
      //if (true) {
      statusRequest = StatusRequest.loading;
      update();

      Map<String, String> data = {
        'data':
            '{\n        "numberModel":"${numberModel.text.toString()}",\n        "manufactureCompany":"${manufactureCompany.text.toString()}",\n        "amount":${amount.text},\n      "price":${price.text},\n        "alertAmount":${alertAmount.text},\n        "frameType":"${frameType.text.toString()}",\n        "size":"${size.text.toString()}",\n        "arm":"${arm.text.toString()}",\n        "bridge":"${bridge.text.toString()}",\n        "frameShape":"${frameShape.text.toString()}",\n        "frameClass":"${selectedValue.toString()}",\n        "color":"${color.text.toString()}"\n}'
      };
      var response = await getFrameData.storedata(data, imageslist);


      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["message"] == "تم حفظ الإطار بنجاح ") {
          Get.snackbar("", "تم حفظ الإطار بنجاح ",
              backgroundColor: Colors.green);
          getFrame();
        } else {
          Get.snackbar("", "136".tr, backgroundColor: Colors.green);
        }
      } else {
        customAlertDialg();
        statusRequest = StatusRequest.failure;
      }

      update();
    }
  }

  @override
  void onInit() {
    getFrame();
    numberModel = TextEditingController();
    manufactureCompany = TextEditingController();
    amount = TextEditingController();
    price = TextEditingController();
    size = TextEditingController();
    frameShape = TextEditingController();
    frameType = TextEditingController();
    arm = TextEditingController();
    bridge = TextEditingController();
    frameClass = TextEditingController();
    color = TextEditingController();
    alertAmount = TextEditingController();

    super.onInit();
  }

  @override
  gotostroreFrame() {
    Get.toNamed(AppRoute.addframe);
  }

  @override
  void dispose() {
    numberModel.dispose();
    manufactureCompany.dispose();
    amount.dispose();
    price.dispose();
    size.dispose();
    frameShape.dispose();
    frameType.dispose();
    arm.dispose();
    bridge.dispose();
    frameClass.dispose();
    color.dispose();
    alertAmount.dispose();

    super.dispose();
  }

  Future getImage(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      imageslist.add(pickedFile.path);
      Get.snackbar("", "123".tr,
          backgroundColor: const Color.fromARGB(255, 91, 197, 94));
    } else {
    
    }
    update();
  }
}
