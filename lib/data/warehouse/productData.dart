import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/core/services/services.dart';
import 'package:opticalproject/linkapi.dart';

class ProductData {
  Crud crud;
  ProductData(this.crud);
  MyServices myServices = Get.find();

  deleteProduct(int id) async {
    var response = await crud.deletewithtoken(
        AppLink.baseUrl + AppLink.deleteProduct + id.toString(),
        myServices.sharedPreferences.getString("token")!);
    return response.fold((l) => l, (r) => r);
  }
}
