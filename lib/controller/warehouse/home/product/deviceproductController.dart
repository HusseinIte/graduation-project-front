import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/data/warehouse/getdaevicedata.dart';


abstract class DeviceProductController extends GetxController {
  getDevice();
  gotostoreDevice();
  stroreDevice();
}

class DeviceProductControllerImp extends DeviceProductController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<String> imageslist = [];

  File? image;

  final picker = ImagePicker();

  late TextEditingController numberModel;

  late TextEditingController manufactureCompany;

  late TextEditingController amount;
  late TextEditingController alertAmount;

  late TextEditingController price;

  late TextEditingController frameType;

  late TextEditingController details;
  List<Map<dynamic, dynamic>> getdeviceList = [];
  StatusRequest statusRequest = StatusRequest.none;
  GetDevicedata getdevicedata = GetDevicedata(Get.find());
  @override
  getDevice() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getdevicedata.getData();
   

    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getdeviceList.clear();
      for (var i = 0; i < response["data"].length; i++) {
        getdeviceList.add(response["data"][i]);
      }
    } else {
      customAlertDialg();
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  void onInit() {
    getDevice();

    numberModel = TextEditingController();
    manufactureCompany = TextEditingController();
    amount = TextEditingController();
    price = TextEditingController();
    details = TextEditingController();

    alertAmount = TextEditingController();

    super.onInit();
  }

  @override
  stroreDevice() async {
    if (formstate.currentState!.validate()) {
      //if (true) {
      statusRequest = StatusRequest.loading;
      update();

      Map<String, String> data = {
        'data':
            '{ "numberModel" : "${numberModel.text.toString()}" , \n      "manufactureCompany" : "${manufactureCompany.text.toString()}", \n        "amount" : ${amount.text} , \n      "price" : ${price.text}   ,   \n        "alertAmount" : ${alertAmount.text} , \n     "details" : "${details.text.toString()}" \n}'
      };
      var response = await getdevicedata.storedata(data, imageslist);


      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Get.snackbar("", response["message"], backgroundColor: Colors.green);

        getDevice();
      } else {
        customAlertDialg();
        statusRequest = StatusRequest.failure;
      }

      update();
    }
  }

  @override
  gotostoreDevice() {
    Get.toNamed(AppRoute.adddevice);
  }

  @override
  void dispose() {
    numberModel.dispose();
    manufactureCompany.dispose();
    amount.dispose();
    price.dispose();
    details.dispose();

    alertAmount.dispose();

    super.dispose();
  }

  Future getImage(ImageSource source) async {
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
