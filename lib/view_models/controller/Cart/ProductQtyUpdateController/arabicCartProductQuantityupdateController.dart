import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CartProductQtyUpdateModel/cartproductQtyUpdate.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? arabicCartId;

class arabicCartProductQtyIncrementCartcontroller extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = CartProductQtyUpdateModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(CartProductQtyUpdateModel value) =>
      signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> QtyUpdate_Apihit(
      BuildContext context, int index, String quantityUpdateAction) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    loading.value = true;

    Map data = {
      'cart_id': arabicCartId.toString(),
      'quantity_update': quantityUpdateAction,
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.CartProductQtyUpdateApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");
      if (value.status == true) {
        Get.offAll(arabic_TabScreen(index: 3));
      } else {
        Utils.snackBar(context, 'Failed', value.message.toString());
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());
    });
  }
}
