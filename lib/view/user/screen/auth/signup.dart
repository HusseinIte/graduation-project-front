import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/user/auth/signup_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/alertexitapp.dart';
import '../../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 5),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "24".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 40, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.firstName,
                        hinttext: "90".tr,
                        iconData: Icons.person_outline,
                        labeltext: "87".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.lastName,
                        hinttext: "91".tr,
                        iconData: Icons.person_outline,
                        labeltext: "88".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.centerName,
                        hinttext: "89".tr,
                        iconData: Icons.person_outline,
                        labeltext: "89".tr,
                        // mycontroller: ,
                      ),
//! city
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.city,
                        hinttext: "93".tr,
                        iconData: Icons.home,
                        labeltext: "93".tr,
                        // mycontroller: ,
                      ),
                      //! adress
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 100, "username");
                        },
                        mycontroller: controller.address,
                        hinttext: "94".tr,
                        iconData: Icons.home,
                        labeltext: "94".tr,
                        // mycontroller: ,
                      ),
                      //! phone
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                        mycontroller: controller.phone,
                        hinttext: "22".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "21".tr,
                        // mycontroller: ,
                      ),
                      //! mopile
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                        mycontroller: controller.mobiley,
                        hinttext: "96".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "95".tr,
                        // mycontroller: ,
                      ),
                      CustomButtomAuth(
                          text: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "25".tr,
                        texttwo: "26".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
