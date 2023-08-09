import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/user/home/main/home_controller.dart';
import 'package:opticalproject/view/user/widget/home/bottomNavigationBar.dart';

import '../../../../../controller/user/home/main/homescreen_controller.dart';

import '../../../../../core/functions/alertexitapp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    Get.put(HomeControllerImp());

    HomeControllerImp homeControllerImp = HomeControllerImp();
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: WillPopScope(
                onWillPop: alertExitApp,
                child: Container(),
              ),
              bottomNavigationBar:
                  CustomNavigationBar(controller: homeControllerImp),
            ));
  }
}
