// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:opticalproject/controller/user/home/main/home_controller.dart';

class AnimatedGridViewForCategory extends StatelessWidget {
  const AnimatedGridViewForCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(3, (index) {
              return InkWell(
                onTap: () => controller.gotoViewItemforcategory(index),
                child: AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: 2,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 1000),
                      child: FadeInAnimation(
                        child: Center(
                          child: listitem[index],
                        ),
                      ),
                    )),
              );
            })));
  }
}

List<CustomCard> listitem = [
  CustomCard(assetPath: "assets/images/frame..jpg", countryName: "111".tr),
  CustomCard(assetPath: "assets/images/lenses.jpg", countryName: "112".tr),
  CustomCard(assetPath: "assets/images/device.jpg", countryName: "113".tr)
];

class CustomCard extends StatelessWidget {
  final String assetPath;
  final String countryName;
  const CustomCard(
      {super.key, required this.assetPath, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.35,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Stack(children: [
                  Image.asset(
                    assetPath,
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    cacheHeight: 100,
                    cacheWidth: 100,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.1),
                          Colors.black.withOpacity(.3)
                        ],
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            countryName,
                       
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ]),
              )),
        ),
      ),
    );
  }
}
