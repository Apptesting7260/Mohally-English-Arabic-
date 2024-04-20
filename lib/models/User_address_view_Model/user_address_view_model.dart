class UserAddressViewModel {
  UserAddressViewModel({
     this.status,
     this.userAddress,
  });
   bool? status;
   List<UserAddress> ?userAddress;
  
  UserAddressViewModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    userAddress = List.from(json['user_address']).map((e)=>UserAddress.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['user_address'] = userAddress?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UserAddress {
  UserAddress({
     this.id,
     this.userId,
     this.tempUserName,
     this.address,
     this.city,
     this.country,
     this.state,
     this.zipCode,
     this.mobileNumber,
     this.primaryAddressStatus,
     this.languageType,
  });
   var id;
   var userId;
   var tempUserName;
   var address;
   var city;
   var country;
   var state;
   var zipCode;
   var mobileNumber;
   var primaryAddressStatus;
   var languageType;
  
  UserAddress.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    tempUserName = json['temp_user_name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    zipCode = json['zip_code'];
    mobileNumber = json['mobile_number'];
    primaryAddressStatus = json['primary_address_status'];
    languageType = json['language_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['temp_user_name'] = tempUserName;
    _data['address'] = address;
    _data['city'] = city;
    _data['country'] = country;
    _data['state'] = state;
    _data['zip_code'] = zipCode;
    _data['mobile_number'] = mobileNumber;
    _data['primary_address_status'] = primaryAddressStatus;
    _data['language_type'] = languageType;
    return _data;
  }
}