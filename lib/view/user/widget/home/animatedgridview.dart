// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/user/home/main/home_controller.dart';

class AnimatedGridView extends StatelessWidget {
  const AnimatedGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(4, (index) {
              return InkWell(
                onTap: () => controller.gotoViewItem(index, ""),
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
  CustomCard(assetPath: "assets/lottie/allproduct.json", countryName: "143".tr),
  CustomCard(assetPath: "assets/lottie/mann.json", countryName: "52".tr),
  CustomCard(assetPath: "assets/lottie/woman.json", countryName: "53".tr),
  CustomCard(assetPath: "assets/lottie/child.json", countryName: "54".tr),
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
                  Lottie.asset(assetPath),
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
