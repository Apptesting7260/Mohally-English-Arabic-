// // ignore_for_file: unused_import
// import 'dart:async';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
// import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
// import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
// import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
// import 'package:mohally/core/utils/Utils_2.dart';
// import 'package:mohally/data/response/status.dart';
// import 'package:mohally/models/Singe_Product_ViewModel/Home_living_view_model/home_living_view_Model.dart';
// import 'package:mohally/presentation/category_page/category_screen.dart';
// import 'package:mohally/presentation/category_page/widgets/SubCategoriesMens.dart';
// import 'package:mohally/presentation/category_page/widgets/subCategories_Womens.dart';
// import 'package:mohally/presentation/category_page/widgets/subcategories_ElectronicScreen.dart';
// import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
// import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/AudioSingleViewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/CameraSingleviewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/LaptopsSingleviewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/SmartPhonesSingleViewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/ElectronicsSingleViewScreen/WearableSingleviewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ActivewearSingleViewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/Bottoms_single_view.dart';
// import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/JacketandOutwearSingleViewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/MensShoesSingleviewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/SuitsandFormalsSingleVoewScreen.dart';
// import 'package:mohally/presentation/single_page_screen/MensSingleViewScreen/ShirtAndTopsSingleView.dart';
// import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensDressSingleView.dart';
// import 'package:mohally/presentation/single_page_screen/WomensSingleProductViewScreen/WomensTopsSingleViewScreen.dart';
// import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
// import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
// import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
// import 'package:mohally/view_models/controller/Cart/ProductQtyUpdateController/cartproductqtyUpdateController.dart';
// import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
// import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
// import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
// import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
// import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerPage2.dart';
// import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
// import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
// import 'package:mohally/widgets/custom_elevated_button.dart';
// import 'package:mohally/widgets/custom_icon_button.dart';
// import 'package:mohally/widgets/custom_outlined_button.dart';
// import 'package:mohally/widgets/custom_rating_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../widgets/homepagesection_item_widget.dart';
// import '../widgets/recommendedsection_item_widget.dart';
// import '../widgets/shippingsection_item_widget.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:mohally/core/app_export.dart';

// String? sizeid;
// String? colorId;
// String? color;
// String? size1;
// // String? mainCatId;

// class HomePageMensSectionView extends StatefulWidget {
//   const HomePageMensSectionView({
//     Key? key,
//   }) : super(
//           key: key,
//         );
//   @override
//   HomePageMensSectionViewState createState() => HomePageMensSectionViewState();
// }

// class HomePageMensSectionViewState extends State<HomePageMensSectionView>
//     with AutomaticKeepAliveClientMixin<HomePageMensSectionView> {
//   RxString selectedcolored = "".obs;
//   RxInt selectedcolorIndex = 0.obs;
//   RxInt selectedSizeIndex = 0.obs;
//   List<bool> tappedList = List.generate(200, (index) => false);
//   final AddToCartcontrollerin = Get.put(AddToCartcontroller());
//   EnglishViewCart _viewcartcontroller = EnglishViewCart();

//   RxInt selectedImageIndex = 0.obs;
//   RxString selectedImageUrl = ''.obs;
//   EnglishSingleProductViewController productviewcontroller =
//       EnglishSingleProductViewController();

//   int selectedIndex = 0;

//   EnglishSingleProductViewController _productview =
//       EnglishSingleProductViewController();
//   bool isProductAddedToWishlist = false;
//   List<bool> isButtonTappedList = List.generate(200, (index) => false);
//   bool isButtonTapped = false;

//   EnglishSingleProductViewController singleProductViewController =
//       EnglishSingleProductViewController();
//   HomeViewPage2_controller_English homeView_controller =
//       HomeViewPage2_controller_English();
//   HomeBanner_controller homeBanner_controller = HomeBanner_controller();
//   EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =
//       EnglishAdd_remove_wishlistController();

//   List<Widget> carouselItems = [
//     //  Image.network(homeBanner_controller.userList.value.homeBanner!.bannerUrl![0].s0.toString()),
//     Image.asset("assets/images/banner 1.png"),
//     Image.asset("assets/images/banner 1.png")
//   ];
//   int counter = 1;
//   @override
//   void initState() {
//     super.initState();
//     homeBanner_controller.homeBanner_apihit();
//     homeView_controller.homeview_apihit();

//     // loadStatus();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   bool get wantKeepAlive => true;
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     mediaQueryData = MediaQuery.of(context);
//     return Obx(() {
//       if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       } else if (homeView_controller.rxRequestStatus.value == Status.ERROR) {
//         return Scaffold(
//             body: Center(
//                 child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/error2.png',
//             ),
//             Text(
//               "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//               style: theme.textTheme.headlineMedium
//                   ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//             ),
//           ],
//         )));
//       } else {
//         return Scaffold(
//           body: SafeArea(
//             child: Container(
//               height: Get.height,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     homeView_controller.userList.value.categoryData == null ||
//                             homeView_controller
//                                     .userList.value.categoryData?.length ==
//                                 0
//                         ? Center(
//                             child: Padding(
//                             padding: const EdgeInsets.only(top: 150),
//                             child: Column(
//                               children: [
//                                 Image.asset(
//                                   'assets/images/no_product.png',
//                                   color: Color(0xffff8300),
//                                 ),
//                                 SizedBox(
//                                   height: Get.height * .03,
//                                 ),
//                                 Text(
//                                   "Page Not Found",
//                                   style: theme.textTheme.headlineSmall
//                                       ?.copyWith(
//                                           fontWeight: FontWeight.normal,
//                                           fontSize: 18),
//                                 ),
//                               ],
//                             ),
//                           ))
//                         : Padding(
//                             padding: const EdgeInsets.only(right: 10, left: 10),
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 mainAxisExtent: Get.height * .2,
//                                 crossAxisCount: 4,
//                                 mainAxisSpacing: 17.h,
//                                 crossAxisSpacing: 15.h,
//                               ),
//                               physics: BouncingScrollPhysics(),
//                               itemCount: homeView_controller
//                                       .userList.value.categoryData?.length ??
//                                   0,
//                               // homeView_controller
//                               //     .userList.value.categoryData?.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         mainCatId = homeView_controller.userList
//                                             .value.categoryData?[index].id!
//                                             .toString();

//                                         setState(() {
//                                           EnglishsubMainCatId = mainCatId;
//                                         });
//                                         print("$EnglishsubMainCatId==");
//                                         if (mainCatId == "133") {
//                                           Get.to(subcategory_MensScreen());
//                                         } else if (mainCatId == "134") {
//                                           Get.to(
//                                               subcategoryElectronicsScreen());
//                                         } else if (mainCatId == "175") {
//                                           Get.to(subcategoryWomensScreen());
//                                         } else if (mainCatId == "136") {
//                                         } else {
//                                           NoProductFound();
//                                         }
//                                       },
//                                       child: ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(38.0),
//                                         child: Image.network(
//                                           "${homeView_controller.userList.value.categoryData?[index].imageUrl.toString()}",
//                                           height: 68,
//                                           width: 68,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(height: 5.v),
//                                     Align(
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                           "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
//                                           style: TextStyle(
//                                             color: Color(0xFF272727),
//                                             fontSize: 12,
//                                             fontFamily: 'Almarai',
//                                             fontWeight: FontWeight.w500,
//                                           )
//                                           // theme.textTheme.bodySmall,
//                                           // overflow: TextOverflow.ellipsis,
//                                           // maxLines: 1,
//                                           ),
//                                     )
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                     SizedBox(height: 20.v),
//                     _buildHomePageSection(context),
//                     SizedBox(height: 10.v),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     });
//   }

//   /// Section Widget
//   Widget _buildShippingSection(BuildContext context) {
//     return SizedBox(
//       height: 60.v,
//       child: ListView.separated(
//         padding: EdgeInsets.only(right: 20.h),
//         scrollDirection: Axis.horizontal,
//         separatorBuilder: (
//           context,
//           index,
//         ) {
//           return SizedBox(
//             width: 15.h,
//           );
//         },
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return ShippingsectionItemWidget();
//         },
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildCategorySection(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 15, left: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Categories",
//             style: theme.textTheme.titleMedium,
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 2.v),
//             child: GestureDetector(
//               onTap: () {
//                 Get.to(Get.to(CategoryScreen()));
//               },
//               child: Text(
//                 "See All",
//                 style: CustomTextStyles.bodyMediumPrimary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildHomePageSection(BuildContext context) {
//     //  super.build(context);
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: GridView.builder(
//         shrinkWrap: true,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisExtent: Get.height * .4,
//           crossAxisCount: 2,
//           // mainAxisSpacing: 2,
//           crossAxisSpacing: 10.h,
//         ),
//         physics: BouncingScrollPhysics(),
//         itemCount:
//             homeView_controller.userList.value.recommendedProduct?.length,
//         itemBuilder: (context, index) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: Get.width, padding: EdgeInsets.only(left: 10),
//                 //    width: 170.adaptSize,
//                 child: Stack(
//                   alignment: Alignment.topRight,
//                   children: [
//                     CustomImageView(
//                       onTap: () {
//                         mainCatId = homeView_controller.userList.value
//                             .recommendedProduct?[index].mainCategoryId!
//                             .toString();
//                         String? productId = homeView_controller
//                             .userList.value.recommendedProduct?[index].id!
//                             .toString();

//                         setState(() {
//                           Englishproductid = productId;
//                           EnglishMainCatId = mainCatId;
//                         });
//                         print("$Englishproductid==");
//                         if (mainCatId == "153") {
//                           Get.to(ShirtsandTopsSingleView());
//                           print(
//                               "$mainCatId===========Mens Appearl main category id ");
//                         } else if (mainCatId == "154") {
//                           Get.to(SinglePageScreen_Bottoms());
//                         } else if (mainCatId == "155") {
//                           Get.to(SinglePageScreen_mens_Jacket());
//                         } else if (mainCatId == "156") {
//                           Get.to(SinglePageScreen_mens_activewear());
//                         } else if (mainCatId == "157") {
//                           Get.to(SinglePageScreen_Mens_Formals());
//                         } else if (mainCatId == "174") {
//                           Get.to(SinglePageScreen_Mens_Shoes());
//                         } else if (mainCatId == "166") {
//                           Get.to(SinglePageScreen_Electronics_Smartphones());
//                         } else if (mainCatId == "170") {
//                           Get.to(SinglePageScreen_Electronics_Laptops());
//                         } else if (mainCatId == "171") {
//                           Get.to(
//                               SinglePageScreen_Electronics_AudioHeadphones());
//                         } else if (mainCatId == "172") {
//                           Get.to(SinglePageScreen_Electronics_Camera());
//                         } else if (mainCatId == "173") {
//                           Get.to(SinglePageScreen_Electronics_wearable());
//                         } else if (mainCatId == "176") {
//                           Get.to(Womens_Dress_SingleView());
//                         } else if (mainCatId == "177") {
//                           Get.to(Womens_Tops_SingleView());
//                         } else {
//                           print('not found ');
//                         }
//                       },
//                       fit: BoxFit.cover,
//                       imagePath:
//                           "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
//                       // ImageConstant.imgRectangle569,
//                       height: 190.adaptSize,
//                       width: 190.adaptSize,
//                       radius: BorderRadius.circular(
//                         10.h,
//                       ),
//                       alignment: Alignment.center,
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(
//                           top: 10.v,
//                           right: 10.h,
//                         ),
//                         child: CustomIconButton(
//                           onTap: () {
//                             Add_remove_productidd = homeView_controller
//                                 .userList.value.recommendedProduct![index].id!
//                                 .toString();
//                             EnglishAdd_remove_wishlistController()
//                                 .AddRemoveWishlish_apihit();

//                             setState(() {
//                               isButtonTappedList[index] =
//                                   !isButtonTappedList[index];
//                             });
//                           },
//                           height: 20.adaptSize,
//                           width: 20.adaptSize,
//                           padding: EdgeInsets.all(5.h),
//                           decoration: IconButtonStyleHelper.fillWhiteA,
//                           alignment: Alignment.topRight,
//                           child: CustomImageView(
//                             imagePath: isButtonTappedList[index]
//                                 ? ImageConstant
//                                     .imgGroup239531 // Change this to your tapped image
//                                 : ImageConstant.imgSearch, // Default image
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 12.v),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Container(
//                   height: 16.v,
//                   width: 48.h,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Color.fromARGB(71, 228, 193, 204),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "10% Off",
//                       style: TextStyle(
//                         fontSize: 8, color: Color(0xffff8300),
//                         fontWeight: FontWeight.w600,
//                         // fontFamily: 'Almarai'
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 5.v),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: SizedBox(
//                   width: 131.h,
//                   child: Text(
//                     "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
//                     //  "Luxury Rhinestone Quartz Watch Ladies Rome...",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.labelLarge!.copyWith(
//                       height: 1.33,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 3.v),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Align(
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
//                                 // "4.8",
//                                 style: theme.textTheme.labelMedium,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 3.h),
//                                 child: CustomRatingBar(
//                                   ignoreGestures: true,
//                                   initialRating: homeView_controller
//                                       .userList
//                                       .value
//                                       .recommendedProduct?[index]
//                                       .averageRating
//                                       ?.toDouble(),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 5.v),
//                         RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text:
//                                     "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
//                                 //"99 ",
//                                 style: CustomTextStyles.titleMediumPrimary_2,
//                               ),
//                               TextSpan(
//                                 text: "2k+ sold",
//                                 style: theme.textTheme.bodySmall,
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: 35.h,
//                         top: 5.v,
//                       ),
//                       child: CustomIconButton(
//                           height: 30.adaptSize,
//                           width: 30.adaptSize,
//                           padding: EdgeInsets.all(6.h),
//                           child: CustomImageView(
//                             imagePath: ImageConstant.imgGroup239533,
//                             onTap: () {
//                               mainCatId = homeView_controller.userList.value
//                                   .recommendedProduct?[index].mainCategoryId
//                                   .toString();
//                               String? productId = homeView_controller
//                                   .userList.value.recommendedProduct?[index].id
//                                   ?.toString();

//                               setState(() {
//                                 mainCatId;
//                                 productId;
//                                 Englishproductid = productId;
//                                 EnglishMainCatId = mainCatId;
//                               });

//                               if (mainCatId == "153") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartmensShirt(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "154") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartmensBottoms(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "155") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartmensJacket(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "156") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartmensActiveWear(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "157") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartmensFormals(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "174") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartmensShoes_view(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "166") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartelectronicsPhone(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "170") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartelectronicsLaptop(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "171") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartelectronicsHeadphones(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "172") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartelectronicsCamera(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "173") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartelectronicsWarable(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "176") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartWomensDress(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               } else if (mainCatId == "177") {
//                                 productviewcontroller.Single_ProductApiHit(
//                                     context);
//                                 Timer(Duration(seconds: 2), () {
//                                   if (productviewcontroller
//                                           .rxRequestStatus.value ==
//                                       Status.COMPLETED) {
//                                     showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         builder: (context) {
//                                           return _buildAddtocartwomensTop(
//                                               context, mainCatId, productId);
//                                         });
//                                   }
//                                 });
//                               }
//                               print(mainCatId.toString());
//                             },
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildAddtocartmensShirt(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.ShirtandTops_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.ShirtandTops_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.ShirtandTops_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.ShirtandTops_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .ShirtandTops_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .ShirtandTops_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .ShirtandTops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .ShirtandTops_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .ShirtandTops_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .ShirtandTops_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .ShirtandTops_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .ShirtandTops_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.ShirtandTops_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .ShirtandTops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .ShirtandTops_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .ShirtandTops_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .ShirtandTops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .ShirtandTops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .ShirtandTops_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .ShirtandTops_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartmensJacket(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.jacket_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.jacket_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.jacket_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.jacket_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .jacket_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .jacket_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .jacket_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .jacket_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .jacket_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller.jacket_userlist
//                                       .value.productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .jacket_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .jacket_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.jacket_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .jacket_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .jacket_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .jacket_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .jacket_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .jacket_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .jacket_userlist.value.productView?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .jacket_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartmensActiveWear(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.activewear_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.activewear_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.activewear_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.activewear_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .activewear_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .activewear_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .activewear_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .activewear_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .activewear_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .activewear_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .activewear_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .activewear_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.activewear_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .activewear_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .activewear_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .activewear_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .activewear_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .activewear_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .activewear_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .activewear_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartmensFormals(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.formal_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.formal_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.formal_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.formal_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             color = productviewcontroller
//                                 .formal_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .formal_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .formal_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .formal_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .formal_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller.formal_userlist
//                                       .value.productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .formal_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .formal_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.formal_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .formal_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .formal_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .formal_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .formal_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .formal_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .formal_userlist.value.productView?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .formal_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartelectronicsWarable(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.formal_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.wearable_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.wearable_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.wearable_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.wearable_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .wearable_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .wearable_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .wearable_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .wearable_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .wearable_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller.wearable_userlist
//                                       .value.productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .wearable_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             size1 = productviewcontroller
//                                 .wearable_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Model;
//                             // var size2 = productviewcontroller.wearable_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .wearable_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .wearable_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Model ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 // sizeid = productviewcontroller
//                                                 //     .wearable_userlist
//                                                 //     .value
//                                                 //     .productView
//                                                 //     ?.productDetails
//                                                 //     ?.details?[index]
//                                                 //     .SizeId
//                                                 //     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .wearable_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .wearable_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .wearable_userlist.value.productView?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .wearable_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartelectronicsPhone(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.smartphone_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.smartphone_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.smartphone_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.smartphone_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .smartphone_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .smartphone_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .smartphone_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .smartphone_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .smartphone_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .smartphone_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .smartphone_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .smartphone_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Model;
//                             // var size2 = productviewcontroller.smartphone_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .smartphone_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .smartphone_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Model ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 // sizeid = productviewcontroller
//                                                 //     .smartphone_userlist
//                                                 //     .value
//                                                 //     .productView
//                                                 //     ?.productDetails
//                                                 //     ?.details?[index]
//                                                 //     .SizeId
//                                                 //     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .smartphone_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .smartphone_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .smartphone_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .smartphone_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartelectronicsCamera(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.camera_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.camera_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.camera_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.camera_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .camera_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .camera_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .camera_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .camera_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .camera_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller.camera_userlist
//                                       .value.productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .camera_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .camera_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Model;
//                             // var size2 = productviewcontroller.camera_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .camera_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .camera_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Model ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 // sizeid = productviewcontroller
//                                                 //     .camera_userlist
//                                                 //     .value
//                                                 //     .productView
//                                                 //     ?.productDetails
//                                                 //     ?.details?[index]
//                                                 //     .SizeId
//                                                 //     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .camera_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .camera_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .camera_userlist.value.productView?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .camera_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartelectronicsHeadphones(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.headphones_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.headphones_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.headphones_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.headphones_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .headphones_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .headphones_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .headphones_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .headphones_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .headphones_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .headphones_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .headphones_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .headphones_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Model;
//                             // var size2 = productviewcontroller.headphones_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .headphones_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .headphones_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Model ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 // sizeid = productviewcontroller
//                                                 //     .headphones_userlist
//                                                 //     .value
//                                                 //     .productView
//                                                 //     ?.productDetails
//                                                 //     ?.details?[index]
//                                                 //     .SizeId
//                                                 //     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .headphones_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .headphones_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .headphones_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .headphones_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartelectronicsLaptop(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.headphones_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.laptops_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.laptops_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.laptops_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.laptops_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .laptops_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .laptops_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .laptops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .laptops_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .laptops_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller.laptops_userlist
//                                       .value.productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .laptops_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .laptops_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.laptops_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .laptops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .laptops_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .laptops_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .laptops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .laptops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .laptops_userlist.value.productView?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .laptops_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartmensBottoms(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.Bottom_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.Bottom_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.Bottom_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.Bottom_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .Bottom_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .Bottom_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .Bottom_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .Bottom_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .Bottom_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller.Bottom_userlist
//                                       .value.productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .Bottom_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .Bottom_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.Bottom_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .Bottom_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .Bottom_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .Bottom_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .Bottom_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .Bottom_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .Bottom_userlist.value.productView?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .Bottom_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartmensShoes_view(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.mensshoes_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.mensshoes_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.mensshoes_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.mensshoes_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var color = productviewcontroller
//                                 .mensshoes_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .mensshoes_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .mensshoes_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .mensshoes_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .mensshoes_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .mensshoes_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .mensshoes_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             var size1 = productviewcontroller
//                                 .mensshoes_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.mensshoes_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .mensshoes_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .mensshoes_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .mensshoes_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     tappedList[index] = !tappedList[
//                                         index]; // Toggle tapped state for this item
//                                   });
//                                   if (tappedList[index]) {
//                                     if (color != null && size1 != null) {
//                                       if (sizeid != null && colorId != null) {
//                                         Englishcartproductid =
//                                             productviewcontroller
//                                                 .mensshoes_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.id
//                                                 .toString();
//                                         EnglishAddtocartColor =
//                                             colorId.toString();
//                                         EnglishAddtocartprice =
//                                             productviewcontroller
//                                                 .mensshoes_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details?[index]
//                                                 .price
//                                                 .toString();
//                                         EnglishAddtocartSize =
//                                             sizeid.toString();
//                                         // AddToCartcontroller().loading.value = true;
//                                         AddToCartcontrollerin.addtocart_Apihit(
//                                             context);
//                                       } else {
//                                         if (sizeid == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select size');
//                                         } else if (colorId == null) {
//                                           Utils.snackBar(context, 'Failed',
//                                               'Please select color');
//                                         }
//                                       }
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .mensshoes_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .mensshoes_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     // AddToCartcontroller().loading.value = true;
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     // width: Get.width * .4,
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color:
//                                               // tappedList[index]
//                                               // ?
//                                               Colors.orange,
//                                           // : Colors.black,
//                                           width: 2,
//                                         ),
//                                         color:
//                                             //tappedList[index]
//                                             //?
//                                             Colors.orange
//                                         // : Colors.transparent,
//                                         ),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               // tappedList[index]
//                                               // ?
//                                               "Add to cart",
//                                               // : "Already in cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color:
//                                                       // tappedList[index]
//                                                       //  ?
//                                                       Colors.white
//                                                   // : Colors.black,
//                                                   ),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   /// Common widget
//   Widget _buildWidget(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CustomImageView(
//           imagePath: ImageConstant.imgEllipse1,
//           height: 60.adaptSize,
//           width: 60.adaptSize,
//           radius: BorderRadius.circular(
//             30.h,
//           ),
//         ),
//         CustomImageView(
//           imagePath: ImageConstant.imgMaskGroup60x56,
//           height: 60.v,
//           width: 56.h,
//         ),
//         CustomImageView(
//           imagePath: ImageConstant.imgEllipse3,
//           height: 60.adaptSize,
//           width: 60.adaptSize,
//           radius: BorderRadius.circular(
//             30.h,
//           ),
//         ),
//         CustomImageView(
//           imagePath: ImageConstant.imgEllipse4,
//           height: 60.adaptSize,
//           width: 60.adaptSize,
//           radius: BorderRadius.circular(
//             30.h,
//           ),
//         ),
//       ],
//     );
//   }

//   /// Common widget
//   Widget _buildElectronics(
//     BuildContext context, {
//     required String electronicsText,
//     required String womenSClothingText,
//     required String menSClothingText,
//     required String curvePlusText,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: 19.v),
//           child: Text(
//             electronicsText,
//             style: theme.textTheme.labelLarge!.copyWith(
//               color: appTheme.gray90001,
//             ),
//           ),
//         ),
//         Spacer(
//           flex: 33,
//         ),
//         SizedBox(
//           width: 45.h,
//           child: Text(
//             womenSClothingText,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//             style: theme.textTheme.labelLarge!.copyWith(
//               color: appTheme.gray90001,
//               height: 1.33,
//             ),
//           ),
//         ),
//         Spacer(
//           flex: 37,
//         ),
//         SizedBox(
//           width: 43.h,
//           child: Text(
//             menSClothingText,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//             style: theme.textTheme.labelLarge!.copyWith(
//               color: appTheme.gray90001,
//               height: 1.33,
//             ),
//           ),
//         ),
//         Spacer(
//           flex: 28,
//         ),
//         Padding(
//           padding: EdgeInsets.only(bottom: 19.v),
//           child: Text(
//             curvePlusText,
//             style: theme.textTheme.labelLarge!.copyWith(
//               color: appTheme.gray90001,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _navigateaftertapped(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 4:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 5:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 6:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 7:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       case 8:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => NoProductFound02()),
//         );
//         break;
//       // Add more cases for other indices and screens
//       // ...
//     }
//   }

//   // Widget _buildsize(BuildContext context) {
//   //   return Container(
//   //     height: Get.height * .15,
//   //     child: ListView.builder(
//   //       itemCount: 1,
//   //       itemBuilder: (BuildContext context, int index) {
//   //         var size1 = productviewcontroller.userList.value.productView
//   //             ?.productDetails?.details?[index].Clothssize;
//   //         // var size2 = productviewcontroller.userList.value
//   //         //     .productView?.productDetails?.details?[index].Size;
//   //         if (size1 == null) {
//   //           return Text('');
//   //         }
//   //         return Column(
//   //           children: [
//   //             SizedBox(height: 27.v),
//   //             _buildRowSize(context),
//   //             SizedBox(height: 11.v),
//   //             Padding(
//   //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//   //               child: Align(
//   //                 alignment: Alignment.centerRight,
//   //                 child: SizedBox(
//   //                   height: 35.v,
//   //                   child: ListView.separated(
//   //                     padding: EdgeInsets.only(left: 20.h),
//   //                     scrollDirection: Axis.horizontal,
//   //                     separatorBuilder: (
//   //                       context,
//   //                       index,
//   //                     ) {
//   //                       return SizedBox(
//   //                         width: 10.h,
//   //                       );
//   //                     },
//   //                     itemCount: productviewcontroller
//   //                             .home_living_userlist
//   //                             .value
//   //                             .productView
//   //                             ?.productDetails
//   //                             ?.details!
//   //                             .length ??
//   //                         0,
//   //                     itemBuilder: (context, index) {
//   //                       if (index < 0 ||
//   //                           index >=
//   //                               (productviewcontroller
//   //                                       .home_living_userlist
//   //                                       .value
//   //                                       .productView!
//   //                                       .productDetails
//   //                                       ?.details!
//   //                                       .length ??
//   //                                   0)) {
//   //                         // Check if index is out of bounds
//   //                         return Container(); // Return an empty container or any other widget as needed
//   //                       }

//   //                       bool isSelected = index == selectedIndex;
//   //                       return SizedBox(
//   //                         width: 70.h,
//   //                         child: GestureDetector(
//   //                           onTap: () {
//   //                             setState(() {
//   //                               selectedIndex = index;
//   //                             });
//   //                           },
//   //                           child: Align(
//   //                             alignment: Alignment.centerRight,
//   //                             child: Container(
//   //                               width: 70.0, // Adjust this width as needed
//   //                               padding: EdgeInsets.symmetric(
//   //                                 horizontal:
//   //                                     17.0, // Adjust this padding as needed
//   //                                 vertical:
//   //                                     8.0, // Adjust this padding as needed
//   //                               ),
//   //                               decoration: BoxDecoration(
//   //                                 color: isSelected
//   //                                     ? Color(0xffff8300)
//   //                                     : Colors.grey[10003],
//   //                                 border: Border.all(
//   //                                     color: isSelected
//   //                                         ? Color(0xffff8300)
//   //                                         : Colors.black),
//   //                                 borderRadius: BorderRadius.circular(20.0),
//   //                               ),
//   //                               child: Center(
//   //                                 child: Text(
//   //                                   '$size1',
//   //                                   style: TextStyle(
//   //                                     color: isSelected
//   //                                         ? Colors.white
//   //                                         : Colors.black,
//   //                                     fontSize: 10.0,
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           ),
//   //                         ),
//   //                       );
//   //                     },
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             // SizedBox(height: 27.v),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }

//   Widget _buildAddToCart(BuildContext context) {
//     return Container(
//       height: Get.height * .1,
//       child: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (BuildContext context, int index) {
//           return CustomOutlinedButton(
//             text: "Add to Cart",
//             margin: EdgeInsets.symmetric(horizontal: 30.h),
//             buttonStyle: CustomButtonStyles.outlinePrimaryTL25,
//             buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
//             alignment: Alignment.center,
//             onPressed: () {
//               Englishcartproductid = productviewcontroller
//                   .mensshoes_userlist.value.productView?.id
//                   .toString();
//               EnglishAddtocartColor = productviewcontroller.mensshoes_userlist
//                   .value.productView?.productDetails?.details?[0].ColorId
//                   .toString();
//               EnglishAddtocartprice = productviewcontroller.mensshoes_userlist
//                   .value.productView?.productDetails?.details?[index].price
//                   .toString();
//               EnglishAddtocartSize = productviewcontroller.mensshoes_userlist
//                   .value.productView?.productDetails?.details?[0].SizeId
//                   .toString();
//               AddToCartcontroller().addtocart_Apihit(context);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildRowSize(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Size", style: theme.textTheme.titleMedium),
//             Padding(
//               padding: EdgeInsets.only(bottom: 2.v),
//               child: Text("Size Guide",
//                   style: theme.textTheme.titleMedium
//                       ?.copyWith(color: Colors.grey)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _buildListRectangle(BuildContext context) {
//   //   return Align(
//   //     alignment: Alignment.center,
//   //     child: SizedBox(
//   //       height: 60.v,
//   //       child: ListView.separated(
//   //         padding: EdgeInsets.only(
//   //           left: 20.h,
//   //           right: 23.h,
//   //         ),
//   //         scrollDirection: Axis.horizontal,
//   //         separatorBuilder: (
//   //           context,
//   //           index,
//   //         ) {
//   //           return SizedBox(
//   //             width: 8.h,
//   //           );
//   //         },
//   //         itemCount: productviewcontroller
//   //                 .home_living_userlist.value.productView?.galleryUrl?.length ??
//   //             0,
//   //         itemBuilder: (context, index) {
//   //           String imageUrl = productviewcontroller.home_living_userlist.value
//   //                   .productView?.galleryUrl?[index] ??
//   //               '';
//   //           return SizedBox(
//   //             width: 60.h,
//   //             child: Align(
//   //               alignment: Alignment.center,
//   //               child: CustomImageView(
//   //                 fit: BoxFit.cover,
//   //                 imagePath: "$imageUrl",
//   //                 height: 60.adaptSize,
//   //                 width: 60.adaptSize,
//   //                 radius: BorderRadius.circular(
//   //                   6.h,
//   //                 ),
//   //               ),
//   //             ),
//   //           );
//   //         },
//   //       ),
//   //     ),
//   //   );
//   // }

//   // _buildColors(BuildContext context) {
//   //   return Container(
//   //     height: Get.height * .03,
//   //     child: ListView.builder(
//   //       itemCount: 1,
//   //       itemBuilder: (BuildContext context, int index) {
//   //         var color = productviewcontroller.home_living_userlist.value
//   //             .productView?.productDetails?.details?[index].Color;
//   //         if (color == null) {
//   //           return Text('');
//   //         }
//   //         return Column(
//   //           children: [
//   //             // SizedBox(height: 11.v),
//   //             Padding(
//   //               padding: const EdgeInsets.only(left: 10),
//   //               child: Row(
//   //                 children: [
//   //                   RichText(
//   //                     text: TextSpan(
//   //                       children: [
//   //                         TextSpan(
//   //                           text: "Color:",
//   //                           style: theme.textTheme.titleMedium?.copyWith(
//   //                             fontSize: 20,
//   //                           ),
//   //                         ),
//   //                         TextSpan(
//   //                           text: "  ",
//   //                         ),
//   //                         TextSpan(
//   //                           text: '$color',
//   //                           style: theme.textTheme.titleMedium
//   //                               ?.copyWith(fontSize: 18, color: Colors.grey),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                     textAlign: TextAlign.left,
//   //                   )
//   //                 ],
//   //               ),
//   //             ),
//   //             SizedBox(height: 11.v),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
//   Widget _buildAddtocartWomensDress(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.womensDress_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.womensDress_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.womensDress_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.womensDress_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             color = productviewcontroller
//                                 .womensDress_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .womensDress_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .womensDress_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .womensDress_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .womensDress_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .womensDress_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .womensDress_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             size1 = productviewcontroller
//                                 .womensDress_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.womensDress_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .womensDress_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .womensDress_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .womensDress_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   if (color != null && size1 != null) {
//                                     if (colorId == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Color');
//                                     } else if (sizeid == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Size');
//                                     } else {
//                                       Englishcartproductid =
//                                           productviewcontroller
//                                               .womensDress_userlist
//                                               .value
//                                               .productView
//                                               ?.id
//                                               .toString();
//                                       EnglishAddtocartColor =
//                                           colorId.toString();
//                                       EnglishAddtocartprice =
//                                           productviewcontroller
//                                               .womensDress_userlist
//                                               .value
//                                               .productView
//                                               ?.productDetails
//                                               ?.details?[index]
//                                               .price
//                                               .toString();
//                                       EnglishAddtocartSize = sizeid.toString();
//                                       AddToCartcontrollerin.addtocart_Apihit(
//                                           context);
//                                     }
//                                   } else if (size1 != null) {
//                                     if (sizeid == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Size');
//                                     } else {
//                                       Englishcartproductid =
//                                           productviewcontroller
//                                               .womensDress_userlist
//                                               .value
//                                               .productView
//                                               ?.id
//                                               .toString();
//                                       EnglishAddtocartColor =
//                                           colorId.toString();
//                                       EnglishAddtocartprice =
//                                           productviewcontroller
//                                               .womensDress_userlist
//                                               .value
//                                               .productView
//                                               ?.productDetails
//                                               ?.details?[index]
//                                               .price
//                                               .toString();
//                                       EnglishAddtocartSize = sizeid.toString();
//                                       AddToCartcontrollerin.addtocart_Apihit(
//                                           context);
//                                     }
//                                   } else if (color != null) {
//                                     if (colorId == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Color');
//                                     } else {
//                                       Englishcartproductid =
//                                           productviewcontroller
//                                               .womensDress_userlist
//                                               .value
//                                               .productView
//                                               ?.id
//                                               .toString();
//                                       EnglishAddtocartColor =
//                                           colorId.toString();
//                                       EnglishAddtocartprice =
//                                           productviewcontroller
//                                               .womensDress_userlist
//                                               .value
//                                               .productView
//                                               ?.productDetails
//                                               ?.details?[index]
//                                               .price
//                                               .toString();
//                                       EnglishAddtocartSize = sizeid.toString();
//                                       AddToCartcontrollerin.addtocart_Apihit(
//                                           context);
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .womensDress_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .womensDress_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color: Colors.orange,
//                                           width: 2,
//                                         ),
//                                         color: Colors.orange),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               "Add to cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color: Colors.white),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartwomensTop(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
//       return Scaffold(
//           body: Center(
//               child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/images/error2.png',
//           ),
//           Text(
//             "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
//             style: theme.textTheme.headlineMedium
//                 ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
//           ),
//         ],
//       )));
//     } else {
//       return Container(
//         constraints: BoxConstraints(maxHeight: 700),
//         child: Container(
//           height: double.infinity,
//           constraints: BoxConstraints.expand(),
//           padding: EdgeInsets.symmetric(vertical: 18.v),
//           decoration: AppDecoration.fillWhiteA.copyWith(
//             borderRadius: BorderRadiusStyle.customBorderTL30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 3.v),
//                       child: Text(
//                         "Add to cart",
//                         style: theme.textTheme.titleMedium?.copyWith(),
//                       ),
//                     ),
//                     CustomImageView(
//                       onTap: () {
//                         Get.back();
//                       },
//                       imagePath: ImageConstant.imgMaskGroup24x24,
//                       height: 24.adaptSize,
//                       width: 24.adaptSize,
//                     ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.grey.shade200,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child:
//                                 //  ListView.builder(
//                                 //   physics: ScrollPhysics(),
//                                 //   scrollDirection: Axis.horizontal,
//                                 //   itemCount: productviewcontroller.mensshoes_userlist
//                                 //           .value.productView?.galleryUrl?.length ??
//                                 //       0,
//                                 //   itemBuilder: (BuildContext context, int index) {
//                                 //     // String imageUrl = productviewcontroller
//                                 //     //         .mensshoes_userlist
//                                 //     //         .value
//                                 //     //         .productView
//                                 //     //         ?.galleryUrl?[index] ??
//                                 //     //     '';
//                                 //     return Row(
//                                 //       children: [
//                                 Container(
//                               height: Get.height * .4,
//                               width: Get.width,
//                               child: CustomImageView(
//                                 fit: BoxFit.cover,
//                                 imagePath: selectedImageUrl.value.isNotEmpty
//                                     ? selectedImageUrl.value
//                                     : "${productviewcontroller.womenstops_userlist.value.productView!.imageUrl.toString()}",
//                                 height: 504.v,
//                                 width: Get.width,
//                                 alignment: Alignment.center,
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: Get.width * .04,)
//                             //   ],
//                             // );
//                             //   },
//                             // ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.womenstops_userlist.value.productView?.title.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                           "${productviewcontroller.womenstops_userlist.value.productView?.description.toString()}",
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'League Spartan',
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 14.v),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(left: 10.h),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text:
//                                                   '${productviewcontroller.womenstops_userlist.value.productView!.productDetails!.details?[index].price}',
//                                               style: CustomTextStyles
//                                                   .titleLargePrimary,
//                                             ),
//                                             TextSpan(
//                                               text: " ",
//                                             ),
//                                             TextSpan(
//                                               text: " \$120",
//                                               style: CustomTextStyles
//                                                   .titleMediumGray50001
//                                                   .copyWith(
//                                                 decoration:
//                                                     TextDecoration.lineThrough,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       SizedBox(width: Get.width * .02),
//                                       Container(
//                                         width: 63,
//                                         height: 16,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color:
//                                               Color.fromARGB(36, 206, 117, 147),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "-20% off",
//                                             style: TextStyle(
//                                               color: Color(0xffff8300),
//                                               fontSize: 9,
//                                               fontFamily: 'League Spartan',
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             color = productviewcontroller
//                                 .womenstops_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Color;
//                             if (color == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 // SizedBox(height: 11.v),
//                                 Obx(
//                                   () => Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color: ",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: selectedcolored
//                                                         .value.isNotEmpty
//                                                     ? selectedcolored.value
//                                                     : productviewcontroller
//                                                         .womenstops_userlist
//                                                         .value
//                                                         .productView
//                                                         ?.productDetails
//                                                         ?.details?[index]
//                                                         .Color,
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 18,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 11.v),

//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .womenstops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedcolorname =
//                                               productviewcontroller
//                                                       .womenstops_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Color ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 // setState(() {
//                                                 selectedcolored.value =
//                                                     selectedcolorname;
//                                                 selectedcolorIndex.value =
//                                                     index;
//                                                 colorId = productviewcontroller
//                                                     .womenstops_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .ColorId
//                                                     .toString();
//                                                 // selectedIndex = index;
//                                                 // selectedColor = selectedcolor;
//                                                 // });
//                                                 print(selectedcolorIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedcolorIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedcolorname',
//                                                         style: TextStyle(
//                                                           color: selectedcolorIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       Obx(
//                         () => Align(
//                           alignment: Alignment.center,
//                           child: SizedBox(
//                             height: 60.v,
//                             child: ListView.separated(
//                               padding: EdgeInsets.only(
//                                 left: 20.h,
//                                 right: 23.h,
//                               ),
//                               scrollDirection: Axis.horizontal,
//                               separatorBuilder: (
//                                 context,
//                                 index,
//                               ) {
//                                 return SizedBox(
//                                   width: 8.h,
//                                 );
//                               },
//                               itemCount: productviewcontroller
//                                       .womenstops_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .womenstops_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return GestureDetector(
//                                   onTap: () {
//                                     selectedImageUrl.value = imageUrl;
//                                     selectedImageIndex.value = index;
//                                     print(selectedImageIndex);
//                                   },
//                                   child: SizedBox(
//                                     width: 60.h,
//                                     child: Align(
//                                       alignment: Alignment.center,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 60.adaptSize,
//                                         width: 60.adaptSize,
//                                         radius: BorderRadius.circular(
//                                           6.h,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),

//                       Container(
//                         height: Get.height * .15,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             size1 = productviewcontroller
//                                 .womenstops_userlist
//                                 .value
//                                 .productView
//                                 ?.productDetails
//                                 ?.details?[index]
//                                 .Size;
//                             // var size2 = productviewcontroller.womenstops_userlist.value
//                             //     .productView?.productDetails?.details?[index].Size;
//                             if (size1 == null) {
//                               return Text('');
//                             }
//                             return Column(
//                               children: [
//                                 SizedBox(height: 27.v),
//                                 _buildRowSize(context),
//                                 SizedBox(height: 11.v),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child: Align(
//                                     alignment: Alignment.centerRight,
//                                     child: SizedBox(
//                                       height: 35.v,
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.only(left: 20.h),
//                                         scrollDirection: Axis.horizontal,
//                                         separatorBuilder: (
//                                           context,
//                                           index,
//                                         ) {
//                                           return SizedBox(
//                                             width: 10.h,
//                                           );
//                                         },
//                                         itemCount: productviewcontroller
//                                                 .womenstops_userlist
//                                                 .value
//                                                 .productView
//                                                 ?.productDetails
//                                                 ?.details!
//                                                 .length ??
//                                             0,
//                                         itemBuilder: (context, index) {
//                                           String selectedsizename =
//                                               productviewcontroller
//                                                       .womenstops_userlist
//                                                       .value
//                                                       .productView
//                                                       ?.productDetails
//                                                       ?.details?[index]
//                                                       .Size ??
//                                                   "";

//                                           return SizedBox(
//                                             width: 70.h,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 selectedSizeIndex.value = index;
//                                                 sizeid = productviewcontroller
//                                                     .womenstops_userlist
//                                                     .value
//                                                     .productView
//                                                     ?.productDetails
//                                                     ?.details?[index]
//                                                     .SizeId
//                                                     .toString();
//                                                 // print(selectedSizeIndex);
//                                               },
//                                               child: Obx(
//                                                 () => Center(
//                                                   child: Container(
//                                                     width: 70.h,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedSizeIndex
//                                                                   .value ==
//                                                               index
//                                                           ? Color(0xffff8300)
//                                                           : const Color
//                                                               .fromARGB(111,
//                                                               158, 158, 158),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20), // Adjust the border radius as needed
//                                                     ),
//                                                     padding: EdgeInsets.all(
//                                                         8), // Adjust the padding as needed
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$selectedsizename',
//                                                         style: TextStyle(
//                                                           color: selectedSizeIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),

//                       SizedBox(
//                         height: Get.height * .04,
//                       ),
//                       Container(
//                         height: Get.height * .1,
//                         child: ListView.builder(
//                           itemCount: 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Obx(
//                               () => GestureDetector(
//                                 onTap: () {
//                                   if (color != null && size1 != null) {
//                                     if (colorId == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Color');
//                                     } else if (sizeid == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Size');
//                                     } else {
//                                       Englishcartproductid =
//                                           productviewcontroller
//                                               .womenstops_userlist
//                                               .value
//                                               .productView
//                                               ?.id
//                                               .toString();
//                                       EnglishAddtocartColor =
//                                           colorId.toString();
//                                       EnglishAddtocartprice =
//                                           productviewcontroller
//                                               .womenstops_userlist
//                                               .value
//                                               .productView
//                                               ?.productDetails
//                                               ?.details?[index]
//                                               .price
//                                               .toString();
//                                       EnglishAddtocartSize = sizeid.toString();
//                                       AddToCartcontrollerin.addtocart_Apihit(
//                                           context);
//                                     }
//                                   } else if (size1 != null) {
//                                     if (sizeid == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Size');
//                                     } else {
//                                       Englishcartproductid =
//                                           productviewcontroller
//                                               .womenstops_userlist
//                                               .value
//                                               .productView
//                                               ?.id
//                                               .toString();
//                                       EnglishAddtocartColor =
//                                           colorId.toString();
//                                       EnglishAddtocartprice =
//                                           productviewcontroller
//                                               .womenstops_userlist
//                                               .value
//                                               .productView
//                                               ?.productDetails
//                                               ?.details?[index]
//                                               .price
//                                               .toString();
//                                       EnglishAddtocartSize = sizeid.toString();
//                                       AddToCartcontrollerin.addtocart_Apihit(
//                                           context);
//                                     }
//                                   } else if (color != null) {
//                                     if (colorId == null) {
//                                       Utils.snackBar(context, 'Failed',
//                                           'Please Select Color');
//                                     } else {
//                                       Englishcartproductid =
//                                           productviewcontroller
//                                               .womenstops_userlist
//                                               .value
//                                               .productView
//                                               ?.id
//                                               .toString();
//                                       EnglishAddtocartColor =
//                                           colorId.toString();
//                                       EnglishAddtocartprice =
//                                           productviewcontroller
//                                               .womenstops_userlist
//                                               .value
//                                               .productView
//                                               ?.productDetails
//                                               ?.details?[index]
//                                               .price
//                                               .toString();
//                                       EnglishAddtocartSize = sizeid.toString();
//                                       AddToCartcontrollerin.addtocart_Apihit(
//                                           context);
//                                     }
//                                   } else {
//                                     Englishcartproductid = productviewcontroller
//                                         .womenstops_userlist
//                                         .value
//                                         .productView
//                                         ?.id
//                                         .toString();
//                                     EnglishAddtocartColor = colorId.toString();
//                                     EnglishAddtocartprice =
//                                         productviewcontroller
//                                             .womenstops_userlist
//                                             .value
//                                             .productView
//                                             ?.productDetails
//                                             ?.details?[index]
//                                             .price
//                                             .toString();
//                                     EnglishAddtocartSize = sizeid.toString();
//                                     AddToCartcontrollerin.addtocart_Apihit(
//                                         context);
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(45, 0, 45, 0),
//                                   child: Container(
//                                     height: Get.height * .06,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(35),
//                                         border: Border.all(
//                                           color: Colors.orange,
//                                           width: 2,
//                                         ),
//                                         color: Colors.orange),
//                                     child: AddToCartcontrollerin
//                                                 .loading.value ==
//                                             false
//                                         ? Center(
//                                             child: Text(
//                                               "Add to cart",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   color: Colors.white),
//                                             ),
//                                           )
//                                         : Center(
//                                             child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           )),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                       // Add this variable in your state

//                       // SizedBox(height: Get.height * .04),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }
