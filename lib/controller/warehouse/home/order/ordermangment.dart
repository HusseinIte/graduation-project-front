import 'package:get/get.dart';
import 'package:opticalproject/core/constant/routes.dart';

abstract class OrderMangmentController extends GetxController {
  gotoNewOrder();
}

class OrderMangmentControllerImp extends OrderMangmentController {


  @override
  gotoNewOrder() {
    Get.toNamed(AppRoute.newOrders);
  }

  gotoorderfilterdeleverycustomer() {
    Get.toNamed(AppRoute.orderfilterdeleverycustomer);
  }

  gotoorderfilterreadyinwarehouse() {
    Get.toNamed(AppRoute.orderfilterreadyinwarehouse);
  }

  gotoorderfilterreject() {
    Get.toNamed(AppRoute.orderfilterreject);
  }
}
