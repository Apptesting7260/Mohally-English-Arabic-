import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CouponModel/couponCodeModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';

class CouponCodeController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final couponlist = CouponCodeModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setaccountdetails(CouponCodeModel value) => couponlist.value = value;
  void setError(String value) => error.value = value;

  final RxBool isLoading = false.obs;

  Future<void> fetchMycouponData() async {
    setRxRequestStatus(Status.LOADING);
    try {
      final couponCodeModel = await _api.CouponCodeApi();
      setaccountdetails(couponCodeModel);
      setRxRequestStatus(Status.COMPLETED);
      print(couponCodeModel);
    } catch (error) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
    }
  }
}
