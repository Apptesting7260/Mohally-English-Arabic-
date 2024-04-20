import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_login_controller.dart.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_forgetPassword.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_signup.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';

RxBool loginbuttonused = false.obs;
String? loginemail;
String? loginPassword;

class LoginScreen_arabic extends StatefulWidget {
  LoginScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<LoginScreen_arabic> createState() => _LoginScreen_arabicState();
}

class _LoginScreen_arabicState extends State<LoginScreen_arabic> {
  arabic_Login_controller login_controller = Get.put(arabic_Login_controller());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  void initState() {
    login_controller.emailController.value.clear();
    login_controller.passwordController.value.clear();
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 22.v,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 36.v),
                    Text("تسجيل الدخول",
                        style: TextStyle(
                            fontFamily: 'Almarai',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26)
                        // theme.textTheme.headlineLarge,
                        ),
                    SizedBox(height: 15.v),
                    Container(
                      width: 268.h,
                      margin: EdgeInsets.only(
                        left: 22.h,
                        right: 23.h,
                      ),
                      child: Text(
                          'لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد.',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                    ),
                    SizedBox(height: 40.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('رقم الجوال أو البريد الإلكتروني',
                          style: TextStyle(
                              fontFamily: 'Almarai',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                    ),
                    SizedBox(height: 9.v),
                    _buildMobileNumber(context),
                    SizedBox(height: 9.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('كلمة المرور',
                          style: TextStyle(
                              fontFamily: 'Almarai',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                    ),
                    SizedBox(height: 9.v),
                    _buildPassword(context),
                    SizedBox(height: 20.v),
                    _buildContinueButton(context),
                    SizedBox(height: 12.v),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Forgot_arabic());
                      },
                      child: Center(
                        child: Text(
                          'هل نسيت كلمة السر',
                          style: TextStyle(
                                  fontFamily: 'Almarai',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)
                              .copyWith(color: Color(0xffFF8300)),
                        ),
                      ),
                    ),
                    SizedBox(height: 27.v),
                    Text(
                      'أو',
                      style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    SizedBox(height: 27.v),
                    _buildContinueWithGoogleButton(context),
                    SizedBox(height: 14.v),
                    _buildContinueWithFacebookButton(context),
                    SizedBox(height: 14.v),
                    _buildContinueWithAppleButton(context),
                    SizedBox(height: 14.v),
                    Container(
                      width: 297.h,
                      padding: EdgeInsets.only(top: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10.h),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'من خلال الاستمرار، فإنك توافق على لدينا',
                              style: TextStyle(
                                  fontFamily: 'Almarai',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            TextSpan(
                                text: 'شروط الاستخدام',
                                style: TextStyle(
                                  fontFamily: 'Almarai',
                                  color: Color(0xffff8300),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                            TextSpan(
                              text: '  و',
                              style: TextStyle(
                                  fontFamily: 'Almarai',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            TextSpan(
                                text: '.سياسة الخصوصية وملفات تعريف الارتباط',
                                style: TextStyle(
                                  fontFamily: 'Almarai',
                                  color: Color(0xffff8300),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 77.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'ليس لديك حساب بعد؟',
                            style: TextStyle(
                                fontFamily: 'Almarai',
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => SignUpScreen_arabic());
                                // Handle the tap gesture
                                print('TextSpan tapped!');
                              },
                            text: 'اصنع واحدا',
                            style: TextStyle(
                                fontFamily: 'Almarai',
                                color: Color(0xffff8300),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMobileNumber(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!) && !isPhone(value)) {
          return 'الرجاء إدخال بريد إلكتروني أو رقم هاتف صالح.';
        }
        return null;
      },
      autofocus: false,
      controller: login_controller.emailController.value,
      hintText: 'أدخل رقم الجوال أو البريد الإلكتروني',
      hintStyle: TextStyle(fontFamily: 'Almarai'),

      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,

      hintTextDirection: TextDirection.ltr, // Set hint text alignment
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      obscureText: !_passwordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال كلمة المرور';
        } else if (login_controller.passwordController.value.length < 6) {
          return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل. ';
        } else {
          return null;
        }
      },
      autofocus: false,
      controller: login_controller.passwordController.value,
      hintText: '      ادخل رقمك السري',
      hintStyle: TextStyle(fontFamily: 'Almarai'),
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: IconButton(
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
        icon: Icon(
          _passwordVisible
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        color: Color(0xffff8300),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.v,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 17.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        loading: login_controller.loading.value,
        onPressed: () {
          // Get.to(()=>VerificationCodeScreen
          //   (controller:TextEditingController() ,pinPutFocusNode:FocusNode() ,)
          // );
          // Get.to(() => TabScreen(index: 0));
          {
            if (!_formKey.currentState!.validate()) {
              return;
            } else {
              login_controller.loading.value = true;
              login_controller.arabic_Login_apihit(context);
              _formKey.currentState!.save();
            }
          }
        },
        buttonTextStyle: TextStyle(
            fontFamily: 'Almarai',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18),
        text: 'يكمل',
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    });
  }

  /// Section Widget
  Widget _buildContinueWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: 'تابع مع جوجل  ',
      leftIcon: Container(
        margin: EdgeInsets.only(left: 10.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      buttonTextStyle: TextStyle(
          fontFamily: 'Almarai',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      buttonStyle: CustomButtonStyles.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildContinueWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
      text: '   تواصل مع الفيسبوك',
      leftIcon: Container(
        margin: EdgeInsets.only(right: 35.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgImage20,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      buttonTextStyle: TextStyle(
          fontFamily: 'Almarai',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      buttonStyle: CustomButtonStyles.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildContinueWithAppleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: '  تواصل مع التفاح',
      leftIcon: Container(
        margin: EdgeInsets.only(right: 5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup,
          height: 20.v,
          width: 16.h,
        ),
      ),
      buttonTextStyle: TextStyle(
          fontFamily: 'Almarai',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      buttonStyle: CustomButtonStyles.outlineGray,
    );
  }

  checkvalidate() {}
  // CrossAxisAlignment getCrossAxisAlignment(BuildContext context) {
  //   // Check if the current locale is Arabic
  //   if (Localizations.localeOf(context).languageCode == 'ar') {
  //     return CrossAxisAlignment.end; // Align to the right for Arabic
  //   } else {
  //     return CrossAxisAlignment.start; // Align to the left for other languages
  //   }
  // }
}
