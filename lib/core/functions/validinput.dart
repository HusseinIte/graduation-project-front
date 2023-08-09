import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "40".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "41".tr;
    }
  }

  if (val.isEmpty) {
    return "43".tr;
  }

  if (val.length < min) {
    return "${"44".tr} $min";
  }

  if (val.length > max) {
    return "${"45".tr} $max";
  }
}

validInputNumber(String val, int min, int max) {
  if (val.isEmpty) {
    return "43".tr;
  }
  try {
    if (int.parse(val) < min) {
      return "${"44".tr} $min";
    }
    if (int.parse(val) > max) {
      return "${"45".tr} $max";
    }
  } catch (e) {
    return "";
  }
}
