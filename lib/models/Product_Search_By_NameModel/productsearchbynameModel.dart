class ProductSearchByNameModel {
  ProductSearchByNameModel({
    this.status,
    this.products,
  });
  bool? status;
  List<Products>? products;

  ProductSearchByNameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['products'] = products?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products(
      {this.id, this.aTitle, this.imageUrl, this.galleryUrl, this.producttype});
  int? id;
  String? aTitle;
  String? imageUrl;
  Null galleryUrl;
  var producttype;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aTitle = json['a_title'];
    imageUrl = json['image_url'];
    producttype = json['product_type'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['a_title'] = aTitle;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    _data['product_type'] = producttype;
    return _data;
  }
}
