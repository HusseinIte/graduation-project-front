class MaintinanveOrderModel {
  int? id;
  String? centerName;
  String? orderStatus;
  String? orderType;
  int? totalPrice;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  MaintinanveOrderModel(
      {this.id,
      this.centerName,
      this.orderStatus,
      this.orderType,
      this.totalPrice,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt});

  MaintinanveOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    centerName = json['center_name'];
    orderStatus = json['orderStatus'];
    orderType = json['orderType'];
    totalPrice = json['totalPrice'];
    image = json['Image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['center_name'] = centerName;
    data['orderStatus'] = orderStatus;
    data['orderType'] = orderType;
    data['totalPrice'] = totalPrice;
    data['Image'] = image;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}