class ProductViewReviewModel {
  ProductViewReviewModel({
    this.status,
    this.productReview,
  });
  bool? status;
  List<ProductReview>? productReview;

  ProductViewReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    productReview = List.from(json['product_review'])
        .map((e) => ProductReview.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['product_review'] = productReview!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductReview {
  ProductReview({
    this.id,
    this.userId,
    this.productId,
    this.userName,
    this.description,
    this.ratting,
    this.galleryUrl,
  });
  var id;
  var userId;
  var productId;
  var userName;
  var description;
  var ratting;
  var galleryUrl;

  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    userName = json['user_name'];
    description = json['description'];
    ratting = json['ratting'];
    galleryUrl = json["gallery_url"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['product_id'] = productId;
    _data['user_name'] = userName;
    _data['description'] = description;
    _data['ratting'] = ratting;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}
