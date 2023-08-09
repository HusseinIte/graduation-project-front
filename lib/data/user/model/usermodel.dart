class UserModel {
  String? id;
  // ignore: non_constant_identifier_names
  String? user_id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? centerName;
  String? city;
  String? address;
  String? phone;
  String? mobile;

  UserModel(
      {this.id,
      // ignore: non_constant_identifier_names
      this.user_id,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.centerName,
      this.city,
      this.address,
      this.phone,
      this.mobile});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    centerName = json['centerName'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['user_id'] = user_id;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['centerName'] = centerName;
    data['city'] = city;
    data['address'] = address;
    data['phone'] = phone;
    data['mobile'] = mobile;
    return data;
  }
}
