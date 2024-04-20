class ProductbyCatListModel {
  ProductbyCatListModel({
    this.status,
    this.productByCategory,
  });
  bool? status;
  List<ProductByCategory>? productByCategory;

  ProductbyCatListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    productByCategory = List.from(json['product_by_category'])
        .map((e) => ProductByCategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['product_by_category'] =
        productByCategory!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductByCategory {
  ProductByCategory({
    this.id,
    this.productType,
    this.title,
    this.price,
    this.mainCategoryId,
    this.averageRating,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var productType;
  var title;
  var price;
  var mainCategoryId;
  var averageRating;
  var imageUrl;
  var galleryUrl;

  ProductByCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    title = json['title'];
    price = json['price'];
    mainCategoryId = json['main_category_id'];
    averageRating = json['average_rating'];
    imageUrl = json['image_url'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_type'] = productType;
    _data['title'] = title;
    _data['price'] = price;
    _data['main_category_id'] = mainCategoryId;
    _data['average_rating'] = averageRating;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}
