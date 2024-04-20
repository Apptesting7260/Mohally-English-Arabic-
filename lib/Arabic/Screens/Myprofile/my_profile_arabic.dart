// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Screens/ArabicLanguageSwitchScreen/arabic_language_switch_screen.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_HomeTab.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/Arabic/Screens/CustomerSupport/arabic_customersupport.dart';
import 'package:mohally/Arabic/Screens/MyAccount/arabic_myaccount.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/arabic_my_order.dart';
import 'package:mohally/Arabic/Screens/Myprofile/MyCoupons/arabic_coupons.dart';
import 'package:mohally/Arabic/Screens/Myprofile/Notifications/arabic_notifications.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_address.dart';
import 'package:mohally/Arabic/Screens/ReviewScreen/arabic_review.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/choose_language_screen/choose_language_screen.dart';
import 'package:mohally/presentation/my_account/my_account_screen.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class MyProfilePage_arabic extends StatefulWidget {
  final bool showAppBar;

  const MyProfilePage_arabic({Key? key, this.showAppBar = false})
      : super(
          key: key,
        );

  @override
  State<MyProfilePage_arabic> createState() => _MyProfilePage_arabicState();
}

class _MyProfilePage_arabicState extends State<MyProfilePage_arabic> {
  final _controller = Get.put(MyAccountController());

  @override
  void initState() {
    super.initState();
    _controller.fetchMyAccountData();
    setInitialLocale();
  }

  void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }

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
    return Scaffold(
      appBar: widget.showAppBar
          ? CustomAppBar(
              leadingWidth: 80,
              leading: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: CustomIconButton(
                    onTap: () {
                      Get.back();
                      // Get.offAll(TabScreen(index: 0));
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
                text: "ملفي",
                // margin: EdgeInsets.only(left: 10),
              ),
            )
          : CustomAppBar(
              title: AppbarSubtitle(
                text: "ملفي",
                margin: EdgeInsets.only(right: 20),
              ),
            ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
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
                            alignment: Alignment.centerRight,
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
                              alignment: Alignment.centerRight,
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
                              alignment: Alignment.centerRight,
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
                              Get.to(() => MyAccountScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgProfileIcon,
                              userMessage: "حسابي",
                            ),
                          ),
                          // SizedBox(height: 26.v),
                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgMessage1,
                          //   userMessage: "Messages_".tr,
                          // ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => MyOrdersTab_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgBag,
                              userMessage: "طلباتي",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => ReviewsScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgRateReview1,
                              userMessage: "تعليقاتي",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => CoupanScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgCoupon1,
                              userMessage: "عروض القسيمة",
                            ),
                          ),

                          // _buildMessageOne(
                          //   context,
                          //   userImage: ImageConstant.imgShop1,
                          //   userMessage: "Followed_shops".tr,
                          // ),
                          // SizedBox(height: 26.v),
                          // InkWell(
                          //   onTap: () {
                          //     //  Locationtest();
                          //     // Get.to(() => Locationtest());
                          //   },
                          //   child: _buildMessageOne(
                          //     context,
                          //     userImage: ImageConstant.imgHistory1,
                          //     userMessage: "تاريخ التصفح",
                          //   ),
                          // ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => addresses_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgBagPrimary,
                              userMessage: "عنوان ",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => NotificationsOneScreen_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgNotification1,
                              userMessage: "إشعارات",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => ArabicLanguageSwitch());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: 'assets/images/lang2.png',
                              userMessage: "لغة ",
                            ),
                          ),
                          SizedBox(height: 26.v),
                          InkWell(
                            onTap: () {
                              Get.to(() => CustomerSupport_arabic());
                            },
                            child: _buildMessageOne(
                              context,
                              userImage: ImageConstant.imgSupport1,
                              userMessage: "دعم العملاء",
                            ),
                          ),
                          SizedBox(height: 26.v),

                          _buildMessageOne(
                            context,
                            userImage: ImageConstant.imgSettingPrimary,
                            userMessage: "إعدادات",
                          ),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                            onPressed: () async {
                              await clearSharedPreferences();
                            },
                            text: "تسجيل خروج",
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
            right: 10.h,
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
        Icon(Icons.keyboard_arrow_left)
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
