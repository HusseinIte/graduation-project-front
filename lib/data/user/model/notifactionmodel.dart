class NotifactionModel {
  String? id;
  String? title;
  String? body;
  String? date;

  NotifactionModel({
    this.title,
    this.body,
    this.date,
  });

  NotifactionModel.fromJson(Map<String, dynamic> json) {
    title = json['id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['date'] = date;

    return data;
  }
}
