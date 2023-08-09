import 'package:opticalproject/data/user/model/orderDetailsModel.dart';

class orderModel {
  int? id;
  String? centerName;
  String? orderStatus;
  String? orderType;
  int? totalPrice;
  List<orderDetailsModel>? orderItem;
  String? createdAt;
  String? updatedAt;

  orderModel(
      {this.id,
      this.centerName,
      this.orderStatus,
      this.orderType,
      this.totalPrice,
      this.orderItem,
      this.createdAt,
      this.updatedAt});

  orderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    centerName = json['center_name'];
    orderStatus = json['orderStatus'];
    orderType = json['orderType'];
    totalPrice = json['totalPrice'];
    if (json['orderItem'] != null) {
      orderItem = <orderDetailsModel>[];
      json['orderItem'].forEach((v) {
        orderItem!.add(orderDetailsModel.fromJson(v));
      });
    }
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
    if (orderItem != null) {
      data['orderItem'] = orderItem!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
