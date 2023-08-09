class ProductModel {
  int? id;
  String? productType;
  String? numberModel;
  String? manufactureCompany;
  int? amount;
  int? price;
  List<String>? images;

  ProductModel(
      {this.id,
      this.productType,
      this.numberModel,
      this.manufactureCompany,
      this.amount,
      this.price,
      this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['productType'];
    numberModel = json['numberModel'];
    manufactureCompany = json['manufactureCompany'];
    amount = json['amount'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productType'] = productType;
    data['numberModel'] = numberModel;
    data['manufactureCompany'] = manufactureCompany;
    data['amount'] = amount;
    data['price'] = price;
    data['images'] = images;
    return data;
  }
}
