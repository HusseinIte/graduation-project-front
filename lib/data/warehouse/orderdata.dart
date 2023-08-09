import 'package:get/get.dart';

import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class orderwarehouseData {
  Crud crud;
  orderwarehouseData(this.crud);
  MyServices myServices = Get.find();

  excuteorder(int orderid) async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.excuteorder + orderid.toString(),
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  rejectOrder(int orderid) async {
    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.rejectorder + orderid.toString(),
        "{\"message\": \"تم  رفض هذالطلب\"}",
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  getNewOrder() async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.getNewOrder,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  getAllOrder() async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.getAllOrder,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }
}
