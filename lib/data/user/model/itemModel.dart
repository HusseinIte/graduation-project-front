class ItemModel {
  String? image;
  String? title;
  String? body;
  String? date;

  ItemModel({this.title, this.body, this.date, this.image});

  ItemModel.fromJson(Map<String, dynamic> json) {
    title = json['address_id'];
    body = json['address_usersid'];
    date = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = title;
    data['address_usersid'] = body;
    data['address_name'] = date;

    return data;
  }
}
