// ignore_for_file: file_names

import 'package:get/get.dart';

import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class MaintinanceData {
  Crud crud;
  MaintinanceData(this.crud);
  MyServices myServices = Get.find();

  getNewMaintinance() async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.newmaintinanceOrder,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  mainByMessage(int id, String decs) async {
    String data = "{\"id\": \"$id\",\"desc\": \"$decs\"}";
    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.mainbymessage,
        data,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  mainByGroub(id) async {
    String data = "{\"id\": \"$id\"}";
    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.mainbysendgroub,
        data,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  mainByWareHouse(int id) async {
    String data = "{\"id\": \"$id\"}";
    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.mainbygotostore,
        data,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  mainend(int id, String price) async {
    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.mainexecute,
        "{ \"id\": \"$id\",\"price\": \"$price\"}",
        myServices.sharedPreferences.getString("token")!);

    return response.fold((l) => l, (r) => r);
  }
}
