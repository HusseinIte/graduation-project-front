import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String centerName,
      required String city,
      required String address,
      required String phone,
      required String mobiley}) async {
    var response = await crud.postData(AppLink.baseUrl + AppLink.singup, {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "centerName": centerName,
      "city": city,
      "address": address,
      "phone": phone,
      "mobile": mobiley,
    });
;
    return response.fold((l) => l, (r) => r);
  }
}
