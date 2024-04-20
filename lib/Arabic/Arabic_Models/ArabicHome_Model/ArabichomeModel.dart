class HomeModel_Arabic {
  HomeModel_Arabic({
    this.status,
    this.categoryData,
    this.recommendedProduct,
  });
  bool? status;
  List<CategoryData>? categoryData;
  List<RecommendedProduct>? recommendedProduct;

  HomeModel_Arabic.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    categoryData = List.from(json['category_data'])
        .map((e) => CategoryData.fromJson(e))
        .toList();
    recommendedProduct = List.from(json['recommended_product'])
        .map((e) => RecommendedProduct.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['category_data'] = categoryData!.map((e) => e.toJson()).toList();
    _data['recommended_product'] =
        recommendedProduct!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CategoryData {
  CategoryData({
    this.id,
    this.categoryName,
    this.imageUrl,
  });
  var id;
  var categoryName;
  var imageUrl;

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['a_category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_category_name'] = categoryName;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class RecommendedProduct {
  RecommendedProduct({
    this.id,
    this.productType,
    this.title,
    this.inCart,
    this.price,
    this.averageRating,
    this.mainCategoryId,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var productType;
  var title;
  var inCart;
  var price;
  var averageRating;
  var mainCategoryId;
  var imageUrl;
  var galleryUrl;

  RecommendedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    title = json['a_title'];
    inCart = json['in_cart'];
    price = json['price'] == null ? null : json['price'];

    averageRating = json['average_rating'];
    mainCategoryId = json['main_category_id'];
    imageUrl = json['image_url'] == null ? null : json['image_url'];
    ;
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_type'] = productType;
    _data['title'] = title;
    _data['in_cart'] = inCart;
    _data['price'] = price;
    _data['average_rating'] = averageRating;
    _data['main_category_id'] = mainCategoryId;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}
