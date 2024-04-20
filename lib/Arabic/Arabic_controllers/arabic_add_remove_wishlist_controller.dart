import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Add_Remove_Wishlist_Model/add_remove_wishlish_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Arabic_Add_remove_productid;

class ArabicAdd_remove_wishlistController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = Add_Remove_WishlistModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(Add_Remove_WishlistModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void AddRemoveWishlish_apihit() async {
    loading.value = true;
    Map data = {
      "product_id": Arabic_Add_remove_productid.toString(),
      "language_type": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.AddRemoveWishlistApi(data, header).then((value) {
      print("ADD remove wishlist successful");
      setUserList(value);

      setRxRequestStatus(Status.COMPLETED);

      print('printing UserAddress View Value ');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("ADD remove wishlist error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
