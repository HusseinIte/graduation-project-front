import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoItemCartidget extends StatelessWidget {
  const NoItemCartidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: const AssetImage("assets/images/nodata.gif"),
          radius: Get.height / 9,
        ),
        SizedBox(
          height: Get.height / 100,
        ),
        Text(
          "63".tr,
          style: const TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
