class Add_new_Address_Arabic_Model {
  Add_new_Address_Arabic_Model({
    this.status,
    this.message,
  });
  bool? status;
  String? message;

  Add_new_Address_Arabic_Model.fromJson(Map<String, dynamic> json) {
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
