// // ignore_for_file: unused_import
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
// import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
// import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
// import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
// import 'package:mohally/data/response/status.dart';
// import 'package:mohally/models/Singe_Product_ViewModel/Home_living_view_model/home_living_view_Model.dart';
// import 'package:mohally/presentation/category_page/category_page.dart';
// import 'package:mohally/presentation/category_page/category_screen.dart';
// import 'package:mohally/presentation/category_page/widgets/SubCategoriesMens.dart';
// import 'package:mohally/presentation/category_page/widgets/subCategories_Healthandwellness.dart';
// import 'package:mohally/presentation/category_page/widgets/subCategories_homeLiving.dart';
// import 'package:mohally/presentation/category_page/widgets/subcategories_ElectronicScreen.dart';
// import 'package:mohally/presentation/single_page_screen/Electronic_view/Bottoms_single_view.dart';
// import 'package:mohally/presentation/single_page_screen/HomeLiving_view.dart/HomeLiving_singleView.dart';
// import 'package:mohally/presentation/single_page_screen/health_wellness_view.dart';
// import 'package:mohally/presentation/single_page_screen/ShirtAndTopsSingleView.dart';
// import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
// import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
// import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
// import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
// import 'package:mohally/view_models/controller/Home_controller.dart/HomeController.dart';
// import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
// import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
// import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
// import 'package:mohally/widgets/custom_elevated_button.dart';
// import 'package:mohally/widgets/custom_icon_button.dart';
// import 'package:mohally/widgets/custom_outlined_button.dart';
// import 'package:mohally/widgets/custom_rating_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../home_page_one_page/widgets/homepagesection_item_widget.dart';
// import '../home_page_one_page/widgets/recommendedsection_item_widget.dart';
// import '../home_page_one_page/widgets/shippingsection_item_widget.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:mohally/core/app_export.dart';

// String? mainCatId;

// class English_Content_of_Men extends StatefulWidget {
//   const English_Content_of_Men({Key? key})
//       : super(
//           key: key,
//         );
//   @override
//   English_Content_of_MenState createState() => English_Content_of_MenState();
// }

// class English_Content_of_MenState extends State<English_Content_of_Men>
//     with AutomaticKeepAliveClientMixin<English_Content_of_Men> {
//   int selectedImageIndex = 0;
//   String selectedImageUrl = '';
//   HomeLivingModel homeLivingModel = HomeLivingModel();
//   EnglishSingleProductViewController productviewcontroller =
//       EnglishSingleProductViewController();
//   int selectedIndex = 0;

//   EnglishSingleProductViewController _productview =
//       EnglishSingleProductViewController();
//   bool isProductAddedToWishlist = false;
//   List<bool> isButtonTappedList = List.generate(20, (index) => false);
//   bool isButtonTapped = false;

//   EnglishSingleProductViewController singleProductViewController =
//       EnglishSingleProductViewController();
//   HomeView_controller_English homeView_controller =
//       HomeView_controller_English();
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
//     productviewcontroller.Single_ProductApiHit();
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
//           body: Container(
//             height: Get.height,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   //sSizedBox(height: 20.v),

//                   // _buildBannerSection(context),

//                   homeView_controller.userList.value.categoryData == null ||
//                           homeView_controller
//                                   .userList.value.categoryData?.length ==
//                               0
//                       ? Center(
//                           child: Padding(
//                           padding: const EdgeInsets.only(top: 150),
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 'assets/images/no_product.png',
//                                 color: Color(0xffff8300),
//                               ),
//                               SizedBox(
//                                 height: Get.height * .03,
//                               ),
//                               Text(
//                                 "Page Not Found",
//                                 style: theme.textTheme.headlineSmall?.copyWith(
//                                     fontWeight: FontWeight.normal,
//                                     fontSize: 18),
//                               ),
//                             ],
//                           ),
//                         ))
//                       : Padding(
//                           padding: const EdgeInsets.only(right: 10, left: 10),
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             physics: BouncingScrollPhysics(),
//                             itemCount: homeView_controller
//                                     .userList.value.categoryData?.length ??
//                                 0,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               mainAxisExtent: Get.height * .2,
//                               crossAxisCount: 4,
//                               mainAxisSpacing: 17.h,
//                               crossAxisSpacing: 15.h,
//                             ),

//                             // homeView_controller
//                             //     .userList.value.categoryData?.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               final category = homeView_controller
//                                   .userList.value.categoryData?[index];
//                               if (category?.id == 133) {
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   // mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         // mainCatId = homeView_controller.userList
//                                         //     .value.categoryData?[index].id!
//                                         //     .toString();

//                                         // setState(() {
//                                         //   EnglishsubMainCatId = mainCatId;
//                                         // });
//                                         // print("$EnglishsubMainCatId==");
//                                         // if (mainCatId == "133") {
//                                         Get.to(subcategory_MensScreen());
//                                         // } else if (mainCatId == "134") {
//                                         //   Get.to(
//                                         //       subcategoryElectronicsScreen());
//                                         // } else if (mainCatId == "135") {
//                                         //   Get.to(subcategoryHomeLivingScreen());
//                                         // } else if (mainCatId == "136") {
//                                         //   Get.to(
//                                         //       subcategoryHealthAndWellnessScreen());
//                                         // } else {
//                                         //   NoProductFound();
//                                         // }
//                                       },
//                                       child: ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(38.0),
//                                         child: Image.network(
//                                           "${category?.imageUrl.toString()}",
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
//                                           "${category?.categoryName.toString()}",
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
//                               } else {
//                                 return Container();
//                               }
//                             },
//                           ),
//                         ),
//                   // : Padding(
//                   //     padding: const EdgeInsets.only(right: 10, left: 10),
//                   //     child: ListView.builder(
//                   // shrinkWrap: true,
//                   // physics: BouncingScrollPhysics(),
//                   // itemCount: homeView_controller
//                   //         .userList.value.categoryData?.length ??
//                   //     0,
//                   //       itemBuilder: (BuildContext context, int index) {
//                   //         final category = homeView_controller
//                   //             .userList.value.categoryData?[index];
//                   //         if (category?.id == 133) {
//                   //           return Column(
//                   //             crossAxisAlignment: CrossAxisAlignment.start,
//                   //             children: [
//                   //               GestureDetector(
//                   //                 onTap: () {
//                   //                   // Handle onTap logic
//                   //                 },
//                   //                 child: ClipRRect(
//                   //                   borderRadius:
//                   //                       BorderRadius.circular(38.0),
//                   //                   child: Image.network(
//                   //                     "${category?.imageUrl ?? ''}",
//                   //                     height: 68,
//                   //                     width: 68,
//                   //                     fit: BoxFit.cover,
//                   //                   ),
//                   //                 ),
//                   //               ),
//                   //               SizedBox(height: 5.v),
//                   //               Align(
//                   //                 alignment: Alignment.center,
//                   //                 child: Text(
//                   //                   "${category?.categoryName ?? ''}",
//                   //                   style: TextStyle(
//                   //                     color: Color(0xFF272727),
//                   //                     fontSize: 12,
//                   //                     fontFamily: 'Almarai',
//                   //                     fontWeight: FontWeight.w500,
//                   //                   ),
//                   //                 ),
//                   //               ),
//                   //             ],
//                   //           );
//                   //         } else {
//                   //           // Return an empty container for categories other than ID 133
//                   //           return Container();
//                   //         }
//                   //       },
//                   //     ),
//                   //   ),

//                   SizedBox(height: 20.v),
//                   _buildHomePageSection(context),
//                   SizedBox(height: 10.v),
//                 ],
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
//             homeView_controller.userList.value.recommendedProduct?.length ?? 0,
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
//                         if (mainCatId == "133") {
//                           Get.to(ShirtsandTopsSingleView());
//                           print(
//                               "$mainCatId===========Mens Appearl main category id ");
//                         } else if (mainCatId == "134") {
//                           Get.to(SinglePageScreen_Electronics());
//                         } else if (mainCatId == "135") {
//                           Get.to(SinglePageScreen_HomeLiving());
//                         } else if (mainCatId == "136") {
//                           Get.to(SinglePageScreen_healthwellness());
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
//                               // Retrieve mainCategoryId and productId
//                               String? mainCatId = homeView_controller
//                                   .userList
//                                   .value
//                                   .recommendedProduct?[index]
//                                   .mainCategoryId
//                                   ?.toString();
//                               String? productId = homeView_controller
//                                   .userList.value.recommendedProduct?[index].id
//                                   ?.toString();

//                               setState(() {
//                                 Englishproductid = productId;
//                                 EnglishMainCatId = mainCatId;
//                               });
//                               productviewcontroller.Single_ProductApiHit();
//                               if (mainCatId == "133") {
//                                 // Make sure to call the method with ()
//                                 showModalBottomSheet(
//                                     context: context,
//                                     isScrollControlled: true,
//                                     builder: (context) {
//                                       return _buildAddtocartMens_view(
//                                           context, mainCatId, productId);
//                                     });
//                               } else if (mainCatId == "134") {
//                                 // Make sure to call the method with ()
//                                 showModalBottomSheet(
//                                     context: context,
//                                     isScrollControlled: true,
//                                     builder: (context) {
//                                       return _buildAddtocartElectronics(
//                                           context, mainCatId, productId);
//                                     });
//                               } else if (mainCatId == "135") {
//                                 // Make sure to call the method with ()
//                                 showModalBottomSheet(
//                                     context: context,
//                                     isScrollControlled: true,
//                                     builder: (context) {
//                                       return _buildAddtocartHome_and_Living(
//                                           context, mainCatId, productId);
//                                     });
//                               } else if (mainCatId == "136") {
//                                 // Make sure to call the method with ()
//                                 showModalBottomSheet(
//                                     context: context,
//                                     isScrollControlled: true,
//                                     builder: (context) {
//                                       return _buildAddtocartHealth_and_wellness(
//                                           context, mainCatId, productId);
//                                     });
//                               } else {
//                                 print('Category not found');
//                               }
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

//   Widget _buildAddtocartHome_and_Living(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
//       return Center(child: CircularProgressIndicator());
//     } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
//         child: Expanded(
//           child: Container(
//             height: double.infinity,
//             constraints: BoxConstraints.expand(),
//             padding: EdgeInsets.symmetric(vertical: 18.v),
//             decoration: AppDecoration.fillWhiteA.copyWith(
//               borderRadius: BorderRadiusStyle.customBorderTL30,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 3.v),
//                         child: Text(
//                           "Add to cart",
//                           style: theme.textTheme.titleMedium?.copyWith(),
//                         ),
//                       ),
//                       CustomImageView(
//                         onTap: () {
//                           Get.back();
//                         },
//                         imagePath: ImageConstant.imgMaskGroup24x24,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                   color: Colors.grey.shade200,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child: ListView.builder(
//                               physics: ScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: productviewcontroller
//                                       .home_living_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (BuildContext context, int index) {
//                                 String imageUrl = productviewcontroller
//                                         .home_living_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return Row(
//                                   children: [
//                                     Container(
//                                       height: Get.height * .4,
//                                       width: Get.width,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 504.v,
//                                         width: Get.width,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: Get.width * .04,
//                                     )
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.home_living_userlist.value.productView?.title.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 12.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.home_living_userlist.value.productView?.description.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Container(
//                           height: Get.height * .1,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(left: 10.h),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text:
//                                                     '${productviewcontroller.home_living_userlist.value.productView!.productDetails!.details?[index].price}',
//                                                 style: CustomTextStyles
//                                                     .titleLargePrimary,
//                                               ),
//                                               TextSpan(
//                                                 text: " ",
//                                               ),
//                                               TextSpan(
//                                                 text: " \$120",
//                                                 style: CustomTextStyles
//                                                     .titleMediumGray50001
//                                                     .copyWith(
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         ),
//                                         SizedBox(width: Get.width * .02),
//                                         Container(
//                                           width: 63,
//                                           height: 16,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             color: Color.fromARGB(
//                                                 36, 206, 117, 147),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               "-20% off",
//                                               style: TextStyle(
//                                                 color: Color(0xffff8300),
//                                                 fontSize: 9,
//                                                 fontFamily: 'League Spartan',
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .03,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var color = productviewcontroller
//                                   .home_living_userlist
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Color;
//                               if (color == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   // SizedBox(height: 11.v),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color:",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: "  ",
//                                               ),
//                                               TextSpan(
//                                                 text: '$color',
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                         fontSize: 18,
//                                                         color: Colors.grey),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 11.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Align(
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
//                                       .home_living_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .home_living_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Align(
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
//                                       .home_living_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .home_living_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .15,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var size1 = productviewcontroller
//                                   .userList
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Clothssize;
//                               // var size2 = productviewcontroller.userList.value
//                               //     .productView?.productDetails?.details?[index].Size;
//                               if (size1 == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   SizedBox(height: 27.v),
//                                   _buildRowSize(context),
//                                   SizedBox(height: 11.v),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: SizedBox(
//                                         height: 35.v,
//                                         child: ListView.separated(
//                                           padding: EdgeInsets.only(left: 20.h),
//                                           scrollDirection: Axis.horizontal,
//                                           separatorBuilder: (
//                                             context,
//                                             index,
//                                           ) {
//                                             return SizedBox(
//                                               width: 10.h,
//                                             );
//                                           },
//                                           itemCount: productviewcontroller
//                                                   .home_living_userlist
//                                                   .value
//                                                   .productView
//                                                   ?.productDetails
//                                                   ?.details!
//                                                   .length ??
//                                               0,
//                                           itemBuilder: (context, index) {
//                                             if (index < 0 ||
//                                                 index >=
//                                                     (productviewcontroller
//                                                             .home_living_userlist
//                                                             .value
//                                                             .productView!
//                                                             .productDetails
//                                                             ?.details!
//                                                             .length ??
//                                                         0)) {
//                                               // Check if index is out of bounds
//                                               return Container(); // Return an empty container or any other widget as needed
//                                             }

//                                             bool isSelected =
//                                                 index == selectedIndex;
//                                             return SizedBox(
//                                               width: 70.h,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     selectedIndex = index;
//                                                   });
//                                                 },
//                                                 child: Align(
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: Container(
//                                                     width:
//                                                         70.0, // Adjust this width as needed
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                       horizontal:
//                                                           17.0, // Adjust this padding as needed
//                                                       vertical:
//                                                           8.0, // Adjust this padding as needed
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: isSelected
//                                                           ? Color(0xffff8300)
//                                                           : Colors.grey[10003],
//                                                       border: Border.all(
//                                                           color: isSelected
//                                                               ? Color(
//                                                                   0xffff8300)
//                                                               : Colors.black),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$size1',
//                                                         style: TextStyle(
//                                                           color: isSelected
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                           fontSize: 10.0,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(height: 27.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 10.h),
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 13.v,
//                                   bottom: 9.v,
//                                 ),
//                                 child: Text(
//                                   "Qty",
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 15),
//                                 child: Container(
//                                   width: 100.h,
//                                   height: Get.height * .05,
//                                   margin: EdgeInsets.only(left: 14.h),
//                                   padding: EdgeInsets.symmetric(vertical: 10.v),
//                                   decoration:
//                                       AppDecoration.fillPrimary.copyWith(
//                                     borderRadius:
//                                         BorderRadiusStyle.circleBorder30,
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Increment the counter when "+" is pressed
//                                             counter++;
//                                           });
//                                         },
//                                         imagePath: ImageConstant
//                                             .imgGroup239412WhiteA70002,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin: EdgeInsets.only(
//                                           top: 2.v,
//                                           bottom: 3.v,
//                                         ),
//                                       ),
//                                       Text(
//                                         counter.toString(),
//                                         style: CustomTextStyles
//                                             .titleLargeWhiteA7000220,
//                                       ),
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Decrement the counter when "-" is pressed
//                                             if (counter > 1) {
//                                               counter--;
//                                             }
//                                           });
//                                         },
//                                         imagePath: ImageConstant.imgLine1,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin:
//                                             EdgeInsets.symmetric(vertical: 9.v),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Get.height * .04,
//                         ),
//                         _buildAddToCart(context),
//                         // SizedBox(height: Get.height * .04),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartHealth_and_wellness(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
//       return Center(child: CircularProgressIndicator());
//     } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
//         child: Expanded(
//           child: Container(
//             height: double.infinity,
//             constraints: BoxConstraints.expand(),
//             padding: EdgeInsets.symmetric(vertical: 18.v),
//             decoration: AppDecoration.fillWhiteA.copyWith(
//               borderRadius: BorderRadiusStyle.customBorderTL30,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 3.v),
//                         child: Text(
//                           "Add to cart",
//                           style: theme.textTheme.titleMedium?.copyWith(),
//                         ),
//                       ),
//                       CustomImageView(
//                         onTap: () {
//                           Get.back();
//                         },
//                         imagePath: ImageConstant.imgMaskGroup24x24,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                   color: Colors.grey.shade200,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child: ListView.builder(
//                               physics: ScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: productviewcontroller
//                                       .electronics_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (BuildContext context, int index) {
//                                 String imageUrl = productviewcontroller
//                                         .electronics_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return Row(
//                                   children: [
//                                     Container(
//                                       height: Get.height * .4,
//                                       width: Get.width,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 504.v,
//                                         width: Get.width,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: Get.width * .04,
//                                     )
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.electronics_userlist.value.productView?.title.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 12.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.electronics_userlist.value.productView?.description.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Container(
//                           height: Get.height * .1,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(left: 10.h),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text:
//                                                     '${productviewcontroller.electronics_userlist.value.productView!.productDetails!.details?[index].price}',
//                                                 style: CustomTextStyles
//                                                     .titleLargePrimary,
//                                               ),
//                                               TextSpan(
//                                                 text: " ",
//                                               ),
//                                               TextSpan(
//                                                 text: " \$120",
//                                                 style: CustomTextStyles
//                                                     .titleMediumGray50001
//                                                     .copyWith(
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         ),
//                                         SizedBox(width: Get.width * .02),
//                                         Container(
//                                           width: 63,
//                                           height: 16,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             color: Color.fromARGB(
//                                                 36, 206, 117, 147),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               "-20% off",
//                                               style: TextStyle(
//                                                 color: Color(0xffff8300),
//                                                 fontSize: 9,
//                                                 fontFamily: 'League Spartan',
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .03,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var color = productviewcontroller
//                                   .electronics_userlist
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Color;
//                               if (color == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   // SizedBox(height: 11.v),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color:",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: "  ",
//                                               ),
//                                               TextSpan(
//                                                 text: '$color',
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                         fontSize: 18,
//                                                         color: Colors.grey),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 11.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Align(
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
//                                       .electronics_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .electronics_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Align(
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
//                                       .electronics_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .electronics_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .15,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var size1 = productviewcontroller
//                                   .userList
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Clothssize;
//                               // var size2 = productviewcontroller.userList.value
//                               //     .productView?.productDetails?.details?[index].Size;
//                               if (size1 == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   SizedBox(height: 27.v),
//                                   _buildRowSize(context),
//                                   SizedBox(height: 11.v),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: SizedBox(
//                                         height: 35.v,
//                                         child: ListView.separated(
//                                           padding: EdgeInsets.only(left: 20.h),
//                                           scrollDirection: Axis.horizontal,
//                                           separatorBuilder: (
//                                             context,
//                                             index,
//                                           ) {
//                                             return SizedBox(
//                                               width: 10.h,
//                                             );
//                                           },
//                                           itemCount: productviewcontroller
//                                                   .electronics_userlist
//                                                   .value
//                                                   .productView
//                                                   ?.productDetails
//                                                   ?.details!
//                                                   .length ??
//                                               0,
//                                           itemBuilder: (context, index) {
//                                             if (index < 0 ||
//                                                 index >=
//                                                     (productviewcontroller
//                                                             .electronics_userlist
//                                                             .value
//                                                             .productView!
//                                                             .productDetails
//                                                             ?.details!
//                                                             .length ??
//                                                         0)) {
//                                               // Check if index is out of bounds
//                                               return Container(); // Return an empty container or any other widget as needed
//                                             }

//                                             bool isSelected =
//                                                 index == selectedIndex;
//                                             return SizedBox(
//                                               width: 70.h,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     selectedIndex = index;
//                                                   });
//                                                 },
//                                                 child: Align(
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: Container(
//                                                     width:
//                                                         70.0, // Adjust this width as needed
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                       horizontal:
//                                                           17.0, // Adjust this padding as needed
//                                                       vertical:
//                                                           8.0, // Adjust this padding as needed
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: isSelected
//                                                           ? Color(0xffff8300)
//                                                           : Colors.grey[10003],
//                                                       border: Border.all(
//                                                           color: isSelected
//                                                               ? Color(
//                                                                   0xffff8300)
//                                                               : Colors.black),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$size1',
//                                                         style: TextStyle(
//                                                           color: isSelected
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                           fontSize: 10.0,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(height: 27.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 10.h),
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 13.v,
//                                   bottom: 9.v,
//                                 ),
//                                 child: Text(
//                                   "Qty",
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 15),
//                                 child: Container(
//                                   width: 100.h,
//                                   height: Get.height * .05,
//                                   margin: EdgeInsets.only(left: 14.h),
//                                   padding: EdgeInsets.symmetric(vertical: 10.v),
//                                   decoration:
//                                       AppDecoration.fillPrimary.copyWith(
//                                     borderRadius:
//                                         BorderRadiusStyle.circleBorder30,
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Increment the counter when "+" is pressed
//                                             counter++;
//                                           });
//                                         },
//                                         imagePath: ImageConstant
//                                             .imgGroup239412WhiteA70002,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin: EdgeInsets.only(
//                                           top: 2.v,
//                                           bottom: 3.v,
//                                         ),
//                                       ),
//                                       Text(
//                                         counter.toString(),
//                                         style: CustomTextStyles
//                                             .titleLargeWhiteA7000220,
//                                       ),
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Decrement the counter when "-" is pressed
//                                             if (counter > 1) {
//                                               counter--;
//                                             }
//                                           });
//                                         },
//                                         imagePath: ImageConstant.imgLine1,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin:
//                                             EdgeInsets.symmetric(vertical: 9.v),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Get.height * .04,
//                         ),
//                         _buildAddToCart(context),
//                         // SizedBox(height: Get.height * .04),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartElectronics(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
//       return Center(child: CircularProgressIndicator());
//     } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
//         child: Expanded(
//           child: Container(
//             height: double.infinity,
//             constraints: BoxConstraints.expand(),
//             padding: EdgeInsets.symmetric(vertical: 18.v),
//             decoration: AppDecoration.fillWhiteA.copyWith(
//               borderRadius: BorderRadiusStyle.customBorderTL30,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 3.v),
//                         child: Text(
//                           "Add to cart",
//                           style: theme.textTheme.titleMedium?.copyWith(),
//                         ),
//                       ),
//                       CustomImageView(
//                         onTap: () {
//                           Get.back();
//                         },
//                         imagePath: ImageConstant.imgMaskGroup24x24,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                   color: Colors.grey.shade200,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child: ListView.builder(
//                               physics: ScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: productviewcontroller
//                                       .electronics_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (BuildContext context, int index) {
//                                 String imageUrl = productviewcontroller
//                                         .electronics_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return Row(
//                                   children: [
//                                     Container(
//                                       height: Get.height * .4,
//                                       width: Get.width,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 504.v,
//                                         width: Get.width,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: Get.width * .04,
//                                     )
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.electronics_userlist.value.productView?.title.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 12.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.electronics_userlist.value.productView?.description.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Container(
//                           height: Get.height * .1,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(left: 10.h),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text:
//                                                     '${productviewcontroller.electronics_userlist.value.productView!.productDetails!.details?[index].price}',
//                                                 style: CustomTextStyles
//                                                     .titleLargePrimary,
//                                               ),
//                                               TextSpan(
//                                                 text: " ",
//                                               ),
//                                               TextSpan(
//                                                 text: " \$120",
//                                                 style: CustomTextStyles
//                                                     .titleMediumGray50001
//                                                     .copyWith(
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         ),
//                                         SizedBox(width: Get.width * .02),
//                                         Container(
//                                           width: 63,
//                                           height: 16,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             color: Color.fromARGB(
//                                                 36, 206, 117, 147),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               "-20% off",
//                                               style: TextStyle(
//                                                 color: Color(0xffff8300),
//                                                 fontSize: 9,
//                                                 fontFamily: 'League Spartan',
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .03,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var color = productviewcontroller
//                                   .electronics_userlist
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Color;
//                               if (color == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   // SizedBox(height: 11.v),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color:",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: "  ",
//                                               ),
//                                               TextSpan(
//                                                 text: '$color',
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                         fontSize: 18,
//                                                         color: Colors.grey),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 11.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Align(
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
//                                       .electronics_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .electronics_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Align(
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
//                                       .electronics_userlist
//                                       .value
//                                       .productView
//                                       ?.galleryUrl
//                                       ?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .electronics_userlist
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .15,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var size1 = productviewcontroller
//                                   .userList
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Clothssize;
//                               // var size2 = productviewcontroller.userList.value
//                               //     .productView?.productDetails?.details?[index].Size;
//                               if (size1 == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   SizedBox(height: 27.v),
//                                   _buildRowSize(context),
//                                   SizedBox(height: 11.v),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: SizedBox(
//                                         height: 35.v,
//                                         child: ListView.separated(
//                                           padding: EdgeInsets.only(left: 20.h),
//                                           scrollDirection: Axis.horizontal,
//                                           separatorBuilder: (
//                                             context,
//                                             index,
//                                           ) {
//                                             return SizedBox(
//                                               width: 10.h,
//                                             );
//                                           },
//                                           itemCount: productviewcontroller
//                                                   .electronics_userlist
//                                                   .value
//                                                   .productView
//                                                   ?.productDetails
//                                                   ?.details!
//                                                   .length ??
//                                               0,
//                                           itemBuilder: (context, index) {
//                                             if (index < 0 ||
//                                                 index >=
//                                                     (productviewcontroller
//                                                             .electronics_userlist
//                                                             .value
//                                                             .productView!
//                                                             .productDetails
//                                                             ?.details!
//                                                             .length ??
//                                                         0)) {
//                                               // Check if index is out of bounds
//                                               return Container(); // Return an empty container or any other widget as needed
//                                             }

//                                             bool isSelected =
//                                                 index == selectedIndex;
//                                             return SizedBox(
//                                               width: 70.h,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     selectedIndex = index;
//                                                   });
//                                                 },
//                                                 child: Align(
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: Container(
//                                                     width:
//                                                         70.0, // Adjust this width as needed
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                       horizontal:
//                                                           17.0, // Adjust this padding as needed
//                                                       vertical:
//                                                           8.0, // Adjust this padding as needed
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: isSelected
//                                                           ? Color(0xffff8300)
//                                                           : Colors.grey[10003],
//                                                       border: Border.all(
//                                                           color: isSelected
//                                                               ? Color(
//                                                                   0xffff8300)
//                                                               : Colors.black),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$size1',
//                                                         style: TextStyle(
//                                                           color: isSelected
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                           fontSize: 10.0,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(height: 27.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 10.h),
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 13.v,
//                                   bottom: 9.v,
//                                 ),
//                                 child: Text(
//                                   "Qty",
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 15),
//                                 child: Container(
//                                   width: 100.h,
//                                   height: Get.height * .05,
//                                   margin: EdgeInsets.only(left: 14.h),
//                                   padding: EdgeInsets.symmetric(vertical: 10.v),
//                                   decoration:
//                                       AppDecoration.fillPrimary.copyWith(
//                                     borderRadius:
//                                         BorderRadiusStyle.circleBorder30,
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Increment the counter when "+" is pressed
//                                             counter++;
//                                           });
//                                         },
//                                         imagePath: ImageConstant
//                                             .imgGroup239412WhiteA70002,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin: EdgeInsets.only(
//                                           top: 2.v,
//                                           bottom: 3.v,
//                                         ),
//                                       ),
//                                       Text(
//                                         counter.toString(),
//                                         style: CustomTextStyles
//                                             .titleLargeWhiteA7000220,
//                                       ),
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Decrement the counter when "-" is pressed
//                                             if (counter > 1) {
//                                               counter--;
//                                             }
//                                           });
//                                         },
//                                         imagePath: ImageConstant.imgLine1,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin:
//                                             EdgeInsets.symmetric(vertical: 9.v),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Get.height * .04,
//                         ),
//                         _buildAddToCart(context),
//                         // SizedBox(height: Get.height * .04),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   Widget _buildAddtocartMens_view(
//     BuildContext context,
//     String? mainCatId,
//     String? productId,
//   ) {
//     if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
//       return Center(child: CircularProgressIndicator());
//     } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
//         child: Expanded(
//           child: Container(
//             height: double.infinity,
//             constraints: BoxConstraints.expand(),
//             padding: EdgeInsets.symmetric(vertical: 18.v),
//             decoration: AppDecoration.fillWhiteA.copyWith(
//               borderRadius: BorderRadiusStyle.customBorderTL30,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 3.v),
//                         child: Text(
//                           "Add to cart",
//                           style: theme.textTheme.titleMedium?.copyWith(),
//                         ),
//                       ),
//                       CustomImageView(
//                         onTap: () {
//                           Get.back();
//                         },
//                         imagePath: ImageConstant.imgMaskGroup24x24,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                   color: Colors.grey.shade200,
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                           child: Container(
//                             height: Get.height * .4,
//                             width: Get.width,
//                             child: ListView.builder(
//                               physics: ScrollPhysics(),
//                               scrollDirection: Axis.horizontal,
//                               itemCount: productviewcontroller.userList.value
//                                       .productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (BuildContext context, int index) {
//                                 String imageUrl = productviewcontroller
//                                         .userList
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return Row(
//                                   children: [
//                                     Container(
//                                       height: Get.height * .4,
//                                       width: Get.width,
//                                       child: CustomImageView(
//                                         fit: BoxFit.cover,
//                                         imagePath: "$imageUrl",
//                                         height: 504.v,
//                                         width: Get.width,
//                                         alignment: Alignment.center,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: Get.width * .04,
//                                     )
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.userList.value.productView?.title.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 12.v),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
//                             "${productviewcontroller.userList.value.productView?.description.toString()}",
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'League Spartan',
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 14.v),
//                         Container(
//                           height: Get.height * .1,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(left: 10.h),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text:
//                                                     '${productviewcontroller.userList.value.productView!.productDetails!.details?[index].price}',
//                                                 style: CustomTextStyles
//                                                     .titleLargePrimary,
//                                               ),
//                                               TextSpan(
//                                                 text: " ",
//                                               ),
//                                               TextSpan(
//                                                 text: " \$120",
//                                                 style: CustomTextStyles
//                                                     .titleMediumGray50001
//                                                     .copyWith(
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         ),
//                                         SizedBox(width: Get.width * .02),
//                                         Container(
//                                           width: 63,
//                                           height: 16,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             color: Color.fromARGB(
//                                                 36, 206, 117, 147),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               "-20% off",
//                                               style: TextStyle(
//                                                 color: Color(0xffff8300),
//                                                 fontSize: 9,
//                                                 fontFamily: 'League Spartan',
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .03,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var color = productviewcontroller
//                                   .userList
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Color;
//                               if (color == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   // SizedBox(height: 11.v),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Row(
//                                       children: [
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(
//                                                 text: "Color:",
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                   fontSize: 20,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: "  ",
//                                               ),
//                                               TextSpan(
//                                                 text: '$color',
//                                                 style: theme
//                                                     .textTheme.titleMedium
//                                                     ?.copyWith(
//                                                         fontSize: 18,
//                                                         color: Colors.grey),
//                                               ),
//                                             ],
//                                           ),
//                                           textAlign: TextAlign.left,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(height: 11.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Align(
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
//                               itemCount: productviewcontroller.userList.value
//                                       .productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .userList
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Align(
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
//                               itemCount: productviewcontroller.userList.value
//                                       .productView?.galleryUrl?.length ??
//                                   0,
//                               itemBuilder: (context, index) {
//                                 String imageUrl = productviewcontroller
//                                         .userList
//                                         .value
//                                         .productView
//                                         ?.galleryUrl?[index] ??
//                                     '';
//                                 return SizedBox(
//                                   width: 60.h,
//                                   child: Align(
//                                     alignment: Alignment.center,
//                                     child: CustomImageView(
//                                       fit: BoxFit.cover,
//                                       imagePath: "$imageUrl",
//                                       height: 60.adaptSize,
//                                       width: 60.adaptSize,
//                                       radius: BorderRadius.circular(
//                                         6.h,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: Get.height * .15,
//                           child: ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               var size1 = productviewcontroller
//                                   .userList
//                                   .value
//                                   .productView
//                                   ?.productDetails
//                                   ?.details?[index]
//                                   .Clothssize;
//                               // var size2 = productviewcontroller.userList.value
//                               //     .productView?.productDetails?.details?[index].Size;
//                               if (size1 == null) {
//                                 return Text('');
//                               }
//                               return Column(
//                                 children: [
//                                   SizedBox(height: 27.v),
//                                   _buildRowSize(context),
//                                   SizedBox(height: 11.v),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                     child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: SizedBox(
//                                         height: 35.v,
//                                         child: ListView.separated(
//                                           padding: EdgeInsets.only(left: 20.h),
//                                           scrollDirection: Axis.horizontal,
//                                           separatorBuilder: (
//                                             context,
//                                             index,
//                                           ) {
//                                             return SizedBox(
//                                               width: 10.h,
//                                             );
//                                           },
//                                           itemCount: productviewcontroller
//                                                   .userList
//                                                   .value
//                                                   .productView
//                                                   ?.productDetails
//                                                   ?.details!
//                                                   .length ??
//                                               0,
//                                           itemBuilder: (context, index) {
//                                             if (index < 0 ||
//                                                 index >=
//                                                     (productviewcontroller
//                                                             .userList
//                                                             .value
//                                                             .productView!
//                                                             .productDetails
//                                                             ?.details!
//                                                             .length ??
//                                                         0)) {
//                                               // Check if index is out of bounds
//                                               return Container(); // Return an empty container or any other widget as needed
//                                             }

//                                             bool isSelected =
//                                                 index == selectedIndex;
//                                             return SizedBox(
//                                               width: 70.h,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     selectedIndex = index;
//                                                   });
//                                                 },
//                                                 child: Align(
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: Container(
//                                                     width:
//                                                         70.0, // Adjust this width as needed
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                       horizontal:
//                                                           17.0, // Adjust this padding as needed
//                                                       vertical:
//                                                           8.0, // Adjust this padding as needed
//                                                     ),
//                                                     decoration: BoxDecoration(
//                                                       color: isSelected
//                                                           ? Color(0xffff8300)
//                                                           : Colors.grey[10003],
//                                                       border: Border.all(
//                                                           color: isSelected
//                                                               ? Color(
//                                                                   0xffff8300)
//                                                               : Colors.black),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         '$size1',
//                                                         style: TextStyle(
//                                                           color: isSelected
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                           fontSize: 10.0,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // SizedBox(height: 27.v),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 10.h),
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 13.v,
//                                   bottom: 9.v,
//                                 ),
//                                 child: Text(
//                                   "Qty",
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 15),
//                                 child: Container(
//                                   width: 100.h,
//                                   height: Get.height * .05,
//                                   margin: EdgeInsets.only(left: 14.h),
//                                   padding: EdgeInsets.symmetric(vertical: 10.v),
//                                   decoration:
//                                       AppDecoration.fillPrimary.copyWith(
//                                     borderRadius:
//                                         BorderRadiusStyle.circleBorder30,
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Increment the counter when "+" is pressed
//                                             counter++;
//                                           });
//                                         },
//                                         imagePath: ImageConstant
//                                             .imgGroup239412WhiteA70002,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin: EdgeInsets.only(
//                                           top: 2.v,
//                                           bottom: 3.v,
//                                         ),
//                                       ),
//                                       Text(
//                                         counter.toString(),
//                                         style: CustomTextStyles
//                                             .titleLargeWhiteA7000220,
//                                       ),
//                                       CustomImageView(
//                                         onTap: () {
//                                           setState(() {
//                                             // Decrement the counter when "-" is pressed
//                                             if (counter > 1) {
//                                               counter--;
//                                             }
//                                           });
//                                         },
//                                         imagePath: ImageConstant.imgLine1,
//                                         height: 13.adaptSize,
//                                         width: 13.adaptSize,
//                                         margin:
//                                             EdgeInsets.symmetric(vertical: 9.v),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: Get.height * .04,
//                         ),
//                         _buildAddToCart(context),
//                         // SizedBox(height: Get.height * .04),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
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

//   Widget _buildsize(BuildContext context) {
//     return Container(
//       height: Get.height * .15,
//       child: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (BuildContext context, int index) {
//           var size1 = productviewcontroller.userList.value.productView
//               ?.productDetails?.details?[index].Clothssize;
//           // var size2 = productviewcontroller.userList.value
//           //     .productView?.productDetails?.details?[index].Size;
//           if (size1 == null) {
//             return Text('');
//           }
//           return Column(
//             children: [
//               SizedBox(height: 27.v),
//               _buildRowSize(context),
//               SizedBox(height: 11.v),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: SizedBox(
//                     height: 35.v,
//                     child: ListView.separated(
//                       padding: EdgeInsets.only(left: 20.h),
//                       scrollDirection: Axis.horizontal,
//                       separatorBuilder: (
//                         context,
//                         index,
//                       ) {
//                         return SizedBox(
//                           width: 10.h,
//                         );
//                       },
//                       itemCount: productviewcontroller
//                               .home_living_userlist
//                               .value
//                               .productView
//                               ?.productDetails
//                               ?.details!
//                               .length ??
//                           0,
//                       itemBuilder: (context, index) {
//                         if (index < 0 ||
//                             index >=
//                                 (productviewcontroller
//                                         .home_living_userlist
//                                         .value
//                                         .productView!
//                                         .productDetails
//                                         ?.details!
//                                         .length ??
//                                     0)) {
//                           // Check if index is out of bounds
//                           return Container(); // Return an empty container or any other widget as needed
//                         }

//                         bool isSelected = index == selectedIndex;
//                         return SizedBox(
//                           width: 70.h,
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = index;
//                               });
//                             },
//                             child: Align(
//                               alignment: Alignment.centerRight,
//                               child: Container(
//                                 width: 70.0, // Adjust this width as needed
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal:
//                                       17.0, // Adjust this padding as needed
//                                   vertical:
//                                       8.0, // Adjust this padding as needed
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: isSelected
//                                       ? Color(0xffff8300)
//                                       : Colors.grey[10003],
//                                   border: Border.all(
//                                       color: isSelected
//                                           ? Color(0xffff8300)
//                                           : Colors.black),
//                                   borderRadius: BorderRadius.circular(20.0),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     '$size1',
//                                     style: TextStyle(
//                                       color: isSelected
//                                           ? Colors.white
//                                           : Colors.black,
//                                       fontSize: 10.0,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               // SizedBox(height: 27.v),
//             ],
//           );
//         },
//       ),
//     );
//   }

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
//               // Englishcartproductid = productviewcontroller
//               //     .userList.value.productView?.id
//               //     .toString();
//               // EnglishAddtocartColor = productviewcontroller.userList.value
//               //     .productView?.productDetails?.details?[0].ColorId
//               //     .toString();
//               // EnglishAddtocartprice = productviewcontroller.userList.value
//               //     .productView?.productDetails?.details?[index].price
//               //     .toString();
//               // EnglishAddtocartSize = productviewcontroller.userList.value
//               //     .productView?.productDetails?.details?[0].ClothssizeId
//               //     .toString();
//               // AddToCartcontroller().addtocart_Apihit(context);
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

//   Widget _buildListRectangle(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: SizedBox(
//         height: 60.v,
//         child: ListView.separated(
//           padding: EdgeInsets.only(
//             left: 20.h,
//             right: 23.h,
//           ),
//           scrollDirection: Axis.horizontal,
//           separatorBuilder: (
//             context,
//             index,
//           ) {
//             return SizedBox(
//               width: 8.h,
//             );
//           },
//           itemCount: productviewcontroller
//                   .home_living_userlist.value.productView?.galleryUrl?.length ??
//               0,
//           itemBuilder: (context, index) {
//             String imageUrl = productviewcontroller.home_living_userlist.value
//                     .productView?.galleryUrl?[index] ??
//                 '';
//             return SizedBox(
//               width: 60.h,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: CustomImageView(
//                   fit: BoxFit.cover,
//                   imagePath: "$imageUrl",
//                   height: 60.adaptSize,
//                   width: 60.adaptSize,
//                   radius: BorderRadius.circular(
//                     6.h,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   _buildColors(BuildContext context) {
//     return Container(
//       height: Get.height * .03,
//       child: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (BuildContext context, int index) {
//           var color = productviewcontroller.home_living_userlist.value
//               .productView?.productDetails?.details?[index].Color;
//           if (color == null) {
//             return Text('');
//           }
//           return Column(
//             children: [
//               // SizedBox(height: 11.v),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Row(
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Color:",
//                             style: theme.textTheme.titleMedium?.copyWith(
//                               fontSize: 20,
//                             ),
//                           ),
//                           TextSpan(
//                             text: "  ",
//                           ),
//                           TextSpan(
//                             text: '$color',
//                             style: theme.textTheme.titleMedium
//                                 ?.copyWith(fontSize: 18, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.left,
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 11.v),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
