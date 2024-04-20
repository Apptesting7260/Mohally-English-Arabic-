class CouponCodeApplyModel {
  CouponCodeApplyModel({
    this.status,
    this.message,
    this.discountPrice,
    this.totalPrice,
    this.couponId,
  });
  bool? status;
  String? message;
  double? discountPrice;
  double? totalPrice;
  String? couponId;

  CouponCodeApplyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    discountPrice = json['discount_price'];
    totalPrice = json['total_price'];
    couponId = json['coupon_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['discount_price'] = discountPrice;
    _data['total_price'] = totalPrice;
    _data['coupon_id'] = couponId;
    return _data;
  }
}
