class SingleProductViewModel {
  SingleProductViewModel({
    this.status,
    this.modalCategory,
    this.productView,
    this.productReview,
  });
  var status;
  var modalCategory;
  ProductView? productView;
  ProductReview? productReview;

  SingleProductViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    modalCategory = json['modal_category'];
    productView = ProductView.fromJson(json['product_view']);
    productReview = ProductReview.fromJson(json['product_review']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['modal_category'] = modalCategory;
    _data['product_view'] = productView!.toJson();
    _data['product_review'] = productReview!.toJson();
    return _data;
  }
}

class ProductView {
  ProductView({
    this.id,
    this.productType,
    this.title,
    this.slug,
    this.description,
    this.productCatgories,
    this.productDetails,
    this.inCart,
    this.quantity,
    this.price,
    this.imageUrl,
    this.galleryUrl,
  });
  var id;
  var productType;
  var title;
  var slug;
  var description;
  ProductCatgories? productCatgories;
  ProductDetails? productDetails;
  var inCart;
  var quantity;
  var price;
  var imageUrl;
  List<String>? galleryUrl;

  ProductView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    productCatgories = ProductCatgories.fromJson(json['product_catgories']);
    productDetails = ProductDetails.fromJson(json['product_details']);
    inCart = json['in_cart'];
    quantity = json['quantity'];
    price = json['price'];
    imageUrl = json['image_url'] != null ? json['image_url'] : null;
    galleryUrl = json['gallery_url'] != null
        ? List.castFrom<dynamic, String>(json['gallery_url'])
        : null;
    ;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_type'] = productType;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['description'] = description;
    _data['product_catgories'] = productCatgories!.toJson();
    _data['product_details'] = productDetails!.toJson();
    _data['in_cart'] = inCart;
    _data['quantity'] = quantity;
    _data['price'] = price;
    _data['image_url'] = imageUrl;
    _data['gallery_url'] = galleryUrl;
    return _data;
  }
}

class ProductCatgories {
  ProductCatgories({
    this.tags,
    this.productCatgorey,
  });
  Tags? tags;
  ProductCatgorey? productCatgorey;

  ProductCatgories.fromJson(Map<String, dynamic> json) {
    tags = Tags.fromJson(json['tags']);
    productCatgorey = ProductCatgorey.fromJson(json['product_catgorey']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tags'] = tags!.toJson();
    _data['product_catgorey'] = productCatgorey!.toJson();
    // productCatgorey!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Tags {
  Tags({
    this.item,
  });
  List<Item>? item;

  Tags.fromJson(Map<String, dynamic> json) {
    item = List.from(json['item']).map((e) => Item.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['item'] = item!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Item {
  Item({
    this.key,
    this.value,
  });
  var key;
  List<String>? value;

  Item.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = List.castFrom<dynamic, String>(json['value']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }
}

class ProductCatgorey {
  ProductCatgorey({
    this.id,
    this.categoryName,
    this.imageUrl,
  });
  var id;
  var categoryName;
  var imageUrl;

  ProductCatgorey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = categoryName;
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class ProductDetails {
  ProductDetails({
    this.details,
  });
  Details? details;

  ProductDetails.fromJson(Map<String, dynamic> json) {
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details!.toJson();
    return _data;
  }
}

// class Details {
//   Details({this.color, this.size, this.capacity, this.model, this.item});
//   List<Color>? color;
//   List<Size>? size;
//   List<Capacity>? capacity;
//   List<Model>? model;
//   List<Items>? item;
//   Details.fromJson(Map<String, dynamic> json) {
//     if (json['Color'] != null && json.containsKey('Color')) {
//       color = List.from(json['Color']).map((e) => Color.fromJson(e)).toList();
//     } else {
//       color = [];
//     }

//     if (json['Size'] != null && json.containsKey('Size')) {
//       size = List.from(json['Size']).map((e) => Size.fromJson(e)).toList();
//     } else {
//       size = [];
//     }
//     if (json['Capacity'] != null && json.containsKey('Capacity')) {
//       capacity =
//           List.from(json['Capacity']).map((e) => Capacity.fromJson(e)).toList();
//     } else {
//       capacity = [];
//     }
//     if (json['Model'] != null && json.containsKey('Model')) {
//       model = List.from(json['Model']).map((e) => Model.fromJson(e)).toList();
//     } else {
//       model = [];
//     }
//     if (json['Items'] != null && json.containsKey('Items')) {
//       item = List.from(json['Items']).map((e) => Items.fromJson(e)).toList();
//     } else {
//       item = [];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     if (color != null && color!.isNotEmpty) {
//       _data['Color'] = color!.map((e) => e.toJson()).toList();
//     }
//     if (size != null && size!.isNotEmpty) {
//       _data['Size'] = size!.map((e) => e.toJson()).toList();
//     }
//     if (capacity != null && capacity!.isNotEmpty) {
//       _data['Capacity'] = capacity!.map((e) => e.toJson()).toList();
//     }
//     if (model != null && model!.isNotEmpty) {
//       _data['Model'] = model!.map((e) => e.toJson()).toList();
//     }
//     if (item != null && item!.isNotEmpty) {
//       _data['Items'] = item!.map((e) => e.toJson()).toList();
//     }
//     return _data;
//   }
// }

class Details {
  Details({
    this.color,
    this.size,
    this.capacity,
    this.model,
    this.item,
    this.quantityy,
    this.weight,
  });

  List<Color>? color;
  List<Size>? size;
  List<Capacity>? capacity;
  List<Model>? model;
  List<Items>? item;
  List<Weight>? weight;
  List<Quantiy>? quantityy;

  Details.fromJson(Map<String, dynamic> json) {
    color = json['Color'] != null
        ? List.from(json['Color']).map((e) => Color.fromJson(e)).toList()
        : null;
    size = json['Size'] != null
        ? List.from(json['Size']).map((e) => Size.fromJson(e)).toList()
        : null;
    capacity = json['Capacity'] != null
        ? List.from(json['Capacity']).map((e) => Capacity.fromJson(e)).toList()
        : null;
    model = json['Model'] != null
        ? List.from(json['Model']).map((e) => Model.fromJson(e)).toList()
        : null;
    item = json['Items'] != null
        ? List.from(json['Items']).map((e) => Items.fromJson(e)).toList()
        : null;
    quantityy = json['Quantity'] != null
        ? List.from(json['Quantity']).map((e) => Quantiy.fromJson(e)).toList()
        : null;
    weight = json['Weight'] != null
        ? List.from(json['Weight']).map((e) => Weight.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (color != null) _data['Color'] = color!.map((e) => e.toJson()).toList();
    if (size != null) _data['Size'] = size!.map((e) => e.toJson()).toList();
    if (capacity != null)
      _data['Capacity'] = capacity!.map((e) => e.toJson()).toList();
    if (model != null) _data['Model'] = model!.map((e) => e.toJson()).toList();
    if (item != null) _data['Items'] = item!.map((e) => e.toJson()).toList();
    if (quantityy != null)
      _data['Quantity'] = quantityy!.map((e) => e.toJson()).toList();
    if (weight != null)
      _data['Weight'] = weight!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Color {
  Color({
    this.id,
    this.value,
    this.featureImage,
    this.gallery,
  });
  var id;
  var value;
  var featureImage;
  List<String>? gallery;

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    featureImage = json['feature_image'];
    gallery = json['gallery'] != null
        ? List.castFrom<dynamic, String>(json['gallery'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;
    _data['feature_image'] = featureImage;
    _data['gallery'] = gallery;
    return _data;
  }
}

class Size {
  Size({
    this.id,
    this.value,
  });
  var id;
  var value;

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;

    return _data;
  }
}

class Weight {
  Weight({
    this.id,
    this.value,
  });
  var id;
  var value;

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;

    return _data;
  }
}

class Quantiy {
  Quantiy({
    this.id,
    this.value,
  });
  var id;
  var value;

  Quantiy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;

    return _data;
  }
}

class Model {
  Model({
    this.id,
    this.value,
  });
  var id;
  var value;

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;

    return _data;
  }
}

class Items {
  Items({
    this.id,
    this.value,
  });
  var id;
  var value;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;

    return _data;
  }
}

class Capacity {
  Capacity({
    this.id,
    this.value,
  });
  var id;
  var value;

  Capacity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['value'] = value;

    return _data;
  }
}

class ProductReview {
  ProductReview({
    this.productAverageReview,
    this.productReviewDetails,
  });
  var productAverageReview;
  List<dynamic>? productReviewDetails;

  ProductReview.fromJson(Map<String, dynamic> json) {
    productAverageReview = json['product_average_review'];
    productReviewDetails =
        List.castFrom<dynamic, dynamic>(json['product_review_details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_average_review'] = productAverageReview;
    _data['product_review_details'] = productReviewDetails;
    return _data;
  }
}
