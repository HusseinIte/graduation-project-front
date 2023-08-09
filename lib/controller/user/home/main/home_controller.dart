// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:opticalproject/data/user/model/productmoder.dart';
import 'package:opticalproject/view/notification.dart';

import 'package:opticalproject/view/user/screen/home/cart.dart';
import 'package:opticalproject/view/user/screen/home/main/home.dart';
import 'package:opticalproject/view/user/screen/home/specialorder&menu/menu.dart';
import 'package:opticalproject/view/user/screen/home/userprofile.dart';

import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/functions/handingdatacontroller.dart';
import '../../../../core/services/services.dart';
import '../../../../data/user/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
  gotoViewItem(int index, String search);
  gotoViewItemforcategory(int index);
}

class HomeControllerImp extends HomeController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  var viewdatalist = [];
  List<ProductModel> datalistforcart = [];

  HomeData homedata = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController searchnew;
  bool viewitemOrHome = true;
////navigation bar
  final pageControllerNavigation = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final controllerNavigationBar = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    pageController.dispose();
    searchnew.dispose();
    _timer?.cancel();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomePage(),
    const Menu(),
    const UserProfile(),
    const NotificationScreen(),
    const Cart(),
  ];

  //////slider
  int _currentPage = 0;

  Timer? _timer;

  PageController pageController = PageController(
    initialPage: 0,
  );

  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  // List data = [];
  List categories = [];
  List items = [];
  // List items = [];

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    searchnew = TextEditingController();
    //  getdata();
    //   initialData();
    super.onInit();

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (pageController.hasClients) {
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  getdata() async {
    /*
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    */
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  gotoViewItem(int index, String search) async {
    statusRequest = StatusRequest.loading;
    update();
    var response;

    if (index == 0) {
      response = await homedata.getDataallproduct();
    }
    if (index == 1) {
      response = await homedata.getDataman();
    }
    if (index == 2) {
      response = await homedata.getDatawomen();
    }
    if (index == 3) {
      response = await homedata.getDataKids();
    }

    if (index == 4) {
      response = await homedata.searchData(search);
    }


    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        viewdatalist = response["products"];
      }

      if (index == 0 || index == 4) {
        viewdatalist = response["data"];
      }
    }

    for (var element in viewdatalist) {
      List<String> listimage = [];
      for (var i = 0; i < element["images"].length; i++) {
        listimage.add(element["images"][i]);
      }
      datalistforcart.add(ProductModel(
          id: element["id"],
          images: listimage,
          manufactureCompany: element["manufactureCompany"],
          numberModel: element["numberModel"],
          price: element["price"],
          productType: element["productType"]));
    }

    viewitemOrHome = false;
    update();
  }

  @override
  gotoViewItemforcategory(int index) async {
    statusRequest = StatusRequest.loading;
    update();
    var response;

    if (index == 0) {
      response = await homedata.getDataframeproduct();
    }
    if (index == 1) {
      response = await homedata.getDatalensesproduct();
    }
    if (index == 2) {
      response = await homedata.getDatadeviceproduct();
    }


    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      viewdatalist = response["data"];
    }

    for (var element in viewdatalist) {
      List<String> listimage = [];
      for (var i = 0; i < element["images"].length; i++) {
        listimage.add(element["images"][i]);
      }
      datalistforcart.add(ProductModel(
          id: element["id"],
          images: listimage,
          manufactureCompany: element["manufactureCompany"],
          numberModel: element["numberModel"],
          price: element["price"],
          productType: element["productType"]));
    }

    viewitemOrHome = false;
    update();
  }
}
