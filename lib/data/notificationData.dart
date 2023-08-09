import 'package:get/get.dart';
import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  MyServices myServices = Get.put(MyServices());

  genotification() async {
    if (myServices.sharedPreferences.getString("reole") != null) {
      var response = await crud.getDataTokenreturnList(
          AppLink.baseUrl + AppLink.getnotification,
          myServices.sharedPreferences.getString("token")!);
      return response.fold((l) => l, (r) => r);
    }
  }

  markAllRead() async {
    var response = await crud.getDataToken(
        AppLink.baseUrl + AppLink.markAllRead,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }

  markRead(String id) async {
    var response = await crud.getDataTokenreturnString(
        AppLink.baseUrl + AppLink.markread + id,
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }
}
