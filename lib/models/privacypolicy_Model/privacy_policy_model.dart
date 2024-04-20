class PrivacypolicyModel {
  PrivacypolicyModel({
    required this.status,
    required this.pagecontent,
  });
  late final bool status;
  late final Pagecontent pagecontent;

  PrivacypolicyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pagecontent = Pagecontent.fromJson(json['pagecontent']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['pagecontent'] = pagecontent.toJson();
    return _data;
  }
}

class Pagecontent {
  Pagecontent({
    required this.heading,
    required this.contents,
    required this.images,
    required this.imageUrl,
  });
  late final String heading;
  late final String contents;
  late final String images;
  late final List<String> imageUrl;

  Pagecontent.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    contents = json['contents'];
    images = json['images'];
    imageUrl = List.castFrom<dynamic, String>(json['image_url']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['heading'] = heading;
    _data['contents'] = contents;
    _data['images'] = images;
    _data['image_url'] = imageUrl;
    return _data;
  }
}
