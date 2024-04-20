import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Remove_Address_Model/remove_address_model.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnglishRemoveAddressController extends GetxController {
  final _api = AuthRepository();
  RxString addressid = ''.obs;

  final rxRequestStatus = Status.LOADING.obs;
  final userList = RemoveAddressModel().obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(RemoveAddressModel value) => userList.value = value;
  void setError(String value) => error.value = value;

  void EnglishremoveAddress_apiHit() async {
    loading.value = true;
    Map data = {
      "addres_id": addressid.value,
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.removeAddressApi(data, header).then((value) {
      print("Delete successful");
      setRxRequestStatus(Status.COMPLETED);

      loading.value = false;
      if (value.message == "Address Successfully Removed") {
        // Clear the addressid after successful deletion
        addressid.value = '';
        // Navigate to the view address screen after successful deletion
        Get.off(ShippingAddress());
      }
    }).onError((error, stackTrace) {
      print("Delete error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
