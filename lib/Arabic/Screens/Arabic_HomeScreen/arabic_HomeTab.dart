import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ArabicCategoryScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ArabicSubCategory/ArabicSubCategoryProducts.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/Arabic_subCategories/arabic_ProductAll.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/ArabicHomeScreen.dart';
import 'package:mohally/Arabic/Screens/Myprofile/Notifications/arabic_notifications.dart';
import 'package:mohally/Arabic/Screens/widgets/arabic_customSearchView.dart';
import 'package:mohally/Arabic/Screens/widgets/custom_arabic_drawer.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/ArabicHomeController.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_bottom_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class arabic_HomeScreen extends StatefulWidget {
  const arabic_HomeScreen({Key? key}) : super(key: key);

  @override
  State<arabic_HomeScreen> createState() => _arabic_HomeScreenState();
}

class _arabic_HomeScreenState extends State<arabic_HomeScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  File imgFile = File("");

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

  PageController _pageController = PageController();

  int selectedTabIndex = 0;
  ProductsByCatIdListControllerEnglish _productbycatlistcontroller =
      ProductsByCatIdListControllerEnglish();
  ArabicHomeView_controller homeView_controller = ArabicHomeView_controller();
  TextEditingController searchController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  ArabiccategorybyNameController _categoryByName =
      ArabiccategorybyNameController();
  @override
  void initState() {
    super.initState();
    homeView_controller.homeview_apihit();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      // appBar: _buildAppBar(context),
      // backgroundColor: Colors.white,
      drawer: DrawerDraweritem_arabic(),
      body: SmartRefresher(
        enablePullDown: true,
        onRefresh: () async {
          homeView_controller.homeview_apihit();
          await Future.delayed(
              Duration(seconds: 1)); // Adjust the duration as needed
          _refreshController.refreshCompleted();
        },
        enablePullUp: false,
        controller: _refreshController,
        child: Obx(() {
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
                                    // Get.to(No_More_Notifications());
                                  },
                                  margin: EdgeInsets.all(10.h),
                                ),
                              ],
                            ),
                          ),
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
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      Center(
                          child: Stack(children: [
                        CustomSearchView_arabic(
                          hintText: 'يبحث',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                          readOnly: true,
                          enableTap: true,
                        ),
                        Positioned(
                            top: 20,
                            right: 270,
                            child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                    'assets/images/greycamera.png'))),
                      ])),
                      SizedBox(
                        height: Get.height * .04,
                      ),
                      Container(
                        height: Get.height * .07,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            // "All" Text
                            Positioned(
                              top: 8,
                              bottom: 10,
                              left: 300,
                              right: 0,
                              child: GestureDetector(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "الجميع",
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
                                        SizedBox(
                                          height: Get.height * .008,
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
                              padding:
                                  const EdgeInsets.only(right: 90, bottom: 20),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeView_controller
                                        .userList.value.categoryData?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedTabIndex = index;
                                      print(selectedTabIndex);
                                      // arabiccategoryId =
                                      // homeView_controller
                                      //     .userList
                                      //     .value
                                      //     .categoryData?[index]
                                      //     .id!
                                      //     .toString();
                                      // print("${arabiccategoryId}============");

                                      // _categoryByName.CategoryByNameApiHit(
                                      //     arabiccategoryId);
                                      // Get.to(CategoryScreen_arabic(
                                      //     showAppBar: true,
                                      //     FromHomeToCat: true,
                                      //     arabicselectedTabIndex:
                                      //         selectedTabIndex));
                                      arabicsubmainCatId = homeView_controller
                                          .userList
                                          .value
                                          .categoryData?[index]
                                          .id!
                                          .toString();
                                      _productbycatlistcontroller
                                          .ProductByCatId_apiHit(
                                              arabicsubmainCatId);
                                      if (homeView_controller.userList.value
                                              .categoryData?[index].id ==
                                          "id_for_all_cat") {
                                        Get.to(arabicAllProductView());
                                      } else {
                                        Get.to(
                                            ArabicSubCategoryProductsScreen());
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Center(
                                        child: Text(
                                          "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
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
                            Container(child: ArabicHomeScreen()),
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
      ),
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

  ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.homePageOneTabContainerPage:
  //       return Container();
  //     case AppRoutes.categoryPage:
  //       return CategoryPage();
  //     case AppRoutes.wishlistPage:
  //       return WishlistPage();
  //     case AppRoutes.cartPage:
  //       return CartPage();
  //     case AppRoutes.myProfilePage:
  //       return MyProfilePage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      actions: [
        GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
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
      ],
      leadingWidth: 80.h,
      leading: Container(
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
                Get.to(NotificationsOneScreen_arabic());
              },
            ),
          ],
        ),
      ),
    );
  }
}
