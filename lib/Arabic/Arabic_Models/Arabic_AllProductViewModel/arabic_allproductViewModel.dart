class arabicAllProductViewModel {
  arabicAllProductViewModel({
    this.status,
    this.allProductList,
  });
  bool? status;
  List<AllProductList>? allProductList;

  arabicAllProductViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    allProductList = List.from(json['all_product_list'])
        .map((e) => AllProductList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['all_product_list'] = allProductList!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AllProductList {
  AllProductList({
    this.id,
    this.productType,
    this.aTitle,
    this.price,
    this.mainCategoryId,
    this.averageRating,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var productType;
  var aTitle;
  var price;
  var mainCategoryId;
  var averageRating;
  var imageUrl;
  var galleryUrl;

  AllProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    aTitle = json['a_title'];
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
    _data['a_title'] = aTitle;
    _data['price'] = price;
    _data['main_category_id'] = mainCategoryId;
    _data['average_rating'] = averageRating;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}
