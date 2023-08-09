// ignore_for_file: prefer_const_constructors

import 'package:animation_list/animation_list.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:opticalproject/controller/user/home/menu&specialorder/menuController.dart';
import 'package:opticalproject/view/user/widget/menu/menuwidget.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MenuControllerImp());
    return Scaffold(
      body: GetBuilder<MenuControllerImp>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: AnimationList(
                duration: 1000,
                reBounceDepth: 30,
                children: controller.data.map((item) {
                  return buildTile(
                      item['title'], item['backgroundColor'], controller);
                }).toList()),
          ),
        ),
      ),
    );
  }
}
