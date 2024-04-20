class Search_MainCategory_Model {
  Search_MainCategory_Model({
    this.status,
    this.searchMainCat,
  });

  bool? status;
  List<SearchMainCat>? searchMainCat;

  Search_MainCategory_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    final searchMainCatList = json['search_main_cat'] as List<dynamic>?;

    searchMainCat =
        searchMainCatList?.map((e) => SearchMainCat.fromJson(e)).toList() ?? [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['searchMainCat'] = searchMainCat?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SearchMainCat {
  SearchMainCat({
    this.id,
    this.aCategoryName,
    this.imageUrl,
  });

  int? id;
  String? aCategoryName;
  String? imageUrl;

  SearchMainCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aCategoryName = json['category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = aCategoryName;
    _data['image_url'] = imageUrl;
    return _data;
  }
}
