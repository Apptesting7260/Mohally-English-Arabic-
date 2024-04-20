import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/View_Wishlist_Model/View_wishlistModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicViewwishlist extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = WishlistViewModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(WishlistViewModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  String? productid;
  void ViewWishlish_apihit() async {
    loading.value = true;
    Map data = {
      "language_type": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.ViewWishlistApi(data, header).then((value) {
      print("UseraddressView_apihit successful");
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing UserAddress View Value ');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("UseraddressView_apihit error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
