
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/EnglishDeleteCartModel/English_deleteCartModel.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? deleteCartId;

class DeleteCartCartController extends GetxController {
  final AuthRepository _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = EnglishDeleteCartModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(EnglishDeleteCartModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  RxList selectedCartIds = [].obs;
  void deleteCartApiHit(List ids, BuildContext context) async {
     if (ids.isEmpty) {
      Utils.snackBar(context, 'Failed',
          'Before Delete Item, please select Products');
      return;
    }
    //   if (deleteCartId != null) {
    //     selectedCartIds.add(deleteCartId);
    //   }
    print(ids);
    loading.value = true;
    Map data = {
      "cart_id": ids.toString(),
      //json.encode(deleteCartId),
      "language_type": "English",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.deletecartApi(data, header).then((value) {
      print("Delete Cart successful");
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == true) {
        print(value.message);
        Get.offAll(() => TabScreen(index: 3));
        setUserList(value);
      } else {
        print(value.message);
      }
      print('deletecart Value ');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("deletecart error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
