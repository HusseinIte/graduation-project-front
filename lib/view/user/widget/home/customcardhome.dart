import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user/home/main/home_controller.dart';


class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  final Color color1;
  final Color color2;
  const CustomCardHome({
    Key? key,
    required this.title,
    required this.body,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.center,
        height: Get.height / 4.5,
        decoration: BoxDecoration(
            color: color1, borderRadius: BorderRadius.circular(20)),
      ),
      Positioned(
        top: -50,
        right: -100,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: color2, borderRadius: BorderRadius.circular(160)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          subtitle: Text(body,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      )
    ]);
  }
}
