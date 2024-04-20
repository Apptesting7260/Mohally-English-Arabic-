import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/LanguageSwitchEnglishScreen/switchLanguageScreen.dart';
import 'package:mohally/presentation/coupans_offeres/coupan_screen.dart';
import 'package:mohally/presentation/my_account/my_account_screen.dart';
import 'package:mohally/presentation/my_orders_tab_container_screen/my_orders_tab_container_screen.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customer_support/customer_support.dart';
import '../notifications_one_screen/notifications_one_screen.dart';

// ignore_for_file: must_be_immutable
class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _controller = Get.put(MyAccountController());
  @override
  void initState() {
    _controller.fetchMyAccountData();
    super.initState();
    //    setInitialLocale();
  }

  //   void setInitialLocale() {
  //   if (Get.locale == null || Get.locale?.languageCode == 'ar') {
  //     Get.updateLocale(Locale('ar', 'DZ'));
  //   } else {
  //     Get.updateLocale(Locale('en', 'US'));
  //   }
  // }
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
    // uploadProfile();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              children: [
                SizedBox(height: 28.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 19.h,
                        right: 19.h,
                        bottom: 5.v,
                      ),
                      child: Column(
                        children: [
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     "My Profile",
                          //     style: theme.textTheme.headlineMedium,
                          //   ),
                          // ),
                          // SizedBox(height: 33.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              child: Container(
                                height: height * .2,
                                width: width * .3,
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(_controller
                                      .MyAccount.value.userDetails?.imageUrl),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 26.v),
                          Obx(() {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${_controller.MyAccount.value.userDetails?.firstName.toString()}",
                                // "Name",
                                style: CustomTextStyles
                                    .headlineSmallLeagueSpartanSemiBold,
                              ),
                            );
                          }),

                          SizedBox(height: 10.v),
                          Obx(() {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${_controller.MyAccount.value.userDetails?.email.toString()}",
                                // "Name",
                                style: CustomTextStyles.bodyLargeGray50001_3,
                              ),
                            );
                          }),

                          SizedBox(height: 36.v),
                          InkWell(
                              onTap: () {
                                Get.to(() => MyAccountScreen());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgProfileIcon,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                    color: Color(0xffff8300),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.h,
                                      top: 5.v,
                                      bottom: 2.v,
                                    ),
                                    child: Text(
                                      "MyAccount",
                                      style:
                                          CustomTextStyles.bodyLarge18.copyWith(
                                        color: appTheme.gray90001,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgVectorGray9000111x6,
                                    height: 11.v,
                                    width: 6.h,
                                    margin: EdgeInsets.symmetric(vertical: 7.v),
                                  ),
                                ],
                              )),
                          // SizedBox(height: 26.v),
                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgMessage1,
                          //   userMessage: "Messages_".tr,
                          // ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => MyOrdersTabContainerScreen());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgBag,
                              userMessage: "My Orders",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => ReviewsScreen());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgRateReview1,
                              userMessage: "MyReviews",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => CoupanScreen());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgCoupon1,
                              userMessage: "Coupon offers",
                            ),
                          ),

                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgShop1,
                          //   userMessage: "Followed_shops".tr,
                          // ),
                          // SizedBox(height: 26.v),
                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgHistory1,
                          //   userMessage: "Browsing history",
                          // ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => ShippingAddress());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgBagPrimary,
                              userMessage: "Address ",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => NotificationsOneScreen());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgNotification1,
                              userMessage: "Notifications",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => EnglishLanguageSwitch());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: 'assets/images/lang2.png',
                              userMessage: "Language ",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => CustomerSupport());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgSupport1,
                              userMessage: "Customer support",
                            ),
                          ),
                          SizedBox(height: 26.v),

                          _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgSettingPrimary,
                            userMessage: "Settings",
                          ),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                            onPressed: () async {
                              await clearSharedPreferences();

                              // Get.offAll(() => ChooseLanguageScreen());
                            },
                            text: "Logout",
                            margin: EdgeInsets.symmetric(horizontal: 10.h),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: CustomIconButton(
            onTap: () {
              Get.offAll(TabScreen(index: 0));
            },
            height: 40.adaptSize,
            width: 40.adaptSize,
            decoration: IconButtonStyleHelper.fillGrayTL20,
            child: Center(
                child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ))),
      ),
      title: AppbarSubtitle(
        text: "My Profile",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }

  /// Common widget
  Widget _buildMessageOne(
    BuildContext context, {
    required String userImage,
    required String userMessage,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: userImage,
          height: 25.adaptSize,
          width: 25.adaptSize,
          color: Color(0xffff8300),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 5.v,
            bottom: 2.v,
          ),
          child: Text(
            userMessage,
            style: CustomTextStyles.bodyLarge18.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgVectorGray9000111x6,
          height: 11.v,
          width: 6.h,
          margin: EdgeInsets.symmetric(vertical: 7.v),
        ),
      ],
    );
  }

  Future<void> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => SplashScreen());
    print('data clearrrerererererererererre');
  }
}
