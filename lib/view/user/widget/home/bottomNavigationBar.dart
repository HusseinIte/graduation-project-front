// ignore: file_names
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opticalproject/controller/notificationController.dart';
import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';
import 'package:opticalproject/controller/user/home/main/home_controller.dart';
import 'package:badges/badges.dart' as badges;

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key, required this.controller});
  final HomeControllerImp controller;
  final NotificationControllerIm notificationControllerIm = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        builder: (cartController) => GetX<NotificationControllerIm>(
            builder: (noticontroller) => Scaffold(
                  body: PageView(
                    controller: controller.pageControllerNavigation,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(controller.bottomBarPages.length,
                        (index) => controller.bottomBarPages[index]),
                  ),
                  extendBody: true,
                  bottomNavigationBar: (controller.bottomBarPages.length <= 6)
                      ? AnimatedNotchBottomBar(
                          /// Provide NotchBottomBarController
                          notchBottomBarController:
                              controller.controllerNavigationBar,
                          color: Colors.white,
                          showLabel: false,
                          notchColor: Colors.black87,

                          /// restart app if you change removeMargins
                          removeMargins: false,
                          bottomBarWidth: Get.width,
                          durationInMilliSeconds: 200,
                          bottomBarItems: [
                            const BottomBarItem(
                              inActiveItem: Icon(
                                Icons.home_filled,
                                color: Colors.blueGrey,
                              ),
                              activeItem: Icon(
                                Icons.home_filled,
                                color: Colors.blueAccent,
                              ),
                              itemLabel: 'Page 1',
                            ),
                            const BottomBarItem(
                              inActiveItem: Icon(
                                Icons.menu_open_outlined,
                                color: Colors.blueGrey,
                              ),
                              activeItem: Icon(
                                Icons.menu_open_outlined,
                                color: Colors.blueAccent,
                              ),
                              itemLabel: 'Page 2',
                            ),
                            const BottomBarItem(
                              inActiveItem: Icon(
                                Icons.person_4_outlined,
                                color: Colors.blueGrey,
                              ),
                              activeItem: Icon(
                                Icons.person_4_outlined,
                                color: Colors.blueAccent,
                              ),
                              itemLabel: 'Page 3',
                            ),
                            BottomBarItem(
                              inActiveItem: badges.Badge(
                                position: badges.BadgePosition.topStart(),
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: Colors.black,
                                ),
                                badgeContent: Text(notificationControllerIm
                                    .notificationCount.value
                                    .toString()),
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.blueGrey,
                                ),
                              ),

 
                              activeItem: badges.Badge(
                                position: badges.BadgePosition.topStart(),
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: Colors.black,
                                ),
                                badgeContent: Text(notificationControllerIm
                                    .notificationCount.value
                                    .toString()),
                                child: const Icon(
                                  Icons.notifications,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              itemLabel: 'Page 4',
                            ),
                            BottomBarItem(
                              inActiveItem: badges.Badge(
                                position: badges.BadgePosition.topStart(),
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: Colors.black,
                                ),
                                badgeContent: Text(cartController
                                    .cartcountlist.length
                                    .toString()),
                                child: const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              activeItem: badges.Badge(
                                position: badges.BadgePosition.topStart(),
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: Colors.black,
                                ),
                                badgeContent: Text(cartController
                                    .cartcountlist.length
                                    .toString()),
                                child: const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              itemLabel: 'Page 4',
                            ),
                          ],
                          onTap: (index) {
                            controller.update();

                            /// perform action on tab change and to update pages you can update pages without pages

                            controller.pageControllerNavigation
                                .jumpToPage(index);
                          },
                        )
                      : null,
                )));
  }
}
