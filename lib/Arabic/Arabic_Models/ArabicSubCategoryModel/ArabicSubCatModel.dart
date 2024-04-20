class Arabic_SubCategoryModel {
  Arabic_SubCategoryModel({
    this.status,
    this.seeAllMainCategory,
  });
  bool? status;
  List<SeeAllMainCategory>? seeAllMainCategory;

  Arabic_SubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    seeAllMainCategory = List.from(json['see_all_main_category'])
        .map((e) => SeeAllMainCategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['see_all_main_category'] =
        seeAllMainCategory!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SeeAllMainCategory {
  SeeAllMainCategory({
    this.id,
    this.categoryName,
    this.imageUrl,
  });
  var id;
  var categoryName;
  var imageUrl;

  SeeAllMainCategory.fromJson(Map<String, dynamic> json) {
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
