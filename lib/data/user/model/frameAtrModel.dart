// ignore_for_file: prefer_collection_literals

class FrameAtrModel {
  int? id;
  int? productId;
  String? frameType;
  int? size;
  int? arm;
  int? bridge;
  String? frameShape;
  String? frameClass;
  String? color;
  String? createdAt;
  String? updatedAt;

  FrameAtrModel(
      {this.id,
      this.productId,
      this.frameType,
      this.size,
      this.arm,
      this.bridge,
      this.frameShape,
      this.frameClass,
      this.color,
      this.createdAt,
      this.updatedAt});

  FrameAtrModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    frameType = json['frameType'];
    size = json['size'];
    arm = json['arm'];
    bridge = json['bridge'];
    frameShape = json['frameShape'];
    frameClass = json['frameClass'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['product_id'] = productId;
    data['frameType'] = frameType;
    data['size'] = size;
    data['arm'] = arm;
    data['bridge'] = bridge;
    data['frameShape'] = frameShape;
    data['frameClass'] = frameClass;
    data['color'] = color;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
