// ignore_for_file: unused_import
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/forgot_password/forgot_password_Screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/view_models/controller/login/login_view_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sign_up_screen/sign_up_screen.dart';
import '../verification_code_screen/verification_code_screen.dart';

RxBool loginbuttonused = false.obs;
String? loginemail;
String? loginPassword;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Login_controller login_controller = Get.put(Login_controller());

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
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
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
                  Text(
                    'Sign-in',
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 15.v),
                  Container(
                    width: 268.h,
                    margin: EdgeInsets.only(
                      left: 22.h,
                      right: 23.h,
                    ),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeGray50001_3.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mobile Number or Email',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildMobileNumber(context),
                  SizedBox(height: 9.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildPassword(context),
                  SizedBox(height: 20.v),
                  _buildContinueButton(context),
                  SizedBox(height: 12.v),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Forgot());
                    },
                    child: Center(
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xffFF8300)),
                      ),
                    ),
                  ),
                  SizedBox(height: 27.v),
                  Text(
                    'Or',
                    style: CustomTextStyles.titleMediumMedium_1,
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
                    margin: EdgeInsets.symmetric(horizontal: 9.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing, you agree to our ',
                            style: CustomTextStyles.bodyMediumJostGray90001,
                          ),
                          TextSpan(
                            text: 'Terms of Use',
                            style:
                                CustomTextStyles.titleSmallJostPrimary.copyWith(
                                    // decoration: TextDecoration.underline,
                                    ),
                          ),
                          TextSpan(
                            text: '  and',
                            style: CustomTextStyles.bodyMediumJostGray90001,
                          ),
                          TextSpan(
                            text: '\nPrivacy & Cookie Policy.',
                            style:
                                CustomTextStyles.titleSmallJostPrimary.copyWith(
                                    // decoration: TextDecoration.underline,
                                    ),
                          ),
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
                          text: 'You don\'t have an account yet ?',
                          style: CustomTextStyles.bodyMediumGray90001Light,
                        ),
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => SignUpScreen());
                              // Handle the tap gesture
                              print('TextSpan tapped!');
                            },
                          text: 'Create One',
                          style: CustomTextStyles.titleSmallPrimaryBold,
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
    );
  }

  /// Section Widget
  Widget _buildMobileNumber(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!) && !isPhone(value)) {
          return 'Please enter a valid email or phone number.';
        }
        return null;
      },
      autofocus: false,
      controller: login_controller.emailController.value,
      hintText: 'Enter mobile number or email',
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      obscureText: !_passwordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Password';
        } else if (login_controller.passwordController.value.length < 6) {
          return 'The password must be at least 6 characters. ';
        } else {
          return null;
        }
      },
      autofocus: false,
      controller: login_controller.passwordController.value,
      hintText: 'Enter your password',
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

      // suffix: Container(
      //   margin: EdgeInsets.fromLTRB(12.h, 13.v, 16.h, 13.v),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgIconEye,
      //     height: 24.adaptSize,
      //     width: 24.adaptSize,
      //   ),
      // ),
      suffixConstraints: BoxConstraints(
        maxHeight: 50.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 20.h,
        top: 17.v,
        bottom: 17.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        loading: login_controller.loading.value,
        onPressed: () {
          {
            if (!_formKey.currentState!.validate()) {
              return;
            } else {
              login_controller.loading.value = true;
              login_controller.Login_apihit(context);
              _formKey.currentState!.save();
            }
          }
        },
        text: 'Continue',
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    });
  }

  /// Section Widget
  Widget _buildContinueWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: 'continue with Google',
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogle,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildContinueWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
      text: 'continue with Facbook',
      leftIcon: Container(
        margin: EdgeInsets.only(right: 15.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgImage20,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildContinueWithAppleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: 'continue with apple',
      leftIcon: Container(
        margin: EdgeInsets.only(right: 17.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup,
          height: 20.v,
          width: 16.h,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineGray,
    );
  }

  checkvalidate() {
    print("_send".tr);
  }
  // CrossAxisAlignment getCrossAxisAlignment(BuildContext context) {
  //   // Check if the current locale is Arabic
  //   if (Localizations.localeOf(context).languageCode == 'ar') {
  //     return CrossAxisAlignment.end; // Align to the right for Arabic
  //   } else {
  //     return CrossAxisAlignment.start; // Align to the left for other languages
  //   }
  // }
}
