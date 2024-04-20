
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Home_Banner_Model/home_banner_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBanner_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = HomeBannerModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(HomeBannerModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;
  // RxList<Widget> carouselItems=[].obs;
  RxBool loading = false.obs;
  List<Widget> carouselItems=[];
  void homeBanner_apihit() async {
        final sp = await SharedPreferences.getInstance();
    loading.value = true;
    Map data = {"page_name": "home", "location": "top"};
 var header = {'Authorization': "Bearer ${sp.getString("token")}"};
    _api.homeBannerapi(data, headers: header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;

    }).onError((error, stackTrace) {
      print(error.toString());
      print("======Banner==Error====");
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
