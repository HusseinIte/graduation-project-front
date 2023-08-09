import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/constant/color.dart';
import '../../../../data/user/datasource/static/static.dart';

// ignore: camel_case_types
class onboardingHomePage extends StatelessWidget {
  const onboardingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: PageView.builder(
            itemCount: autoonBoardingHomapageList.length,
            itemBuilder: (context, i) => Column(children: [
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: AppColor.thirdColor,
                    ),
                    width: Get.width / 1.1,
                    height: Get.height / 6,
                  ),
                ])));
  }
}
