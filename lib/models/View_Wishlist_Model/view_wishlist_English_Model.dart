class English_WishlistViewModel {
  English_WishlistViewModel({
    this.status,
    this.wishlistViewList,
  });
  bool? status;
  List<WishlistViewList>? wishlistViewList;

  English_WishlistViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    wishlistViewList = List.from(json['wishlist_view_list'])
        .map((e) => WishlistViewList.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['wishlist_view_list'] =
        wishlistViewList!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class WishlistViewList {
  WishlistViewList({
    this.id,
    this.productType,
    this.Title,
    this.categoryId,
    this.price,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var productType;
  var Title;
  var categoryId;
  var price;
  var imageUrl;
  var galleryUrl;

  WishlistViewList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    Title = json['title'];
    categoryId = json['category_id'];
    price = json['price'];
    imageUrl = json['image_url'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_type'] = productType;
    _data['title'] = Title;
    _data['category_id'] = categoryId;
    _data['price'] = price;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}
