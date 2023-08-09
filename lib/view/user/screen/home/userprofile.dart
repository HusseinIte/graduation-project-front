import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:opticalproject/controller/user/user/userInfo.dart';
import 'package:opticalproject/core/constant/color.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoControllerImp());
    return GetX<UserInfoControllerImp>(builder: (controller) {
      return controller.user().email == null
          ? const NoUserLogin()
          : Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.7),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: Get.height / 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Lottie.asset("assets/lottie/nologin.json",
                              height: 150),
                          SizedBox(
                            height: Get.height / 25,
                          ),
                          Text(
                            "${controller.user.value.firstName} " " ${controller.user.value.centerName} "
                                    " ${controller.user.value.lastName}",
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height / 2.2),
                    child: Container(
                      color: const Color.fromARGB(249, 232, 232, 232),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height / 2.6,
                        left: Get.height / 50,
                        right: Get.height / 50),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: Get.height / 10),
                          child: Column(
                            children: <Widget>[
                              infoChild(Get.width, Icons.email_outlined,
                                  controller.user().email ?? ""),
                              infoChild(Get.width, Icons.call,
                                  controller.user().phone ?? ""),
                              Padding(
                                padding: EdgeInsets.only(top: Get.height / 30),
                                child: InkWell(
                                    onTap: () => controller.logout(),
                                    child: Container(
                                      width: Get.width / 1.05,
                                      height: Get.height / 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Get.height / 40)),
                                      ),
                                      child: Card(
                                          elevation: 20,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: const BorderSide(
                                                  width: 1,
                                                  color:
                                                      AppColor.primaryColor)),
                                          child: Center(child: Text("61".tr))),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
    });
  }
}

Widget headerChild(String header, int value) => Expanded(
        child: Column(
      children: <Widget>[
        Text(header),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$value',
          style: const TextStyle(
              fontSize: 14.0,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold),
        )
      ],
    ));

Widget infoChild(double width, IconData icon, data) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(width: 1, color: AppColor.primaryColor)),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: width / 10,
                ),
                Icon(
                  icon,
                  //    color: AppColor,
                  size: 36.0,
                ),
                SizedBox(
                  width: width / 10,
                ),
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            )),
        onTap: () {},
      ),
    );

class NoUserLogin extends StatelessWidget {
  const NoUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Lottie.asset("assets/lottie/nologin.json"),
        const SizedBox(
          height: 30,
        ),
        Text("107".tr)
      ]),
    );
  }
}
