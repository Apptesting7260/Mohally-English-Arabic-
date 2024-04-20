class HomeBannerModel {
  HomeBannerModel({
    this.status,
    this.homeBanner,
  });
  bool? status;
  HomeBanner? homeBanner;

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    homeBanner = HomeBanner.fromJson(json['home_banner']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['home_banner'] = homeBanner!.toJson();
    return _data;
  }
}

class HomeBanner {
  HomeBanner({
    this.id,
    this.pageName,
    this.pageBannerLocation,
    this.bannerUrl,
  });
  int? id;
  String? pageName;
  String? pageBannerLocation;
  List<String>? bannerUrl;

  HomeBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageName = json['page_name'];
    pageBannerLocation = json['page_banner_location'];
    bannerUrl = List.castFrom<dynamic, String>(json['banner_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['page_name'] = pageName;
    _data['page_banner_location'] = pageBannerLocation;
    _data['banner_url'] = bannerUrl;
    return _data;
  }
}
