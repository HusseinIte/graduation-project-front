import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:opticalproject/core/class/handlingdataview.dart';
import 'package:opticalproject/view/user/screen/home/main/itemview.dart';
import 'package:opticalproject/view/user/widget/home/bacishomeWidget.dart';
import '../../../../../controller/user/home/main/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: controller.viewitemOrHome
                  ? const BasicHomeWidget()
                  : ItemView(controllerhome: controller),
            ));
  }
}
