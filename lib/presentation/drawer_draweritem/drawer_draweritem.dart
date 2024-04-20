// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/Contactus/contactUs.dart';
import 'package:mohally/presentation/about_us_screen/about_us.dart';
import 'package:mohally/presentation/choose_language_screen/choose_language_screen.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/my_profile_page/my_profile_page.dart';
import 'package:mohally/presentation/payment_screen/payment_screen.dart';
import 'package:mohally/presentation/privacy_policy/privacy_policy.dart';
import 'package:mohally/presentation/spin_the_wheel_one_screen/spin_the_wheel_one_screen.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/presentation/terms_conditions/terms_condition_screen.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/custom_checkbox_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../membership_screen/membership_screen.dart';
import '../my_orders_tab_container_screen/my_orders_tab_container_screen.dart';
import '../wishlist_page/wishlist_page.dart';

// ignore_for_file: must_be_immutable
class DrawerDraweritem extends StatefulWidget {
  DrawerDraweritem({Key? key})
      : super(
          key: key,
        );

  @override
  State<DrawerDraweritem> createState() => _DrawerDraweritemState();
}

class _DrawerDraweritemState extends State<DrawerDraweritem> {
  final _controller = Get.put(MyAccountController());
  @override
  void initState() {
    _controller.fetchMyAccountData();

    super.initState();
  }

  // Function to set the initial locale
  // void setInitialLocale() {
  //   if (Get.locale == null || Get.locale?.languageCode == 'ar') {
  //     Get.updateLocale(Locale('ar', 'DZ'));
  //   } else {
  //     Get.updateLocale(Locale('en', 'US'));
  //   }
  // }

  bool raffleToWin = false;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        width: 243.h,
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 40.v,
        ),
        decoration: AppDecoration.fillWhiteA,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                onTap: () {
                  Get.back();
                },
                imagePath: ImageConstant.imgMenu,
                height: 40.adaptSize,
                width: 40.adaptSize,
              ),
              SizedBox(height: 30.v),
              Container(
                height: height * .2,
                width: width * .3,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      _controller.MyAccount.value.userDetails?.imageUrl),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 7.v),
              Obx(() {
                return Text(
                  "${_controller.MyAccount.value.userDetails?.firstName.toString()}",
                  // "Name",
                  style: theme.textTheme.titleLarge,
                );
              }),
              SizedBox(height: 5.v),
              Obx(() {
                return Text(
                  "${_controller.MyAccount.value.userDetails?.email.toString()}",
                  // "Name",
                  style: theme.textTheme.bodyMedium,
                );
              }),
              // Text(
              //   "John Due",
              //   style: theme.textTheme.titleLarge,
              // ),
              // SizedBox(height: 5.v),
              // Text(
              //   "examplejohn@gmail.com",
              //   style: theme.textTheme.bodyMedium,
              // ),
              SizedBox(height: 36.v),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup239402,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Home",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => MyProfilePage());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgProfileIcon,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Profile",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => AboutUsScreen());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgAboutIcon,
                      height: 28.adaptSize,
                      width: 28.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "About Us",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => MyOrdersTabContainerScreen());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgBag,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Order",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => WishlistPage(showAppBar: true));
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgHeart,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Wishlist",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => MembershipScreen());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCrown1,
                      height: 20.v,
                      width: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Membership",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => SpinTheWheelOneScreen());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/raffele.png",
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Raffle to win",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => PrivacyPolicy());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.privacy,
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Privacy Policy",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => ContactUs());
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/contactus_drawer.png',
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Contact Us",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => TermsConditions());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.termss,
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Terms and Condition",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),

              // GestureDetector(
              //   onTap: (){
              //     Get.to(()=>TermsConditions());
              //   },
              //   child: _buildMessageOne(
              //     context,
              //     userImage: ImageConstant.imgSupport1,
              //     userMessage: "Terms and Conditions",
              //   ),
              // ),
              // SizedBox(height: 26.v),
              // GestureDetector(
              //   onTap: (){
              //     Get.to(()=>PrivacyPolicy());
              //   },
              //   child: _buildMessageOne(
              //     context,
              //     userImage: ImageConstant.imgSupport1,
              //     userMessage: "Privacy Policy",
              //   ),
              // ),
              // SizedBox(height: 26.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSettingPrimary,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 5.v,
                      bottom: 2.v,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Settings",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () async {
                  await clearSharedPreferences();

                  // Get.offAll(() => LoginScreen());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLogout,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 2.v,
                      ),
                      child: Text(
                        "Logout",
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRaffleToWin(BuildContext context) {
    return CustomCheckboxButton(
      text: "Raffele To Win",
      value: raffleToWin,
      padding: EdgeInsets.symmetric(vertical: 3.v),
      textStyle: CustomTextStyles.bodyLarge18,
      onChange: (value) {
        raffleToWin = value;
      },
    );
  }

  Future<void> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    prefs.remove("token");
    prefs.remove("selectedLanguage");
    Get.offAll(() => SplashScreen());
    print('data clearrrerererererererererre');
  }
}
