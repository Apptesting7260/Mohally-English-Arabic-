class OrderDetailsModel {
  OrderDetailsModel({
    this.status,
    this.orderInformation,
    this.orderItemInformation,
    this.shippingAddress,
  });
  bool? status;
  OrderInformation? orderInformation;
  List<OrderItemInformation>? orderItemInformation;
  ShippingAddress? shippingAddress;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderInformation = OrderInformation.fromJson(json['order_information']);
    orderItemInformation = List.from(json['order_item_information'])
        .map((e) => OrderItemInformation.fromJson(e))
        .toList();
    shippingAddress = ShippingAddress.fromJson(json['shipping_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['order_information'] = orderInformation!.toJson();
    _data['order_item_information'] =
        orderItemInformation!.map((e) => e.toJson()).toList();
    _data['shipping_address'] = shippingAddress!.toJson();
    return _data;
  }
}

class OrderInformation {
  OrderInformation({
    this.id,
    this.orderId,
    this.orderStatus,
    this.shipingDate,
    this.orderDate,
    this.amount,
    this.discunt,
    this.payAmount,
    this.shippingTo,
  });
  var id;
  var orderId;
  var orderStatus;
  var shipingDate;
  var orderDate;
  var amount;
  var discunt;
  var payAmount;
  var shippingTo;

  OrderInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    shipingDate = json['shiping_date'];
    orderDate = json['order_date'];
    amount = json['amount'];
    discunt = json['discunt'];
    payAmount = json['pay_amount'];
    shippingTo = json['shipping_to'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['order_id'] = orderId;
    _data['order_status'] = orderStatus;
    _data['shiping_date'] = shipingDate;
    _data['order_date'] = orderDate;
    _data['amount'] = amount;
    _data['discunt'] = discunt;
    _data['pay_amount'] = payAmount;
    _data['shipping_to'] = shippingTo;
    return _data;
  }
}

class OrderItemInformation {
  OrderItemInformation({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.totalPrice,
    this.totalQuantity,
    this.image,
    this.productDetails,
  });
  var id;
  var categoryId;
  var name;
  var price;
  var totalPrice;
  var totalQuantity;
  var image;
  Null productDetails;

  OrderItemInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    price = json['price'];
    totalPrice = json['total_price'];
    totalQuantity = json['total_quantity'];
    image = json['image'];
    productDetails = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_id'] = categoryId;
    _data['name'] = name;
    _data['price'] = price;
    _data['total_price'] = totalPrice;
    _data['total_quantity'] = totalQuantity;
    _data['image'] = image;
    _data['product_details'] = productDetails;
    return _data;
  }
}

class ShippingAddress {
  ShippingAddress({
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

  ShippingAddress.fromJson(Map<String, dynamic> json) {
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
