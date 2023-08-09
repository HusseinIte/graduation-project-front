import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class GetDevicedata {
  Crud crud;
  GetDevicedata(this.crud);
  MyServices myServices = Get.find();

  getData() async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.getDeviceProduvt,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  storedata(Map<String, String> data, List<String> image) async {
    var response = await crud.postDataFileWithTokenlistimage(
        AppLink.baseUrl + AppLink.stroreDevice,
        data,
        myServices.sharedPreferences.getString("token")!,
        image);
    return response.fold((l) => l, (r) => r);
  }
}
