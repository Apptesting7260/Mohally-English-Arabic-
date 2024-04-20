// class ProductPriceChangeByAttributeModel {
//   ProductPriceChangeByAttributeModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//   bool? status;
//   String? message;
//   List<dynamic>? data;

//   ProductPriceChangeByAttributeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = List.castFrom<dynamic, dynamic>(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data;
//     return _data;
//   }
// }
// class ProductPriceChangeByAttributeModel {
//   ProductPriceChangeByAttributeModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//   bool? status;
//   String? message;
//   Data? data;

//   ProductPriceChangeByAttributeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] == [] ? [] : json['data'];
//     // if (json['data'] is List && json['data'].isEmpty) {
//     //   data = null;
//     // } else {
//     //   data = Data.fromJson(json['data']);
//     // }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data;
//     return _data;
//   }
// }

// class Data {
//   Data({
//     this.price,
//     this.totalQuantity,
//     this.cartId,
//   });
//   String? price;
//   String? totalQuantity;
//   int? cartId;

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json.isNotEmpty) {
//       price = json['price'];
//       totalQuantity = json['total_quantity'];
//       cartId = json['cart_id'];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['price'] = price;
//     _data['total_quantity'] = totalQuantity;
//     _data['cart_id'] = cartId;
//     return _data;
//   }
// }
class ProductPriceChangeByAttributeModel {
  ProductPriceChangeByAttributeModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  var message;
  Data? data;

  factory ProductPriceChangeByAttributeModel.fromJson(
      Map<String, dynamic> json) {
    return ProductPriceChangeByAttributeModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    if (data != null) {
      _data['data'] = data!.toJson();
    }
    return _data;
  }
}

class Data {
  Data({
    this.price,
    this.totalQuantity,
    this.cartId,
  });

  var price;
  var totalQuantity;
  var cartId;

  factory Data.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return Data(
        price: json['price'],
        totalQuantity: json['total_quantity'],
        cartId: json['cart_id'],
      );
    } else {
      // Handle the case when json is a list or any other type
      return Data();
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['price'] = price;
    _data['total_quantity'] = totalQuantity;
    _data['cart_id'] = cartId;
    return _data;
  }
}
