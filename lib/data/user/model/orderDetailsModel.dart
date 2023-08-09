class orderDetailsModel {
  int? id;
  String? productType;
  String? numberModel;
  int? quantity;

  orderDetailsModel(
      {this.id, this.productType, this.numberModel, this.quantity});

  orderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    numberModel = json['numberModel'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['numberModel'] = numberModel;
    data['quantity'] = quantity;
    return data;
  }
}