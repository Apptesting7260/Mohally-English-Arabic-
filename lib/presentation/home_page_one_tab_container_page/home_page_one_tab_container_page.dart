import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/Notifications/no_more_notification.dart';
import 'package:mohally/presentation/cart_page/cart_page.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/AllProductView.dart';
import 'package:mohally/presentation/category_page/ProductByCategoryScreen/ProductByCategoryScreen.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/drawer_draweritem/drawer_draweritem.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/presentation/wishlist_page/wishlist_page.dart';
import 'package:mohally/routes/app_routes.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishsearchController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_bottom_bar.dart';
import 'package:mohally/widgets/custom_search_view.dart';
import '../../data/app_exceptions.dart';
import '../../data/response/status.dart';
import '../../widgets/Internet_exception_widget/internet_exception_widget.dart';

String searchText = '';

class HomePageOneTabContainerPage extends StatefulWidget {
  const HomePageOneTabContainerPage({Key? key}) : super(key: key);

  @override
  State<HomePageOneTabContainerPage> createState() =>
      _HomePageOneTabContainerPageState();
}

class _HomePageOneTabContainerPageState
    extends State<HomePageOneTabContainerPage> {
  EnglishSearchController _searchcontroller = EnglishSearchController();
  ProductsByCatIdListControllerEnglish _productbycatlistcontroller =
      ProductsByCatIdListControllerEnglish();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  List<String> title = [
    'All', 'Men', 'Electronics', 'Womens', 'Kids'
    // "Jewelry",
  ];
  PageController _pageController = PageController();
  int selectedTabIndex = 0;

  File imgFile = File("");

  @override
  void initState() {
    super.initState();
    homeView_controller.homeview_apihit();
  }

  final imgPicker = ImagePicker();

  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

//open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  CategoriesByNameControllerEnglish _categoryByName =
      CategoriesByNameControllerEnglish();
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late TabController tabviewController;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      // appBar: _buildAppBar(context),
      // backgroundColor: Colors.white,
      drawer: DrawerDraweritem(),
      body: Obx(() {
        switch (homeView_controller.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeView_controller.error.value == 'No internet') {
              return InterNetExceptionWidget(onPress: () {});
            } else {
              return GeneralExceptionWidget(onPress: () {});
            }
          case Status.COMPLETED:
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_scaffoldKey.currentState!.isDrawerOpen) {
                              _scaffoldKey.currentState!.openEndDrawer();
                            } else {
                              _scaffoldKey.currentState!.openDrawer();
                            }
                          },
                          child: Container(
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            child: Image.asset(
                              "assets/images/Menu.png",
                            ),
                            margin: EdgeInsets.only(
                              left: 20.h,
                              top: 8.v,
                              bottom: 8.v,
                            ),
                          ),
                        ),
                        Container(
                          height: 40.adaptSize,
                          width: 40.adaptSize,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 8.v,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgGroup239397,
                                height: 40.adaptSize,
                                width: 40.adaptSize,
                                alignment: Alignment.center,
                              ),
                              CustomImageView(
                                imagePath:
                                    ImageConstant.imgNotification1Primary,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                alignment: Alignment.center,
                                onTap: () {
                                  Get.to(No_More_Notifications());
                                },
                                margin: EdgeInsets.all(10.h),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            // SizedBox(
                            //     width: Get.width * .9,
                            //     child: TextFormField(
                            //       controller: searchController,
                            //       // focusNode: widget.focusNode ?? FocusNode(),
                            //       // autofocus: widget.autofocus!,
                            //       style: CustomTextStyles.bodyLargeOnError_1,
                            //       decoration: InputDecoration(
                            //         hintText: "Search",
                            //         hintStyle:
                            //             CustomTextStyles.bodyLargeOnError_1,
                            //         prefixIcon: Padding(
                            //           padding: EdgeInsets.all(
                            //             15.h,
                            //           ),
                            //           child: Icon(
                            //             Icons.search,
                            //             color: Colors.grey.shade600,
                            //           ),
                            //         ),
                            //         prefixIconConstraints: BoxConstraints(
                            //           maxHeight: 50.v,
                            //         ),
                            //         suffixIcon: Container(
                            //           padding: EdgeInsets.all(15.h),
                            //           margin: EdgeInsets.only(
                            //             left: 30.h,
                            //           ),
                            //           decoration: BoxDecoration(
                            //             color: theme.colorScheme.primary,
                            //             borderRadius: BorderRadius.horizontal(
                            //               right: Radius.circular(
                            //                 55.h,
                            //               ),
                            //             ),
                            //           ),
                            //           child: CustomImageView(
                            //             imagePath:
                            //                 ImageConstant.imgSearchWhiteA70002,
                            //             height: 30.adaptSize,
                            //             width: 20.adaptSize,
                            //           ),
                            //         ),
                            //         suffixIconConstraints: BoxConstraints(
                            //           maxHeight: 60.v,
                            //         ),
                            //         isDense: true,
                            //         contentPadding: EdgeInsets.only(
                            //           left: 16.h,
                            //           top: 17.v,
                            //           bottom: 17.v,
                            //         ),
                            //         fillColor: appTheme.gray100,
                            //         filled: true,
                            //         border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(30.h),
                            //           borderSide: BorderSide(
                            //             color: appTheme.gray300,
                            //             width: 1,
                            //           ),
                            //         ),
                            //         enabledBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(30.h),
                            //           borderSide: BorderSide(
                            //             color: appTheme.gray300,
                            //             width: 1,
                            //           ),
                            //         ),
                            //         focusedBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(30.h),
                            //           borderSide: BorderSide(
                            //             color: appTheme.gray300,
                            //             width: 1,
                            //           ),
                            //         ),
                            //       ),

                            //       onFieldSubmitted: (value) {
                            //         Get.to(SearchScreen(searchQuery: value));
                            //       },
                            //     )),
                            CustomSearchView(
                              hintText: "Search",
                              enableTap: true,
                              readOnly: true,
                            ),
                            Positioned(
                                top: 20,
                                left: 240,
                                child: GestureDetector(
                                    onTap: () {
                                      _buildOncameraclick(context);
                                    },
                                    child: Image.asset(
                                        'assets/images/greycamera.png'))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    Container(
                      height: Get.width * .10,
                      // color: Colors.red,
                      // alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // "All" Text
                          Positioned(
                            top: 0,
                            bottom: 0,
                            // right: Get.width * .50,
                            left: 0,
                            child: GestureDetector(
                              onTap: () {
                                // selectedTabIndex = 0;
                                // print(selectedTabIndex);
                                // categoryId = homeView_controller
                                //     .userList.value.categoryData?[0].id!
                                //     .toString();
                                // print("${categoryId}============");
                                // _categoryByName.CategoryByNameApiHit(
                                //     categoryId);
                                // Get.to(CategoryScreen(
                                //     showAppBar: true,
                                //     FromHomeToCat: true,
                                //     selectedTabIndex: selectedTabIndex));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "All",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.orange,
                                          // : Colors
                                          //     .grey, // Update color as per requirement
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Almarai',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Container(
                                        width: 30,
                                        // Get.width * .06,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Color(0xffff8300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ListView.builder
                          Padding(
                            padding: EdgeInsets.only(
                                left: Get.width * 0.22,
                                bottom: Get.width * 0.03),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeView_controller
                                      .userList.value.categoryData?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    submainCatId = homeView_controller
                                        .userList.value.categoryData?[index].id!
                                        .toString();
                                    _productbycatlistcontroller
                                        .ProductByCatId_apiHit(submainCatId);

                                    if (submainCatId == "id_for_all_cat") {
                                      Get.to(AllProductViewEnglish());
                                    } else {
                                      Get.to(ProductsByCategoryScreen());
                                    }
                                    // selectedTabIndex = index;
                                    // print(selectedTabIndex);
                                    // categoryId = homeView_controller
                                    //     .userList.value.categoryData?[index].id!
                                    //     .toString();
                                    // print("${categoryId}============");

                                    // _categoryByName.CategoryByNameApiHit(
                                    //     categoryId);
                                    // Get.to(CategoryScreen(
                                    //     showAppBar: true,
                                    //     FromHomeToCat: true,
                                    //     selectedTabIndex: selectedTabIndex));
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: Get.width * .09),
                                      child: Text(
                                        "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              // isSelected
                                              //     ? Colors.orange
                                              //     :
                                              Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Almarai',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.6,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        children: [
                          Container(child: EnglishHomeScreen()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
        // return SizedBox();
      }),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
      bottomTapped: () {},
      bottomSelectedIndex: 0,
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePageOneTabContainerPage;
      case BottomBarEnum.Category:
        return AppRoutes.categoryPage;
      case BottomBarEnum.Wishlist:
        return AppRoutes.wishlistPage;
      case BottomBarEnum.Cart:
        return AppRoutes.cartPage;
      case BottomBarEnum.Profile:
        return AppRoutes.myProfilePage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageOneTabContainerPage:
        return Container();
      case AppRoutes.categoryPage:
        return CategoryScreen(
          selectedTabIndex: 0,
        );
      case AppRoutes.wishlistPage:
        return WishlistPage();
      case AppRoutes.cartPage:
        return CartPage();
      case AppRoutes.myProfilePage:
        return MyProfilePage();
      default:
        return DefaultWidget();
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: GestureDetector(
        onTap: () {
          if (_scaffoldKey.currentState!.isDrawerOpen) {
            _scaffoldKey.currentState!.openEndDrawer();
          } else {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
        child: Container(
          height: 30.adaptSize,
          width: 30.adaptSize,
          child: Image.asset(
            "assets/images/Menu.png",
          ),
          margin: EdgeInsets.only(
            left: 20.h,
            top: 8.v,
            bottom: 8.v,
          ),
        ),
      ),
      actions: [
        Container(
          height: 40.adaptSize,
          width: 40.adaptSize,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 8.v,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup239397,
                height: 40.adaptSize,
                width: 40.adaptSize,
                alignment: Alignment.center,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgNotification1Primary,
                height: 20.adaptSize,
                width: 20.adaptSize,
                alignment: Alignment.center,
                onTap: () {
                  Get.to(No_More_Notifications());
                },
                margin: EdgeInsets.all(10.h),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future _buildOncameraclick(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 17.v),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMaskGroup24x24,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 20.h),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: 17.v),
                  Divider(thickness: 0.5, color: Colors.grey),
                  SizedBox(height: 15.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/blackcamera.png",
                        height: 18.adaptSize,
                        width: 18.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 3.v,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xFFFF8300),
                                    title: Text(
                                      "Choose",
                                      style: TextStyle(
                                          fontFamily: 'League Spartan',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    content: Row(
                                      children: [
                                        GestureDetector(
                                          child: Text(
                                            "Camera",
                                            style: TextStyle(
                                                fontFamily: 'League Spartan',
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          onTap: () {
                                            openCameraa(ImageSource.camera);
                                          },
                                        ),
                                        SizedBox(width: 80),
                                        GestureDetector(
                                          child: Text("Gallery",
                                              style: TextStyle(
                                                  fontFamily: 'League Spartan',
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          onTap: () {
                                            openCameraa(ImageSource.gallery);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "Take photo",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/blackvideo.png",
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "Select from album",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/clock.png",
                        height: 18.adaptSize,
                        width: 18.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 3.v,
                        ),
                        child: InkWell(
                          onTap: () {
                            // Get.to(SearchScreen());
                          },
                          child: Text(
                            "Search history",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.v),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: CustomTextStyles.titleMediumPrimaryMedium,
                    ),
                  ),
                ],
              ));
        });
  }
}
