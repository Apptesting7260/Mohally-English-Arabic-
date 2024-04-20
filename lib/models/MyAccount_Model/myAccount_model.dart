class MyAccountModal {
  MyAccountModal({
    this.status,
    this.userDetails,
  });
  bool? status;
  UserDetails? userDetails;

  MyAccountModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userDetails = UserDetails.fromJson(json['user_details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['user_details'] = userDetails!.toJson();
    return _data;
  }
}

class UserDetails {
  UserDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.country,
    this.languageType,
    this.imageUrl,
  });
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? country;
  Null languageType;
  var imageUrl;

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    languageType = null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['country'] = country;
    _data['language_type'] = languageType;
    _data['image_url'] = imageUrl;
    return _data;
  }
}
