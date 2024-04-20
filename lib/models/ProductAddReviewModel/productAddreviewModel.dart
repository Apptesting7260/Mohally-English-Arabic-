class ProductAddReviewModel {
  ProductAddReviewModel({
    this.status,
    this.message,
  });
  bool? status;
  var message;

  ProductAddReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
