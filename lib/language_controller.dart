// // import 'dart:ui';

// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class LanguageController extends GetxController {
// //   late Locale currentLocale;

// //   // Load saved language from SharedPreferences
// //   loadSavedLanguage() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String selectedLanguage = prefs.getString('selectedLanguage') ?? "en";
// //     changeLanguage(selectedLanguage);
// //   }

// //   // Change the app language and save it to SharedPreferences
// //   changeLanguage(String languageCode) async {
// //     currentLocale = Locale(languageCode);
// //     Get.updateLocale(currentLocale);
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     prefs.setString('selectedLanguage', languageCode);
// //     update();
// //   }
// // }
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:mohally/data/response/status.dart';
// import 'package:mohally/presentation/Allcategory_screen/Allcategory_screen.dart';
// import 'package:mohally/presentation/single_page_screen/single_page_screen.dart';
// import 'package:mohally/view_models/controller/HomeView_Controller/homeview_controller.dart';
// import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
// import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
// import 'package:mohally/widgets/custom_elevated_button.dart';
// import 'package:mohally/widgets/custom_icon_button.dart';
// import 'package:mohally/widgets/custom_rating_bar.dart';
// import '../../view_models/controller/SeeAllCat_Controller/SeeAllCat_Controller.dart';
// import '../home_page_one_page/widgets/shippingsection_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:mohally/core/app_export.dart';

// // ignore_for_file: must_be_immutable
// class HomePageOnePage extends StatefulWidget {
//   const HomePageOnePage({Key? key})
//       : super(
//           key: key,
//         );

//   @override
//   HomePageOnePageState createState() => HomePageOnePageState();
// }

// class HomePageOnePageState extends State<HomePageOnePage>
//     with AutomaticKeepAliveClientMixin<HomePageOnePage> {
//   HomeBanner_controller homeBanner_controller = HomeBanner_controller();
//   HomeView_controller homeView_controller = HomeView_controller();
//   AllCategory_controller allCategory_controller = AllCategory_controller();

//   // List<String>? carouselItems = [];
//   @override
//   void initState() {
//     homeBanner_controller.homeBanner_apihit();
//     homeView_controller.homeview_apihit();
//     // carouselItems =
//     //     homeBanner_controller.userList.value.homeBanner?.bannerUrl ?? [];
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   bool get wantKeepAlive => true;
//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return Obx(() {
//       if (homeBanner_controller.rxRequestStatus.value == Status.LOADING) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       } else if (homeBanner_controller.error.value == 'No internet') {
//         return Scaffold(
//           body: Center(
//               child: InterNetExceptionWidget(
//             onPress: () {},
//           )),
//         );
//       } else if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       } else if (homeBanner_controller.error.value == 'No internet') {
//         return Scaffold(
//           body: Center(
//               child: InterNetExceptionWidget(
//             onPress: () {},
//           )),
//         );
//       } else {
//         print(homeBanner_controller.userList.value.homeBanner?.bannerUrl);
//         print("fvfvfff");
//         return SafeArea(
//           child: Scaffold(
//             body: SizedBox(
//               width: mediaQueryData.size.width,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // SizedBox(height: 30.v),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 20.h),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CarouselSlider(
//                               items: List.generate(
//                                   homeBanner_controller.userList.value
//                                               .homeBanner?.bannerUrl ==
//                                           null
//                                       ? 0
//                                       : homeBanner_controller.userList.value
//                                           .homeBanner!.bannerUrl!.length,
//                                   (index) => Image.network(homeBanner_controller .userList .value .homeBanner?.bannerUrl?[index] ?? "")),
//                               options: CarouselOptions(
//                                 height: 200.0,
//                                 initialPage: 0,
//                                 reverse: false,
//                                 enlargeCenterPage: true,
//                                 autoPlay: true,
//                                 aspectRatio: 16 / 9,
//                                 autoPlayCurve: Curves.fastOutSlowIn,
//                                 enableInfiniteScroll: true,
//                                 autoPlayAnimationDuration:
//                                     Duration(milliseconds: 800),
//                                 viewportFraction: .75,
//                               ),
//                             ),
//                             // _buildBannerSection(context),
//                             SizedBox(height: 5.v),
//                             // _buildShippingSection(context),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(width: 5.h),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.orange.shade50,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   height: 65,
//                                   width: 160,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Image.asset("assets/images/ship.png"),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Free Shipping",
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black),
//                                             ),
//                                             Text("Time-limited offer",
//                                                 style: theme
//                                                     .textTheme.subtitle2!
//                                                     .copyWith(
//                                                         color: Colors.grey)),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15.h),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.orange.shade50,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   height: 65,
//                                   width: 160,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Image.asset("assets/images/return.png"),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Free Shipping",
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black),
//                                             ),
//                                             Text("Time-limited offer",
//                                                 style: theme
//                                                     .textTheme.subtitle2!
//                                                     .copyWith(
//                                                         color: Colors.grey)),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 29.v),
//                             _buildCategorySection(context),
//                             SizedBox(height: 19.v),
//                             homeView_controller.userList.value.categoryData ==
//                                         null ||
//                                     homeView_controller.userList.value
//                                             .categoryData?.length ==
//                                         0
//                                 ? Center(child: Text("No data"))
//                                 : Padding(
//                                     padding: const EdgeInsets.only(right: 10.0),
//                                     child: GridView.builder(
//                                       shrinkWrap: true,
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                         mainAxisExtent: 90.v,
//                                         crossAxisCount: 4,
//                                         mainAxisSpacing: 17.h,
//                                         crossAxisSpacing: 15.h,
//                                       ),
//                                       physics: BouncingScrollPhysics(),
//                                       itemCount: 8,
//                                       // homeView_controller
//                                       //     .userList.value.categoryData?.length,
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(38.0),
//                                               child: Image.network(
//                                                 "${homeView_controller.userList.value.categoryData?[index].imageUrl.toString()}",
//                                                 height: 68,
//                                                 width: 68,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                             SizedBox(height: 2.v),
//                                             Align(
//                                               alignment: Alignment.center,
//                                               child: Text(
//                                                 "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
//                                                 style:
//                                                     theme.textTheme.bodySmall,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 1,
//                                               ),
//                                             )
//                                           ],
//                                         );
//                                       },
//                                     ),
//                                   ),
//                             // Padding(
//                             //   padding: EdgeInsets.only(right: 29.h),
//                             //   child: _buildWidget(context),
//                             // ),
//                             // SizedBox(height: 7.v),
//                             // Padding(
//                             //   padding: EdgeInsets.only(
//                             //     left: 3.h,
//                             //     right: 26.h,
//                             //   ),
//                             //   child: _buildElectronics(
//                             //     context,
//                             //     electronicsText: "Electronics",
//                             //     womenSClothingText: "Women’s\nClothing",
//                             //     menSClothingText: "Men’s\nClothing",
//                             //     curvePlusText: "Curve &  Plus",
//                             //   ),
//                             // ),
//                             // SizedBox(height: 14.v),
//                             // Padding(
//                             //   padding: EdgeInsets.only(right: 29.h),
//                             //   child: _buildWidget(context),
//                             //  ),
//                             // SizedBox(height: 7.v),
//                             // Padding(
//                             //   padding: EdgeInsets.only(
//                             //     left: 3.h,
//                             //     right: 26.h,
//                             //   ),
//                             //   child: _buildElectronics(
//                             //     context,
//                             //     electronicsText: "Electronics",
//                             //     womenSClothingText: "Women’s\nClothing",
//                             //     menSClothingText: "Men’s\nClothing",
//                             //     curvePlusText: "Curve &  Plus",
//                             //   ),
//                             // ),
//                             SizedBox(height: 20.v),
//                             _buildRecommendedSection(context),
//                             SizedBox(height: 20.v),
//                             _buildHomePageSection(context),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }

//       /// Section Widget
//       // Widget _buildBannerSection(BuildContext context) {
//       //   // final height = MediaQuery.of(context).size.height;
//       //   // final width = MediaQuery.of(context).size.width;
//       //
//       //   // return SingleChildScrollView(
//       //   //   scrollDirection: Axis.horizontal,
//       //   //   child:
//       //   //   IntrinsicWidth(
//       //   //     child: Row(
//       //   //       mainAxisAlignment: MainAxisAlignment.center,
//       //   //       children: [
//       //   //         Card(
//       //   //           clipBehavior: Clip.antiAlias,
//       //   //           elevation: 0,
//       //   //           margin: EdgeInsets.all(0),
//       //   //           color: appTheme.yellow50,
//       //   //           shape: RoundedRectangleBorder(
//       //   //             borderRadius: BorderRadiusStyle.roundedBorder8,
//       //   //           ),
//       //   //           child: Container(
//       //   //             height: 144.v,
//       //   //             width: 304.h,
//       //   //             decoration: AppDecoration.fillYellow.copyWith(
//       //   //               borderRadius: BorderRadiusStyle.roundedBorder8,
//       //   //             ),
//       //   //             child: Stack(
//       //   //               alignment: Alignment.topRight,
//       //   //               children: [
//       //   //                 Align(
//       //   //                   alignment: Alignment.topRight,
//       //   //                   child: Container(
//       //   //                     height: 108.v,
//       //   //                     width: 165.h,
//       //   //                     decoration: BoxDecoration(
//       //   //                       color: theme.colorScheme.primary,
//       //   //                       borderRadius: BorderRadius.circular(
//       //   //                         82.h,
//       //   //                       ),
//       //   //                     ),
//       //   //                   ),
//       //   //                 ),
//       //   //                 Align(
//       //   //                   alignment: Alignment.topRight,
//       //   //                   child: DottedBorder(
//       //   //                     color: theme.colorScheme.primary,
//       //   //                     padding: EdgeInsets.only(
//       //   //                       left: 2.h,
//       //   //                       top: 2.v,
//       //   //                       right: 2.h,
//       //   //                       bottom: 2.v,
//       //   //                     ),
//       //   //                     strokeWidth: 2.h,
//       //   //                     radius: Radius.circular(85),
//       //   //                     borderType: BorderType.RRect,
//       //   //                     dashPattern: [
//       //   //                       7,
//       //   //                       7,
//       //   //                     ],
//       //   //                     child: Container(
//       //   //                       height: 116.v,
//       //   //                       width: 171.h,
//       //   //                       decoration: BoxDecoration(
//       //   //                         borderRadius: BorderRadius.circular(
//       //   //                           85.h,
//       //   //                         ),
//       //   //                       ),
//       //   //                     ),
//       //   //                   ),
//       //   //                 ),
//       //   //                 Align(
//       //   //                   alignment: Alignment.topLeft,
//       //   //                   child: Padding(
//       //   //                     padding: EdgeInsets.only(
//       //   //                       left: 25.h,
//       //   //                       top: 17.v,
//       //   //                     ),
//       //   //                     child: Text(
//       //   //                       "SALE",
//       //   //                       style: CustomTextStyles.bodySmallInterPrimary,
//       //   //                     ),
//       //   //                   ),
//       //   //                 ),
//       //   //                 Align(
//       //   //                   alignment: Alignment.bottomLeft,
//       //   //                   child: Padding(
//       //   //                     padding: EdgeInsets.only(
//       //   //                       left: 28.h,
//       //   //                       bottom: 21.v,
//       //   //                     ),
//       //   //                     child: Text(
//       //   //                       "School Collections",
//       //   //                       style: CustomTextStyles.bodySmallInterErrorContainer,
//       //   //                     ),
//       //   //                   ),
//       //   //                 ),
//       //   //                 Align(
//       //   //                   alignment: Alignment.topLeft,
//       //   //                   child: Container(
//       //   //                     width: 111.h,
//       //   //                     margin: EdgeInsets.only(
//       //   //                       left: 25.h,
//       //   //                       top: 33.v,
//       //   //                     ),
//       //   //                     child: RichText(
//       //   //                       text: TextSpan(
//       //   //                         children: [
//       //   //                           TextSpan(
//       //   //                             text: "UPTO\n",
//       //   //                             style: CustomTextStyles
//       //   //                                 .headlineSmallInterErrorContainer,
//       //   //                           ),
//       //   //                           TextSpan(
//       //   //                             text: "60% OFF",
//       //   //                             style:
//       //   //                                 CustomTextStyles.headlineSmallInterPrimary,
//       //   //                           ),
//       //   //                         ],
//       //   //                       ),
//       //   //                       textAlign: TextAlign.left,
//       //   //                     ),
//       //   //                   ),
//       //   //                 ),
//       //   //                 Align(
//       //   //                   alignment: Alignment.centerRight,
//       //   //                   child: Container(
//       //   //                     height: 123.v,
//       //   //                     width: 112.h,
//       //   //                     margin: EdgeInsets.only(right: 8.h),
//       //   //                     child: Stack(
//       //   //                       alignment: Alignment.centerLeft,
//       //   //                       children: [
//       //   //                         Opacity(
//       //   //                           opacity: 0.7,
//       //   //                           child: CustomImageView(
//       //   //                             imagePath: ImageConstant.imgShadow,
//       //   //                             height: 123.v,
//       //   //                             width: 112.h,
//       //   //                             alignment: Alignment.center,
//       //   //                           ),
//       //   //                         ),
//       //   //                         Align(
//       //   //                           alignment: Alignment.centerLeft,
//       //   //                           child: Row(
//       //   //                             crossAxisAlignment: CrossAxisAlignment.start,
//       //   //                             children: [
//       //   //                               CustomImageView(
//       //   //                                 imagePath: ImageConstant.imgMain,
//       //   //                                 height: 123.v,
//       //   //                                 width: 84.h,
//       //   //                               ),
//       //   //                               CustomImageView(
//       //   //                                 imagePath: ImageConstant.imgVector1,
//       //   //                                 height: 19.v,
//       //   //                                 width: 16.h,
//       //   //                                 margin: EdgeInsets.only(
//       //   //                                   left: 2.h,
//       //   //                                   top: 40.v,
//       //   //                                   bottom: 64.v,
//       //   //                                 ),
//       //   //                               ),
//       //   //                             ],
//       //   //                           ),
//       //   //                         ),
//       //   //                       ],
//       //   //                     ),
//       //   //                   ),
//       //   //                 ),
//       //   //                 CustomImageView(
//       //   //                   imagePath: ImageConstant.imgVector2,
//       //   //                   height: 25.adaptSize,
//       //   //                   width: 25.adaptSize,
//       //   //                   alignment: Alignment.topRight,
//       //   //                   margin: EdgeInsets.only(
//       //   //                     top: 39.v,
//       //   //                     right: 7.h,
//       //   //                   ),
//       //   //                 ),
//       //   //               ],
//       //   //             ),
//       //   //           ),
//       //   //         ),
//       //   //         Card(
//       //   //           clipBe