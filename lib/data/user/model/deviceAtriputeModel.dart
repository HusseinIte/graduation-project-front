class DeviceAtrModel {
  int? id;
  int? productId;
  String? details;
  String? createdAt;
  String? updatedAt;

  DeviceAtrModel(
      {this.id, this.productId, this.details, this.createdAt, this.updatedAt});

  DeviceAtrModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['details'] = details;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
