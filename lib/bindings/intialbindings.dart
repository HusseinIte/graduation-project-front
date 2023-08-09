import 'package:get/get.dart';
import 'package:opticalproject/controller/notificationController.dart';
import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';
import 'package:opticalproject/controller/user/home/main/home_controller.dart';
import 'package:opticalproject/controller/user/home/main/homescreen_controller.dart';

import '../core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Crud());
    Get.put(NotificationControllerIm());
    Get.put(CartControllerImp());
    Get.put(HomeControllerImp());
    Get.put(HomeScreenControllerImp());
    Get.put(CartControllerImp());
  }
}
