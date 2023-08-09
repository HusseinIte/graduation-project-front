import 'dart:convert';

import 'package:get/get.dart';
import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/class/statusrequest.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class OrderData {
  Crud crud;
  MyServices myServices = Get.find();
  OrderData(this.crud);

  sendOrderData(int totalprice, List<Map> listitem) async {
    String items = "[";

    for (var i = 0; i < listitem.length; i++) {
      items =
          " $items{\"product_id\": ${listitem[i]['product_id']}, \"quantity\": ${listitem[i]['quantity']}} ";
      if (i < listitem.length - 1) {
        items = "$items,";
      }
    }

    items = "$items]";

    String data = "{\"totalPrice\" : $totalprice , \"items\" : $items}";

    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.sendorder,
        data,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  sendsendmaintenanceorderorder(String description, String image) async {
    // ignore: unnecessary_string_interpolations

 
 
 
        if (myServices.sharedPreferences.getString("token") != null) {
    Map<String, String> data = {"description": "$description"};

    var response = await crud.postDataFileWithTokenoneimage(
        AppLink.baseUrl + AppLink.sendsendmaintenanceorderorder,
        data,
        myServices.sharedPreferences.getString("token")!,
        image);

    return response.fold((l) => l, (r) => r);
    } else {
      return StatusRequest.serverfailure;
    }
 
  }

  getOrder(bool doneOrNot) async {

       if (myServices.sharedPreferences.getString("token") != null) {
    var response = await crud.getDataToken(AppLink.baseUrl + AppLink.getmyorder,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
    } else {
      return StatusRequest.serverfailure;
    }
  
  }

  lensOrder(
    String spherical,
    String cylinder,
    String lensesClass,
    String classType,
  ) async {
    String data =
        "{ \"spherical\": \"$spherical\",\"cylinder\": \"$cylinder\", \"lensesClass\": \"$lensesClass\", \"classType\": \"$classType\" }";

    var response = await crud.postDataWithToken(
        AppLink.baseUrl + AppLink.lensOrder,
        data,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  recieveOrder(int id) async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.recieveOrder + id.toString(),
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  getmainOrder() async {

 
 
     if (myServices.sharedPreferences.getString("token") != null) {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.getmymainOrder,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
    } else {
      return StatusRequest.serverfailure;
    }
 
  }

  readMessage(int id) async {
    if (myServices.sharedPreferences.getString("token") != null) {
      var response = await crud.getDataToken(
          AppLink.baseUrl + AppLink.mainmessage + id.toString(),
          myServices.sharedPreferences.getString("token")!);
      return response.fold((l) => l, (r) => r);
    } else {
      return StatusRequest.serverfailure;
    }
  }
}
