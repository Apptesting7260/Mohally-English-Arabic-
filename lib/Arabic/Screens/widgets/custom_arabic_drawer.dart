import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/AboutUs/aboutus_arabic.dart';
import 'package:mohally/Arabic/Screens/Arabic_Contactus/arabic_contactus.dart';
import 'package:mohally/Arabic/Screens/Arabic_SpinWheel/arabic_spinwheel.dart';
import 'package:mohally/Arabic/Screens/Arabic_whishlishScreen/arabic_whishlish.dart';
import 'package:mohally/Arabic/Screens/Myprofile/Membership/arabic_membership.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/arabic_my_order.dart';
import 'package:mohally/Arabic/Screens/Myprofile/my_profile_arabic.dart';
import 'package:mohally/Arabic/Screens/PrivacyPolicy/arabic_privacyPolicy.dart';
import 'package:mohally/Arabic/Screens/TermsAndCondition/arabic_terms.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/custom_checkbox_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class DrawerDraweritem_arabic extends StatefulWidget {
  DrawerDraweritem_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<DrawerDraweritem_arabic> createState() =>
      _DrawerDraweritem_arabicState();
}

class _DrawerDraweritem_arabicState extends State<DrawerDraweritem_arabic> {
  final _controller = Get.put(MyAccountController());
  @override
  void initState() {
    // Ensure that the initial locale is set when the screen initializes
    // setInitialLocale();

    super.initState();
    _controller.fetchMyAccountData();
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
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
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
                height: Get.height * .2,
                width: Get.width * .3,
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
                        "   بيت",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => MyProfilePage_arabic(
                        showAppBar: true,
                      ));
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
                        "   حساب تعريفي",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => AboutUsScreen_arabic());
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
                        "   معلومات عنا",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => MyOrdersTab_arabic());
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
                        "   طلب",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => WishlistPage_arabic(
                        showAppBar: true,
                      ));
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
                        "   قائمة الرغبات",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => MembershipScreen_arabic());
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
                        "   عضوية",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => SpinTheWheelOneScreen_arabic());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: "assets/images/raffele.png",
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 5.v, bottom: 2.v),
                      child: Text(
                        "   السحب للفوز",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => PrivacyPolicy_arabic());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.privacy,
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 5.v, bottom: 2.v),
                      child: Text(
                        "   سياسة الخصوصية",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => ContactUs_arabic());
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/contactus_drawer.png',
                      height: 25.v,
                      width: 25.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 5.v, bottom: 2.v),
                      child: Text(
                        "   اتصل بنا",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () {
                  Get.to(() => TermsConditions_arabic());
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.termss,
                      height: 28.v,
                      width: 28.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 5.v, bottom: 2.v),
                      child: Text(
                        "   أحكام وشروط",
                        style: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
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
                    padding: EdgeInsets.only(left: 10.h, top: 5.v, bottom: 2.v),
                    child: Text(
                      "   إعدادات",
                      style: TextStyle(
                          color: Color(0xFF272727),
                          fontSize: 16,
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.v),
              GestureDetector(
                onTap: () async {
                  await clearSharedPreferences();
                },
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgLogout,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.h, top: 5.v, bottom: 2.v),
                      child: Text(
                        "   تسجيل خروج",
                        style: TextStyle(
                            color: Color(0xFFFF8300),
                            fontSize: 16,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w400),
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
      text: "رافيل للفوز",
      value: raffleToWin,
      padding: EdgeInsets.symmetric(vertical: 3.v),
      textStyle: TextStyle(
          color: Color(0xFF272727),
          fontSize: 16,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w400),
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
    print('=====d=a=t=a=========c=l=e=a=r=====');
  }
}
