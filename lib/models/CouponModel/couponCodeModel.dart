class CouponCodeModel {
  CouponCodeModel({
    this.status,
    this.availableCoupon,
  });
  bool? status;
  List<AvailableCoupon>? availableCoupon;

  CouponCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    availableCoupon = List.from(json['available_coupon'])
        .map((e) => AvailableCoupon.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['available_coupon'] =
        availableCoupon!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AvailableCoupon {
  AvailableCoupon({
    this.id,
    this.code,
    this.type,
    this.discountType,
    this.amount,
    this.maxUses,
    this.productId,
    this.categoryId,
    this.userId,
    this.proMinAmount,
    this.startAt,
    this.expireAt,
    this.status,
    this.remainUses,
    this.extraCol2,
  });
  var id;
  var code;
  var type;
  var discountType;
  var amount;
  var maxUses;
  var productId;
  var categoryId;
  var userId;
  var proMinAmount;
  var startAt;
  var expireAt;
  var status;
  var remainUses;
  var extraCol2;

  AvailableCoupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    type = json['type'];
    discountType = json['discount_type'];
    amount = json['amount'];
    maxUses = json['max_uses'];
    productId = null;
    categoryId = null;
    userId = null;
    proMinAmount = null;
    startAt = json['start_at'];
    expireAt = json['expire_at'];
    status = json['status'];
    remainUses = json['remain_uses'];
    extraCol2 = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['type'] = type;
    _data['discount_type'] = discountType;
    _data['amount'] = amount;
    _data['max_uses'] = maxUses;
    _data['product_id'] = productId;
    _data['category_id'] = categoryId;
    _data['user_id'] = userId;
    _data['pro_min_amount'] = proMinAmount;
    _data['start_at'] = startAt;
    _data['expire_at'] = expireAt;
    _data['status'] = status;
    _data['remain_uses'] = remainUses;
    _data['extra_col2'] = extraCol2;
    return _data;
  }
}
