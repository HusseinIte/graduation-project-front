import 'package:opticalproject/linkapi.dart';

import '../../../../core/class/crud.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  postdata(String email, String code) async {
    var response = await crud.postData(
        AppLink.baseUrl + AppLink.verificationCode,
        {"email": email, "code": code});
    return response.fold((l) => l, (r) => r);
  }
}



