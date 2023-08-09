class notificationModel {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  Null? readAt;
  String? createdAt;
  String? updatedAt;

  notificationModel(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  notificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Data {
  int? orderId;
  String? title;
  int? customerId;
  String? customerName;

  Data({this.orderId, this.title, this.customerId, this.customerName});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    title = json['title'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['title'] = title;
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    return data;
  }
}
