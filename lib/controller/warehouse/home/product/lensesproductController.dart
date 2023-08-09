// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/constant/routes.dart';
import 'package:opticalproject/core/functions/alertdialog.dart';
import 'package:opticalproject/core/functions/handingdatacontroller.dart';
import 'package:opticalproject/data/warehouse/getLensesData.dart';

abstract class LensesroductController extends GetxController {
  getLenses();

  stroeLenses();
  gotoStroreLenses();
}

class LensesroductControllerImp extends LensesroductController {
  List<String> imageslist = [];

  File? image;

  final picker = ImagePicker();
  String? selectedValueclass;

  String? selectedValuetype;
  final List<String> classtypelist = [
    'Glass',
    'Palstic',
  ];
  final List<String> genderItemstype = ['com', 'anti', "bluecut", "normal"];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController numberModel;

  late TextEditingController manufactureCompany;

  late TextEditingController amount;
  late TextEditingController alertAmount;

  late TextEditingController price;

  late TextEditingController spherical;

  late TextEditingController cylinder;

  List<Map<dynamic, dynamic>> getlensList = [];
  StatusRequest statusRequest = StatusRequest.none;
  GetLensesData getlensesdata = GetLensesData(Get.find());
  @override
  @override
  getLenses() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getlensesdata.getData();


    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getlensList.clear();
      for (var i = 0; i < response["data"].length; i++) {
        getlensList.add(response["data"][i]);
      }
    } else {
      customAlertDialg();
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  stroeLenses() async {
    if (formstate.currentState!.validate()) {
      //if (true) {
      statusRequest = StatusRequest.loading;
      update();

      Map<String, String> data = {
        'data':
            '{\n  "numberModel": "${numberModel.text.toString()}", \n "manufactureCompany" : "${manufactureCompany.text.toString()}", \n        "amount" : ${amount.text}, \n        "price" : ${price.text}, \n        "alertAmount" : ${alertAmount.text}, \n        "spherical" : "${spherical.text.toString()}"  ,\n        "cylinder" : "${cylinder.text.toString()}",   \n        "lensesClass" : "${selectedValueclass.toString()}" , \n        "classType" : "${selectedValuetype.toString()}"  \n}',
      };
      var response = await getlensesdata.storedata(data, imageslist);


      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        Get.snackbar("", response["message"], backgroundColor: Colors.green);
        getLenses();
      } else {
        customAlertDialg();
        statusRequest = StatusRequest.failure;
      }

      update();
    }
  }

  @override
  void onInit() {
    getLenses();
    numberModel = TextEditingController();
    manufactureCompany = TextEditingController();
    amount = TextEditingController();
    price = TextEditingController();
    spherical = TextEditingController();
    cylinder = TextEditingController();

    alertAmount = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    numberModel.dispose();
    manufactureCompany.dispose();
    amount.dispose();
    price.dispose();
    spherical.dispose();
    cylinder.dispose();
    alertAmount.dispose();

    super.dispose();
  }

  @override
  gotoStroreLenses() {
    Get.toNamed(AppRoute.addlensess);
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
