import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/EnglishDeleteCartModel/English_deleteCartModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? arabicdeleteCartId;

class ArabicDeleteCartCartController extends GetxController {
  final AuthRepository _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = EnglishDeleteCartModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(EnglishDeleteCartModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  RxList selectedCartIds = [].obs;
  void deleteCartApiHit(List ids) async {
    //   if (deleteCartId != null) {
    //     selectedCartIds.add(deleteCartId);
    //   }
    print(ids);
    loading.value = true;
    Map data = {
      "cart_id": ids.toString(),
      //json.encode(deleteCartId),
      "language_type": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.deletecartApi(data, header).then((value) {
      print("Delete Cart successful");
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == true) {
        print(value.message);
        Get.offAll(() => arabic_TabScreen(index: 3));
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
