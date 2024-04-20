import 'package:mohally/Arabic/Arabic_Models/ArabicSearchModel/arabic_SearchModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabic_mensSubcatJacketModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicViewCartModel/Arabic_viewCartModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicSingleviewModel.dart';
import 'package:mohally/Arabic/Arabic_Models/SearchMainCategoryModel/arabicSearchmaincatModel.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/data/network/network_api_services.dart';
import 'package:mohally/models/Add_Remove_Wishlist_Model/add_remove_wishlish_model.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_Add_new_address_model/arabic_add_new%20address_model.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicAddtoCartModel/ArabicaddtocartModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_AllProductViewModel/arabic_allproductViewModel.dart';
import 'package:mohally/models/CancelOrderModel/cancelordermodel.dart';
import 'package:mohally/models/CartProductQtyUpdateModel/cartproductQtyUpdate.dart';
import 'package:mohally/models/CouponCodeApply/applyCouponCodeModel.dart';
import 'package:mohally/models/CouponModel/couponCodeModel.dart';
import 'package:mohally/models/English_Allproductmodel/English_allProductModel.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_deleteCartModel/arabic_DeleteCartModel.dart';
import 'package:mohally/models/ContactUsModel/contactus_model.dart';
import 'package:mohally/models/Create_password_model/create_password_model.dart';
import 'package:mohally/models/DeleteAccount/DeleteAccountModel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicEditaddressmodel/edit_address_arabic_model.dart';
import 'package:mohally/models/OrderDetailsModel/orderDetailsModel.dart';
import 'package:mohally/models/OrderStatusModel/orderstatusModel.dart';
import 'package:mohally/models/PlaceOrderModel/placeorderModel.dart';
import 'package:mohally/models/ProductAddReviewModel/productAddreviewModel.dart';
import 'package:mohally/models/ProductPriceCangeByAttributeModel/ProductpricechangebyAttributeModel.dart';
import 'package:mohally/models/ProductReviewHelpfulModel/productreviewHelpfulModel.dart';
import 'package:mohally/models/ProductViewReviewModel/productviewreviewmodel.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/SubCategoryProductModel.dart';
import 'package:mohally/models/SearchModel/EnglishSearchModel.dart';
import 'package:mohally/models/EnglishAdd_to_cart_Model/EnglishaddtocartModel.dart';
import 'package:mohally/models/EnglishDeleteCartModel/English_deleteCartModel.dart';
import 'package:mohally/models/English_ViewCartModel/english_viewCartModel.dart';
import 'package:mohally/models/Home_Banner_Model/home_banner_model.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicHome_Model/ArabichomeModel.dart';
import 'package:mohally/models/Home_ModelEnglish/homeModel_English.dart';
import 'package:mohally/models/Login_Model/login_model.dart';
import 'package:mohally/models/MensSubCategoryModel/menssubcategoryModel.dart';
import 'package:mohally/models/MyAccount_Model/myAccount_model.dart';
import 'package:mohally/models/Product_Search_By_NameModel/productsearchbynameModel.dart';
import 'package:mohally/models/Remove_Address_Model/remove_address_model.dart';
import 'package:mohally/models/Search_mainCategoryModel/searchMainCategorymodel.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubCatModel.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/models/Singe_Product_ViewModel/single_product_view_model.dart';
import 'package:mohally/models/SubCategories/subcategoriesModel.dart';
import 'package:mohally/models/Update_Profile_Model/update_profile_Modal.dart';
import 'package:mohally/models/User_address_view_Model/user_address_view_model.dart';
import 'package:mohally/models/View_Wishlist_Model/View_wishlistModel.dart';
import 'package:mohally/models/View_Wishlist_Model/view_wishlist_English_Model.dart';
import 'package:mohally/models/privacypolicy_Model/privacy_policy_model.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/models/resetpasswordotp_model/resetpasswordotp_model.dart';
import 'package:mohally/models/user_verify_model/user_verify_model.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();

  Future<SignUpModel> Signupapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.signupapi);
    return SignUpModel.fromJson(response);
  }

  Future<LoginModel> Loginapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginapi);
    return LoginModel.fromJson(response);
  }

  Future<ResetpasswordModel> Resetpasswordapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordapi);
    return ResetpasswordModel.fromJson(response);
  }

  Future<ResetpassOTPModel> ResetpasswordOTPapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordotp);
    return ResetpassOTPModel.fromJson(response);
  }

  Future<CreatepassModel> Createpassapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.createpassword);
    return CreatepassModel.fromJson(response);
  }

  Future<UserVerifyModel> Verifyemailapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.verifyuser);
    return UserVerifyModel.fromJson(response);
  }

  Future<UserVerifyModel> Verifyphoneapi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.verifyuser);
    return UserVerifyModel.fromJson(response);
  }
  // Future<CreatepassModel> Verifyemailotpapi(var data) async{
  //   dynamic response = await _apiService.postApi(data, AppUrl.emailverifyotp);
  //   return CreatepassModel.fromJson(response);
  // }

  Future<UpdateprofileModel> Updateprofile(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.profileupdate);
    return UpdateprofileModel.fromJson(response);
  }

  Future<MyAccountModal> myAccountapi(var data) async {
    dynamic response = await _apiService.getApi(AppUrl.myaccount);

    return MyAccountModal.fromJson(response);
  }

  Future<DeleteAccountModel> deleteAccountapi() async {
    dynamic response = await _apiService.deleteApi(
      AppUrl.deleteMyAccount,
    );
    return DeleteAccountModel.fromJson(response);
  }

  Future<HomeBannerModel> homeBannerapi(var data, {required headers}) async {
    dynamic response = await _apiService.postApi(data, AppUrl.homebannerapi);
    return HomeBannerModel.fromJson(response);
  }

  Future<PrivacypolicyModel> pivacyPolicyApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.privacypolicy);
    return PrivacypolicyModel.fromJson(response);
  }

  Future<HomeModel_Arabic> arabichomepageapi(
      var data, Map<String, String> header) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.homecategoryapi, header);
    return HomeModel_Arabic.fromJson(response);
  }

  // Future<AllProductModel> all_productapi(
  //     var data, Map<String, String> header) async {
  //   dynamic response =
  //       await _apiService.postApi(data, AppUrl.homecategoryapi, header);
  //   return AllProductModel.fromJson(response);
  // }

  Future<HomeModel_English> english_homepageapi(
      var data, Map<String, String> header) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.homecategoryapi, header);
    return HomeModel_English.fromJson(response);
  }

  Future<dynamic> categoriesApi(var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.categorybyname,
    );

    return Arabic_SubCategoryModel.fromJson(response);
  }

  // Future<MensModel> arabicsubcategoriesApi(
  //     var data, Map<String, String> header) async {
  //   dynamic response =
  //       await _apiService.postApi(data, AppUrl.subcategory, header);
  //   return MensModel.fromJson(response);
  // }

  //    Future<SubCategoryModel>englishsubcategoriesApi(var data,Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(data, AppUrl.subcategory,header );
  //   return SubCategoryModel.fromJson(response);
  // }
  Future<dynamic> english_categoriesApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.categorybyname,
    );

    return EnglishSubCategoryModel.fromJson(response);
  }
  // Future<CategoryByNameModel> english_categoriesApi(
  //     var data, Map<String, String> header) async {
  //   dynamic response =
  //       await _apiService.postApi(data, AppUrl.categorybyname, header);
  //   return CategoryByNameModel.fromJson(response);
  // }

  // Future<Search_MainCategory_Model> searchcategoriesApi(
  //     var data, Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(
  //     data,
  //     AppUrl.searchMainCategory,
  //   );
  //   return Search_MainCategory_Model.fromJson(response);
  // }

  Future<Search_MainCategory_Model> EnglishsearchcategoriesApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.searchMainCategory,
    );
    return Search_MainCategory_Model.fromJson(response);
  }

  Future<ArabicSearch_MainCategory_Model> ArabicsearchcategoriesApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.searchMainCategory,
    );
    return ArabicSearch_MainCategory_Model.fromJson(response);
  }

  Future<Add_new_Address_Arabic_Model> arabic_addnewaddressApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.addnewaddress,
    );
    return Add_new_Address_Arabic_Model.fromJson(response);
  }

  Future<EditAddressModel> arabic_editnewaddress(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.editaddress,
    );
    return EditAddressModel.fromJson(response);
  }

  Future<UserAddressViewModel> userAddressviewApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.addressview,
    );
    return UserAddressViewModel.fromJson(response);
  }

  Future<RemoveAddressModel> removeAddressApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.removeaddress,
    );
    return RemoveAddressModel.fromJson(response);
  }

  Future<dynamic> SingleproductviewApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.singleProdectView,
    );

    return ArabicSingleProductViewModel.fromJson(response);
  }

  Future<dynamic> EnglishSingleproductviewApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.singleProdectView,
    );
    return SingleProductViewModel.fromJson(response);
  }

  error(dynamic response) {
    print("hited 174");
    print(mainCatId.runtimeType);
    print(mainCatId.toString());
    // MensShoesModel.fromJson(response);
  }

  Future<dynamic> arabic_allproductview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.singleProdectView,
    );
    print(response);

    //return MensApparelModel.fromJson(response);

    return ArabicSingleProductViewModel.fromJson(response);
  }

  // Future<dynamic> English_allproductview(
  //     var data, Map<String, String> header) async {
  //   dynamic response =
  //       await _apiService.postApi(data, AppUrl.singleProdectView);
  //   print(response);

  //   //return MensApparelModel.fromJson(response);

  //   switch (engallmainCatId) {
  //     case "153":
  //       return ShirtAndTopsModel.fromJson(response);
  //     case "154":
  //       return BottomsModel.fromJson(response);
  //     case "155":
  //       return JacketandOutwearModel.fromJson(response);
  //     case "156":
  //       return ActiveWearModel.fromJson(response);

  //     case "157":
  //       return FormalModel.fromJson(response);

  //     case "174":
  //       return MensShoesModel.fromJson(response);
  //     case "166":
  //       return SmartPhoneModel.fromJson(response);

  //     case "170":
  //       return LaptopsModel.fromJson(response);
  //     case "171":
  //       return HeadphonesAudioModel.fromJson(response);
  //     case "172":
  //       return CameraModel.fromJson(response);
  //     case "173":
  //       return WearableModel.fromJson(response);
  //     //  return HealthandWellnessModel.fromJson(response);
  //     default:
  //       throw Exception('Unexpected condition');
  //   }
  // }

  Future<ProductSearchByNameModel> ProductSearchbyNameApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productSearchbyNameApi,
    );
    print(response);
    return ProductSearchByNameModel.fromJson(response);
  }

  Future<Add_Remove_WishlistModel> AddRemoveWishlistApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.addremoveWishlistApi,
    );
    print(response);
    return Add_Remove_WishlistModel.fromJson(response);
  }

  Future<WishlistViewModel> ViewWishlistApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.wishlistViewApi,
    );
    print(response);
    return WishlistViewModel.fromJson(response);
  }

  Future<English_WishlistViewModel> EnglishViewWishlistApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.wishlistViewApi,
    );
    print(response);
    return English_WishlistViewModel.fromJson(response);
  }

  Future<MensSubCategoryModel> MensSubCategoryApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.seeAllMens,
    );
    print(response);
    return MensSubCategoryModel.fromJson(response);
  }

  Future<ContactUsModel> contactusApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.contactUs,
    );
    print(response);
    return ContactUsModel.fromJson(response);
  }

  Future<EnglishAddtoCartModel> AddtocartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.Addtocart,
    );
    print(response);
    return EnglishAddtoCartModel.fromJson(response);
  }

  Future<EnglishViewcartModel> viewcartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.viewcart,
    );
    print(response);
    return EnglishViewcartModel.fromJson(response);
  }

  Future<EnglishDeleteCartModel> deletecartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.deletecart,
    );
    print(response);
    return EnglishDeleteCartModel.fromJson(response);
  }

  Future<ArabicAddtoCartModel> arabic_AddtocartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.Addtocart,
    );
    print(response);
    return ArabicAddtoCartModel.fromJson(response);
  }

  Future<ArabicViewcartModel> arabic_viewcartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.viewcart,
    );
    print(response);
    return ArabicViewcartModel.fromJson(response);
  }

  Future<ArabicDeleteCartModel> arabic_deletecartApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.deletecart,
    );
    print(response);
    return ArabicDeleteCartModel.fromJson(response);
  }

  Future<EnglishAllProductViewModel> English_allcategoryproductview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.allproduct,
    );
    print(response);
    return EnglishAllProductViewModel.fromJson(response);
  }

  Future<arabicAllProductViewModel> arabic_allcategoryproductview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.allproduct,
    );
    print(response);
    return arabicAllProductViewModel.fromJson(response);
  }
  // Future<CouponCodeModel> CouponCodeApi(var data) async {
  //   dynamic response = await _apiService.getApi(AppUrl.couponcode);

  //   return CouponCodeModel.fromJson(response);
  // }
  Future<CouponCodeModel> CouponCodeApi() async {
    dynamic response = await _apiService.getApi(AppUrl.couponcode);
    return CouponCodeModel.fromJson(response);
  }

  Future<CouponCodeApplyModel> CouponCodeApplyApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.couponcodeapply,
    );
    print(response);
    return CouponCodeApplyModel.fromJson(response);
  }

  Future<dynamic> ProductByCatListApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );

    return SubCategoryProducts.fromJson(response);
  }

  // Future<MensAllProductModel> EngAllProductOfMens(
  //     var data, Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(
  //     data,
  //     AppUrl.productbycatlist,
  //   );
  //   print(response);
  //   return MensAllProductModel.fromJson(response);
  // }

  // Future<ElectronicsAllProductsModel> EngAllProductOfElectronics(
  //     var data, Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(
  //     data,
  //     AppUrl.productbycatlist,
  //   );
  //   print(response);
  //   return ElectronicsAllProductsModel.fromJson(response);
  // }

  // Future<WomensAllProductModel> EngAllProductOfWomens(
  //     var data, Map<String, String> header) async {
  //   dynamic response = await _apiService.postApi(
  //     data,
  //     AppUrl.productbycatlist,
  //   );
  //   print(response);
  //   return WomensAllProductModel.fromJson(response);
  // }

  Future<CartProductQtyUpdateModel> CartProductQtyUpdateApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.cartProductQtyUpdate,
    );
    print(response);
    return CartProductQtyUpdateModel.fromJson(response);
  }

  Future<dynamic> arabicProductByCatListApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productbycatlist,
    );

    return ArabicSubCategoryProductsModel.fromJson(response);
  }

  Future<PlaceOrderModel> PlaceOrderApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.placeorder,
    );
    print(response);
    return PlaceOrderModel.fromJson(response);
  }

  Future<OrderStatusModel> OrderStatusApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.orderstatus,
    );
    print(response);
    return OrderStatusModel.fromJson(response);
  }

  Future<SearchModel> ProductSearchByNameApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productSearchbyNameApi,
    );
    print(response);
    return SearchModel.fromJson(response);
  }

  Future<ArabicSeachModel> ArabicProductSearchByNameApi(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productSearchbyNameApi,
    );
    print(response);
    return ArabicSeachModel.fromJson(response);
  }

  Future<ProductReviewHelpfulModel> ProductReviewHelpful(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productreviewhelpful,
    );
    print(response);
    return ProductReviewHelpfulModel.fromJson(response);
  }

  Future<ProductPriceChangeByAttributeModel> ProductPriceChangeByAttribute(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productpricechangebyattribute,
    );
    print(response);
    return ProductPriceChangeByAttributeModel.fromJson(response);
  }

  Future<ProductViewReviewModel> ProductviewReview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productviewreview,
    );
    print(response);
    return ProductViewReviewModel.fromJson(response);
  }

  Future<ProductAddReviewModel> ProductAddReview(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.productaddreview,
    );
    print(response);
    return ProductAddReviewModel.fromJson(response);
  }

  Future<CancelOrderModel> CancelOrder(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.usercancelorder,
    );
    print(response);
    return CancelOrderModel.fromJson(response);
  }

  Future<CancelOrderModel> Reorder(var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.reorder,
    );
    print(response);
    return CancelOrderModel.fromJson(response);
  }

  Future<OrderDetailsModel> OrderDetails(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.orderDetails,
    );
    print(response);
    return OrderDetailsModel.fromJson(response);
  }

  Future<OrderDetailsModel> arabicOrderDetails(
      var data, Map<String, String> header) async {
    dynamic response = await _apiService.postApi(
      data,
      AppUrl.orderDetails,
    );
    print(response);
    return OrderDetailsModel.fromJson(response);
  }
}
