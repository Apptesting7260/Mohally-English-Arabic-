class SignUpModel {
  SignUpModel({
    this.status,
    this.message,
    this.token,
  });
  bool? status;
  String? message;
  String? token;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;

    return _data;
  }
}
