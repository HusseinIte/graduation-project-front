import 'package:get/get.dart';
import 'package:opticalproject/view/maintanace/maintinanceDeatils.dart';
import 'package:opticalproject/view/maintanace/maintinanceHome.dart';
import 'package:opticalproject/view/maintanace/newMaintinanve.dart';
import 'package:opticalproject/view/notification.dart';

import 'package:opticalproject/view/user/screen/auth/login.dart';
import 'package:opticalproject/view/user/screen/auth/signup.dart';
import 'package:opticalproject/view/user/screen/auth/success_signup.dart';
import 'package:opticalproject/view/user/screen/auth/verifycodesignup.dart';
import 'package:opticalproject/view/user/screen/home/main/home.dart';

import 'package:opticalproject/view/user/screen/home/main/homescreen.dart';
import 'package:opticalproject/view/user/screen/home/specialorder&menu/lensOrder.dart';
import 'package:opticalproject/view/user/screen/home/specialorder&menu/specialorder.dart';

import 'package:opticalproject/view/user/screen/language&onboarding/language.dart';

import 'package:opticalproject/view/user/screen/language&onboarding/onboarding.dart';
import 'package:opticalproject/view/user/screen/home/specialorder&menu/menu.dart';

import 'package:opticalproject/view/user/screen/home/specialorder&menu/repearOrder.dart';
import 'package:opticalproject/view/warehouse/screen/homewarehouse.dart';
import 'package:opticalproject/view/warehouse/screen/order/orderfilter.dart';
import 'package:opticalproject/view/warehouse/screen/order/ordermangment.dart';
import 'package:opticalproject/view/warehouse/screen/product/addDevice.dart';
import 'package:opticalproject/view/warehouse/screen/product/addFrame.dart';
import 'package:opticalproject/view/warehouse/screen/product/addLenses.dart';
import 'package:opticalproject/view/warehouse/screen/product/getDeviceProduct.dart';
import 'package:opticalproject/view/warehouse/screen/product/productmangment.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/delivery/deliveryHome.dart';
import 'view/delivery/deliveryOrderDone.dart';
import 'view/delivery/deliveryOrderNew.dart';
import 'view/user/screen/home/specialorder&menu/maintinanceOrder.dart';
import 'view/warehouse/screen/order/neworder.dart';
import 'view/warehouse/screen/product/getFrameProduct.dart';
import 'view/warehouse/screen/product/getLensesProduct.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  // GetPage(name: AppRoute.cart, page: () => const Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),

  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),

  GetPage(name: AppRoute.menu, page: () => const Menu()),
  GetPage(name: AppRoute.userprofile, page: () => const Menu()),

  GetPage(
      name: AppRoute.specialOrder,
      page: () => const SpecialOrder(specialOrderDone: false)),
  GetPage(
      name: AppRoute.specialOrderdone,
      page: () => const SpecialOrder(specialOrderDone: true)),

  GetPage(name: AppRoute.repearorder, page: () => const RepearOrder()),
  GetPage(name: AppRoute.lensOrder, page: () => const LensOrder()),
  GetPage(name: AppRoute.mainView, page: () => const MaintinanceOrder()),

  //! warehouse

  GetPage(name: AppRoute.orderMangment, page: () => const OrderMangment()),

  GetPage(name: AppRoute.ProductMangment, page: () => const ProductMangment()),
  GetPage(name: AppRoute.warehouse, page: () => const HomeWareHouse()),
  GetPage(name: AppRoute.getDevice, page: () => const GetDeviceProduct()),
  GetPage(name: AppRoute.getframe, page: () => const GetFrameProduct()),
  GetPage(name: AppRoute.getlenses, page: () => const GetLensesProduct()),

  GetPage(name: AppRoute.adddevice, page: () => const AddDevice()),
  GetPage(name: AppRoute.addframe, page: () => const AddFrame()),
  GetPage(name: AppRoute.addlensess, page: () => const AddLenses()),

  GetPage(name: AppRoute.newOrders, page: () => const NewOrder()),

  GetPage(
      name: AppRoute.orderfilterdeleverycustomer,
      page: () => const OrderFilter(
            index: 1,
          )),
  GetPage(
      name: AppRoute.orderfilterreadyinwarehouse,
      page: () => const OrderFilter(
            index: 2,
          )),
  GetPage(
      name: AppRoute.orderfilterreject,
      page: () => const OrderFilter(
            index: 3,
          )),
  //!delivery
  GetPage(name: AppRoute.homedelivery, page: () => const DeliveryHome()),

  GetPage(
      name: AppRoute.orderdonedelivery, page: () => const DeliveryOrderDone()),

  GetPage(
      name: AppRoute.neworderdelivery, page: () => const DeliveryOrderNew()),

  GetPage(
      name: AppRoute.notificationscreen,
      page: () => const NotificationScreen()),

  //! maintinance
  GetPage(name: AppRoute.maintinanceHome, page: () => const maintinanceHome()),
  GetPage(
      name: AppRoute.maintinanceNeworder, page: () => const NewMintinance()),

  GetPage(name: AppRoute.maintinanceDetails, page: () => MaintinanceDeatils()),
];
