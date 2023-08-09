import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:opticalproject/controller/user/auth/verficationControll.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! change lisner controller
    Get.put(VervivationControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<VervivationControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "97".tr),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(text: "98".tr),
                  const SizedBox(height: 15),
                  OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 4,
                    borderColor: const Color(0xFF512DA8),

                    showFieldAsBox: true,

                    onCodeChanged: (String code) {},

                    onSubmit: (String verificationCode) {
                      controller.verfication(
                          controller.email ?? "", verificationCode);
                    }, // end onSubmit
                  ),
                  /*
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {},
                    child: const Center(
                        child: Text(
                      "Resend verfiy code",
                      style:
                          TextStyle(color: AppColor.primaryColor, fontSize: 20),
                    )),
                  )
                  */
                ]),
              ))),
    );
  }
}
