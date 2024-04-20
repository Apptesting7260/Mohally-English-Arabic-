// import 'package:get/get.dart';
// import 'package:mohally/data/response/status.dart';
// import 'package:mohally/models/Search_mainCategoryModel/searchMainCategorymodel.dart';
// import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SearchCategories_Controller extends GetxController {
//   final _api = AuthRepository();

//   final rxRequestStatus = Status.LOADING.obs;
//   final userList = Search_MainCategory_Model().obs;
//   RxString error = ''.obs;
//   void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
//   void setUserList(Search_MainCategory_Model value) => userList.value = value;
//   void setError(String value) => error.value = value;
//   RxBool loading = false.obs;
//   void Search_Categories() async {
//     loading.value = true;
//     Map data = {
//       "main_cat_name": "رجال",
//       "language_type": "Arabic",
//     };
//     final sp = await SharedPreferences.getInstance();
//     String token = sp.getString('token').toString();
//     var header = {'Authorization': "Bearer $token"};

//     try {
//       var value = await _api.searchcategoriesApi(data, header);
//       print('API Response: $value');
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//       loading.value = false;
//     } catch (error, stackTrace) {
//       print("=====SearchCategories_Controller======Error======");
//       print(error.toString());
//       print(stackTrace.toString());
//       loading.value = false;
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//     }
//   }
// }
