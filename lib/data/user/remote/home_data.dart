import 'package:opticalproject/core/class/crud.dart';
import 'package:opticalproject/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getDataKids() async {
    var response = await crud.getData(AppLink.baseUrl + AppLink.getkidsproduct);
    return response.fold((l) => l, (r) => r);
  }

  getDataman() async {
    var response = await crud.getData(AppLink.baseUrl + AppLink.getmenproduct);
    return response.fold((l) => l, (r) => r);
  }

  getDatawomen() async {
    var response =
        await crud.getData(AppLink.baseUrl + AppLink.getwomenproduct);
    return response.fold((l) => l, (r) => r);
  }

  getDataallproduct() async {
    var response = await crud.getData(AppLink.baseUrl + AppLink.getallproduct);
    return response.fold((l) => l, (r) => r);
  }

  getDataframeproduct() async {
    var response =
        await crud.getData(AppLink.baseUrl + AppLink.getFrameProduvt);
    return response.fold((l) => l, (r) => r);
  }

  getDatalensesproduct() async {
    var response =
        await crud.getData(AppLink.baseUrl + AppLink.getLensesProduvt);
    return response.fold((l) => l, (r) => r);
  }

  getDatadeviceproduct() async {
    var response =
        await crud.getData(AppLink.baseUrl + AppLink.getDeviceProduvt);
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response =
        await crud.getData("${AppLink.baseUrl}${AppLink.search}/$search");
    return response.fold((l) => l, (r) => r);
  }
}
