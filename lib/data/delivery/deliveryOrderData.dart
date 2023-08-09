// ignore_for_file: file_names

import 'package:get/get.dart';

import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class DeliveryData {
  Crud crud;
  DeliveryData(this.crud);
  MyServices myServices = Get.find();

  getnewOrderDelivery() async {
    var response = await crud.getDataTokenreturnList(
        AppLink.baseUrl + AppLink.getneworderdelivery,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  receiveOrderFromWareHouse(int id) async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.receiveOrderFromWarehouse + id.toString(),
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  deliverdOrder(int id) async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.deliveryorder + id.toString(),
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  getmyOrderDeliveryed() async {
    var response = await crud.getDataTokenreturnList(
        AppLink.baseUrl + AppLink.getexcutedorderdelivery,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }
}
