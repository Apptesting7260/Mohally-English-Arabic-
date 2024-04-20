class Add_Remove_WishlistModel {
  Add_Remove_WishlistModel({
    this.status,
    this.message,
  });
  bool? status;
  String? message;

  Add_Remove_WishlistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
