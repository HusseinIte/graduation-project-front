class LensesAtrModel {
  int? id;
  int? productId;
  String? spherical;
  String? cylinder;
  String? lensesClass;
  String? classType;
  String? createdAt;
  String? updatedAt;

  LensesAtrModel(
      {this.id,
      this.productId,
      this.spherical,
      this.cylinder,
      this.lensesClass,
      this.classType,
      this.createdAt,
      this.updatedAt});

  LensesAtrModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    spherical = json['spherical'];
    cylinder = json['cylinder'];
    lensesClass = json['lensesClass'];
    classType = json['classType'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['spherical'] = spherical;
    data['cylinder'] = cylinder;
    data['lensesClass'] = lensesClass;
    data['classType'] = classType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
