import 'package:get/get.dart';

import 'package:opticalproject/core/constant/routes.dart';

abstract class ProductMangmentController extends GetxController {
  gotoDevice();
  gotoFrame();
  gotoLenses();
}

class ProductMangmentControllerImp extends ProductMangmentController {


  @override
  gotoDevice() {
    Get.toNamed(AppRoute.getDevice);
  }

  @override
  gotoFrame() {
    Get.toNamed(AppRoute.getframe);
  }

  @override
  gotoLenses() {
    Get.toNamed(AppRoute.getlenses);
  }
}
