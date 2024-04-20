// class WishlistViewModel {
//   WishlistViewModel({
//      this.status,
//      this.wishlistViewList,
//   });
//    bool ?status;
//    List<dynamic>? wishlistViewList;
  
//   WishlistViewModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     wishlistViewList = List.castFrom<dynamic, dynamic>(json['wishlist_view_list']);
//   }
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['wishlist_view_list'] = wishlistViewList;
//     return _data;
//   }
// }