class SubCategoryProducts {
  SubCategoryProducts({
    this.status,
    this.productByCategory,
    this.tags,
    this.attributes,
  });
  bool? status;
  List<ProductByCategory>? productByCategory;
  List<Tags>? tags;
  List<Attributes>? attributes;

  SubCategoryProducts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    productByCategory = List.from(json['product_by_category'])
        .map((e) => ProductByCategory.fromJson(e))
        .toList();
    tags = List.from(json['tags']).map((e) => Tags.fromJson(e)).toList();
    attributes = List.from(json['attributes'])
        .map((e) => Attributes.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['product_by_category'] =
        productByCategory!.map((e) => e.toJson()).toList();
    _data['tags'] = tags!.map((e) => e.toJson()).toList();
    _data['attributes'] = attributes!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductByCategory {
  ProductByCategory({
    this.id,
    this.colorImages,
    this.productType,
    this.title,
    this.inCart,
    this.price,
    this.mainCategoryId,
    this.averageRating,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var colorImages;
  var productType;
  var title;
  bool? inCart;
  var price;
  var mainCategoryId;
  var averageRating;
  var imageUrl;
  var galleryUrl;

  ProductByCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorImages = null;
    productType = json['product_type'];
    title = json['title'];
    inCart = json['in_cart'];
    price = json['price'];
    mainCategoryId = json['main_category_id'];
    averageRating = json['average_rating'];
    imageUrl = json['image_url'];
    galleryUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['color_images'] = colorImages;
    _data['product_type'] = productType;
    _data['title'] = title;
    _data['in_cart'] = inCart;
    _data['price'] = price;
    _data['main_category_id'] = mainCategoryId;
    _data['average_rating'] = averageRating;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}

class Tags {
  Tags({
    this.id,
    this.tagTitle,
    this.tagWithSubtag,
  });
  var id;
  var tagTitle;
  List<TagWithSubtag>? tagWithSubtag;

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagTitle = json['tag_title'];
    tagWithSubtag = List.from(json['tag_with_subtag'])
        .map((e) => TagWithSubtag.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tag_title'] = tagTitle;
    _data['tag_with_subtag'] = tagWithSubtag!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class TagWithSubtag {
  TagWithSubtag({
    this.id,
    this.subTagName,
  });
  var id;
  var subTagName;

  TagWithSubtag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subTagName = json['sub_tag_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sub_tag_name'] = subTagName;
    return _data;
  }
}

class Attributes {
  Attributes({
    this.id,
    this.attributeName,
    this.AttributeWithVariation,
  });
  var id;
  var attributeName;
  List<attributeWithVariation>? AttributeWithVariation;

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeName = json['attribute_name'];
    AttributeWithVariation = List.from(json['Attribute_With_Variation'])
        .map((e) => attributeWithVariation.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attribute_name'] = attributeName;
    _data['Attribute_With_Variation'] =
        AttributeWithVariation?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class attributeWithVariation {
  attributeWithVariation({
    this.id,
    this.variationName,
  });
  var id;
  var variationName;

  attributeWithVariation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variationName = json['variation_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['variation_name'] = variationName;
    return _data;
  }
}
