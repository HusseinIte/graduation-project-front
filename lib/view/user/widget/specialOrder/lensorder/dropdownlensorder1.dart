// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:opticalproject/controller/user/home/menu&specialorder/lensOrderController.dart';
import 'package:opticalproject/core/constant/color.dart';

class CustomDropDownLensKindt extends StatelessWidget {
  final LensOrderControllerImp controller;
  const CustomDropDownLensKindt({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formstateclass,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          // Add more decoration..
        ),
        hint: Text(
          "100".tr,
          style: TextStyle(fontSize: 14),
        ),
        items: controller.genderItemsclass
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "102".tr;
          }
          return null;
        },
        onChanged: (value) {
          controller.selectedValueclass = value.toString();
          //Do something when selected item is changed.
        },
        onSaved: (value) {
          controller.selectedValueclass = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColor.primaryColor,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
