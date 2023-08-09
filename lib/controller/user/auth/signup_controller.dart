import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/user/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController centerName;
  late TextEditingController city;
  late TextEditingController address;
  late TextEditingController phone;
  late TextEditingController mobiley;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          address: address.text,
          phone: phone.text,
          centerName: centerName.text,
          city: city.text,
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          mobiley: mobiley.text,
          password: password.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verfiyCodeSignUp, arguments: {
            "address": address.text,
            "phone": phone.text,
            "centerName": centerName.text,
            "city": city.text,
            "firstName": firstName.text,
            "lastName": lastName.text,
            "email": email.text,
            "mobiley": mobiley.text,
            "password": password.text
          });
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    address = TextEditingController();
    mobiley = TextEditingController();
    firstName = TextEditingController();
    centerName = TextEditingController();
    lastName = TextEditingController();
    city = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    address.dispose();
    mobiley.dispose();
    firstName.dispose();
    centerName.dispose();
    lastName.dispose();
    city.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
