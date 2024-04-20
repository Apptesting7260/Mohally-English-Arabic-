class OrderStatusModel {
  OrderStatusModel({
    this.status,
    this.message,
    this.orders,
  });
  bool? status;
  String? message;
  List<Orders>? orders;

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    orders = List.from(json['orders']).map((e) => Orders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['orders'] = orders!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Orders {
  Orders({
    this.id,
    this.orderStatus,
    this.netAmount,
    this.orderId,
    this.Quantity,
    this.orderDate,
  });
  int? id;
  String? orderStatus;
  String? netAmount;
  String? orderId;
  int? Quantity;
  String? orderDate;

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderStatus = json['order_status'];
    netAmount = json['net_amount'];
    orderId = json['order_id'];
    Quantity = json['Quantity'];
    orderDate = json['order_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['order_status'] = orderStatus;
    _data['net_amount'] = netAmount;
    _data['order_id'] = orderId;
    _data['Quantity'] = Quantity;
    _data['order_date'] = orderDate;
    return _data;
  }
}
