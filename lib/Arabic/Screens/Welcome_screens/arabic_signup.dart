// ignore_for_file: unused_import
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_signupController.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/view_models/controller/signUp/signup_controller.dart';
import 'package:mohally/view_models/controller/user_verify_controller/user_verify_controller.dart';
import 'package:mohally/view_models/controller/verify_email/verify_email_controller.dart';
import 'package:mohally/view_models/controller/verifyemailotp_controller/verifyemailotp_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';

RxString countryCode = '+1'.obs;

class SignUpScreen_arabic extends StatefulWidget {
  SignUpScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignUpScreen_arabic> createState() => _SignUpScreen_arabicState();
}

class _SignUpScreen_arabicState extends State<SignUpScreen_arabic> {
  arabic_Signup_controller signup_controller =
      Get.put(arabic_Signup_controller());
  VerifyEmailOTP_controller verifyemailOTP_controller =
      Get.put(VerifyEmailOTP_controller());
  Verifyemail_controller verifyemail_controller =
      Get.put(Verifyemail_controller());
  UserVerify_controller userVerify_controller =
      Get.put(UserVerify_controller());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode _mobilePinPutFocusNode = FocusNode();
  FocusNode _emailPinPutFocusNode = FocusNode();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // signup_controller.loading=true;
    signup_controller.arabic_signup_apihit(context);
    _formKey.currentState!.save();
  }

  String email = " ";
  String mobile = " ";
  RxBool verifyemail = false.obs;
  RxBool verifyphone = false.obs;
  bool _passwordVisible = true;
  bool isEmail(String email) {
    // Regular expression to validate email format
    // final emailRegExp =
    //     RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(?:com)$');

    // Check if email matches the regular expression and contains "@" and ".com"
    if (email.contains('@') && email.endsWith('.com')) {
      return true;
    }
    return false;
  }

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  void initState() {
    signup_controller.countryController.value.text = 'IN';
    verifyemailOTP_controller.pinController.value.clear();
    signup_controller.firstNameController.value.clear();
    signup_controller.lastNameController.value.clear();
    signup_controller.passwordController.value.clear();
    signup_controller.emailController.value.clear();
    signup_controller.phoneController.value.clear();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Color(0xffFF8300), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF8300)),
        borderRadius: BorderRadius.circular(30),
      ),
    );

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 59.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 30.h,
                          right: 30.h,
                          bottom: 26.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text('اشتراك',
                                  style: TextStyle(
                                      fontFamily: 'Almarai',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26)),
                            ),
                            SizedBox(height: 15.v),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
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
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16)),
                              ),
                            ),
                            SizedBox(height: 41.v),
                            Text('الاسم الأول',
                                style: TextStyle(
                                    fontFamily: 'Almarai',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            SizedBox(height: 9.v),
                            _buildFirstName(context),
                            SizedBox(height: 17.v),
                            Text('اسم العائلة',
                                style: TextStyle(
                                    fontFamily: 'Almarai',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            SizedBox(height: 9.v),
                            _buildLastName(context),
                            SizedBox(height: 17.v),
                            Text('البلد/المنطقة',
                                style: TextStyle(
                                    fontFamily: 'Almarai',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            SizedBox(height: 9.v),
                            _buildCountry(context),
                            SizedBox(height: 17.v),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('رقم الهاتف المحمول',
                                    style: TextStyle(
                                        fontFamily: 'Almarai',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                                CustomElevatedButton(
                                  height: 28.v,
                                  width: Get.width * .3,
                                  text: "Change Number",
                                  leftIcon: Container(
                                    // margin: EdgeInsets.only(right: 4.h),
                                    child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgEditWhiteA70002,
                                      height: 12.adaptSize,
                                      width: 20.adaptSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    // Clear the phone controller
                                    signup_controller.phoneController.value
                                        .clear();
                                    // Reset verification status
                                    verifyphone.value = false;
                                    // Update the state to reflect changes
                                    setState(() {});
                                  },
                                  buttonTextStyle:
                                      CustomTextStyles.bodySmallWhiteA70002,
                                ),
                              ],
                            ),
                            SizedBox(height: 9.v),
                            CustomTextFormField(
                              maxLength: 10,
                              enabled: !verifyphone.value,
                              textInputType: TextInputType.phone,
                              onChanged: (value) {
                                if (value!.isEmpty) {
                                  verifyphone.value = false;
                                  verifyemailOTP_controller.pinController.value
                                      .clear();
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'الرجاء إدخال رقم الجوال';
                                } else {
                                  return null;
                                }
                              },
                              controller:
                                  signup_controller.phoneController.value,
                              hintText: 'أدخل رقم هاتفك المحمول',
                              hintStyle: TextStyle(fontFamily: 'Almarai'),
                              suffix: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    if (!verifyphone.value) {
                                      verifyemailOTP_controller
                                          .pinController.value
                                          .clear();
                                      // Only perform actions if the phone is not verified
                                      String phoneNumber = signup_controller
                                          .phoneController.value.text;

                                      if (phoneNumber.isEmpty) {
                                        // Display a message indicating that the user should enter a mobile number
                                        Utils.snackBar(context, 'خطأ',
                                            'الرجاء إدخال رقم الجوال');
                                      } else if (phoneNumber.length < 10) {
                                        Utils.snackBar(context, 'خطأ',
                                            'الرجاء إدخال رقم جوال صحيح');
                                      }
                                      if (signup_controller.phoneController
                                              .value.text.isNotEmpty &&
                                          signup_controller.phoneController
                                                  .value.text.length ==
                                              10) {
                                        userVerify_controller.UserVerify_apihit(
                                          signup_controller
                                              .phoneController.value.text
                                              .toString(),
                                        );
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Container(
                                                height: Get.height * .4,
                                                width: 500,
                                                child: Form(
                                                  key: formKey,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 10.v),
                                                      Text(
                                                        'رمز التحقق',
                                                        style: theme.textTheme
                                                            .headlineLarge,
                                                      ),
                                                      SizedBox(height: 19.v),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'الرجاء إدخال رمز التحقق المرسل إلى\n',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12),
                                                            ),
                                                            TextSpan(
                                                              text: '\n',
                                                            ),
                                                            TextSpan(
                                                                text: signup_controller
                                                                    .phoneController
                                                                    .value
                                                                    .text,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xffFE8300),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10)),
                                                            TextSpan(
                                                              text: '\n',
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            verifyemailOTP_controller
                                                                .pinController
                                                                .value
                                                                .clear();

                                                            verifyemail_controller
                                                                .Verifyeusermail_apihit(
                                                                    phoneNumber);
                                                            Utils.snackBar(
                                                                context,
                                                                'Success',
                                                                'OTP Resent Successfully');
                                                          },
                                                          child: Text(
                                                              'إعادة إرسال كلمة المرور',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'Almarai'))),
                                                      SizedBox(height: 36.v),
                                                      Container(
                                                        height:
                                                            Get.height * .04,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Pinput(
                                                          length: 6,
                                                          autofocus: false,
                                                          useNativeKeyboard:
                                                              true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          defaultPinTheme:
                                                              defaultPinTheme,
                                                          onSubmitted:
                                                              (String pin) =>
                                                                  _showSnackBar(
                                                                      pin,
                                                                      context),
                                                          focusNode:
                                                              _mobilePinPutFocusNode,
                                                          controller:
                                                              verifyemailOTP_controller
                                                                  .pinController
                                                                  .value,
                                                          submittedPinTheme:
                                                              defaultPinTheme,
                                                          focusedPinTheme:
                                                              defaultPinTheme,
                                                          followingPinTheme:
                                                              defaultPinTheme,
                                                        ),
                                                      ),
                                                      SizedBox(height: 20.v),
                                                      CustomElevatedButton(
                                                        onPressed: () {
                                                          if (verifyemailOTP_controller
                                                              .pinController
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            // Display an error message indicating that the OTP is required
                                                            Utils.snackBar(
                                                                context,
                                                                'فشل',
                                                                'الرجاء إدخال كلمة المرور لمرة واحدة');
                                                          } else {
                                                            if (userVerify_controller
                                                                    .userList
                                                                    .value
                                                                    .otp
                                                                    .toString() ==
                                                                verifyemailOTP_controller
                                                                    .pinController
                                                                    .value
                                                                    .text) {
                                                              // Set verifyphone.value to true immediately
                                                              verifyphone
                                                                  .value = true;

                                                              if (userVerify_controller
                                                                      .userList
                                                                      .value
                                                                      .otp
                                                                      .toString() ==
                                                                  verifyemailOTP_controller
                                                                      .pinController
                                                                      .value
                                                                      .text) {
                                                                // Email verification logic (if needed)
                                                                Get.back();
                                                                verifyemailOTP_controller
                                                                    .pinController
                                                                    .value
                                                                    .clear();
                                                              }
                                                              // else {
                                                              //   // Display an error message indicating that the OTP is incorrect
                                                              //   Utils.snackBar(context, 'Failed', 'Incorrect OTP. Please try again.');
                                                              //   print('Incorrect OTP');
                                                              // }
                                                            } else {
                                                              // Display an error message indicating that the OTP is incorrect
                                                              Utils.snackBar(
                                                                  context,
                                                                  'فشل',
                                                                  'الرجاء إدخال كلمة المرور الصحيحة');
                                                              print(
                                                                  'Incorrect OTP');
                                                            }
                                                          }
                                                        },
                                                        text: 'يؤكد',
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    24.h),
                                                        buttonStyle:
                                                            CustomButtonStyles
                                                                .fillPrimary,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      Utils.snackBar(context, 'فشل',
                                          'تم التحقق من الهاتف بالفعل');
                                      print('Phone is already verified');
                                    }
                                  },
                                  child: !(verifyphone.value == true)
                                      ? Text(
                                          'التحقق من الجوال',
                                          style: TextStyle(
                                              fontFamily: 'Almarai',
                                              color: Color(0xffFE8300),
                                              fontSize: 12),
                                        )
                                      : Text(
                                          'تم التحقق',
                                          style: TextStyle(
                                              fontFamily: 'Almarai',
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'بريد إلكتروني',
                                  style: theme.textTheme.titleMedium
                                      ?.copyWith(fontFamily: 'Almarai'),
                                ),
                                CustomElevatedButton(
                                  height: 28.v,
                                  width: Get.width * .3,
                                  text: "Change Email",
                                  leftIcon: Container(
                                    child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgEditWhiteA70002,
                                      height: 12.adaptSize,
                                      width: 20.adaptSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    signup_controller.emailController.value
                                        .clear();

                                    verifyemail.value = false;

                                    setState(() {});
                                  },
                                  buttonTextStyle:
                                      CustomTextStyles.bodySmallWhiteA70002,
                                ),
                              ],
                            ),
                            SizedBox(height: 17.v),
                            CustomTextFormField(
                              enabled: !verifyemail.value,
                              onChanged: (value) {
                                if (value!.isEmpty) {
                                  verifyemail.value = false;
                                  // verifyemailOTP_controller.pinController.value.clear();
                                }
                                return null;
                              },
                              // validator: (value) {
                              //   if (!isEmail(email)) {
                              //     return 'يرجى إدخال البريد الإلكتروني الصحيح.';
                              //   }
                              //   return null;
                              // },
                              controller:
                                  signup_controller.emailController.value,
                              hintText: 'أدخل بريدك الإلكتروني',
                              hintStyle: TextStyle(fontFamily: 'Almarai'),
                              textInputType: TextInputType.emailAddress,

                              suffix: Padding(
                                padding:
                                    const EdgeInsets.only(top: 17, left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    String email = signup_controller
                                        .emailController.value.text;
                                    if (email.isEmpty) {
                                      Utils.snackBar(context, 'فشل',
                                          'رجاءا أدخل بريدك الإلكتروني');
                                    } else if (!isEmail(email)) {
                                      Utils.snackBar(context, 'فشل',
                                          'يرجى إدخال البريد الإلكتروني الصحيح');
                                    } else {
                                      // Only perform actions if the email is valid
                                      if (!verifyemail.value) {
                                        verifyemailOTP_controller
                                            .pinController.value
                                            .clear();
                                        verifyemail_controller
                                            .Verifyeusermail_apihit(email);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              // title: Text(
                                              //   "Enter Otp",
                                              //   style: theme.textTheme.titleMedium,
                                              // ),
                                              content: Container(
                                                height: Get.height * .4,
                                                child: Form(
                                                  key: formKey,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 10.v),
                                                      Text(
                                                        'رمز التحقق',
                                                        style: theme.textTheme
                                                            .headlineLarge,
                                                      ),
                                                      SizedBox(height: 19.v),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'الرجاء إدخال رمز التحقق المرسل إلى\n',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12),
                                                            ),
                                                            TextSpan(
                                                              text: '\n',
                                                            ),
                                                            TextSpan(
                                                                text: signup_controller
                                                                    .emailController
                                                                    .value
                                                                    .text,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xffFE8300),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10)),
                                                            TextSpan(
                                                              text: '\n',
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            verifyemailOTP_controller
                                                                .pinController
                                                                .value
                                                                .clear();

                                                            verifyemail_controller
                                                                .Verifyeusermail_apihit(
                                                                    email);
                                                            Utils.snackBar(
                                                                context,
                                                                'Success',
                                                                'OTP Resent Successfully');
                                                          },
                                                          child: Text(
                                                              'Resend Otp',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      14))),
                                                      SizedBox(height: 36.v),
                                                      Container(
                                                        height:
                                                            Get.height * .04,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Pinput(
                                                          length: 6,
                                                          // autofocus: true,
                                                          useNativeKeyboard:
                                                              true,
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          defaultPinTheme:
                                                              defaultPinTheme,
                                                          onSubmitted:
                                                              (String pin) =>
                                                                  _showSnackBar(
                                                                      pin,
                                                                      context),
                                                          focusNode:
                                                              _emailPinPutFocusNode,
                                                          controller:
                                                              verifyemailOTP_controller
                                                                  .pinController
                                                                  .value,
                                                          submittedPinTheme:
                                                              defaultPinTheme,
                                                          focusedPinTheme:
                                                              defaultPinTheme,
                                                          followingPinTheme:
                                                              defaultPinTheme,
                                                        ),
                                                      ),
                                                      SizedBox(height: 20.v),
                                                      CustomElevatedButton(
                                                        onPressed: () {
                                                          otpbuttonused.value =
                                                              true;
                                                          if (verifyemailOTP_controller
                                                              .pinController
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            // Display an error message indicating that the OTP is required
                                                            Utils.snackBar(
                                                                context,
                                                                'فشل',
                                                                'الرجاء إدخال كلمة المرور لمرة واحدة');
                                                          } else {
                                                            if (verifyemail_controller
                                                                    .userList
                                                                    .value
                                                                    .otp
                                                                    .toString() ==
                                                                verifyemailOTP_controller
                                                                    .pinController
                                                                    .value
                                                                    .text) {
                                                              // Set verifyphone.value to true immediately
                                                              verifyemail
                                                                  .value = true;
                                                              print(
                                                                  "${verifyemailOTP_controller.pinController.value.text}===========otp");
                                                              if (verifyemail_controller
                                                                      .userList
                                                                      .value
                                                                      .otp
                                                                      .toString() ==
                                                                  verifyemailOTP_controller
                                                                      .pinController
                                                                      .value
                                                                      .text) {
                                                                print(
                                                                    "${verifyemailOTP_controller.pinController.value.text}===========otp");
                                                                // Email verification logic (if needed)
                                                                Get.back();
                                                                verifyemailOTP_controller
                                                                    .pinController
                                                                    .value
                                                                    .clear();
                                                              }
                                                            } else {
                                                              // Display an error message indicating that the OTP is incorrect
                                                              print(
                                                                  "${verifyemailOTP_controller.pinController.value.text}===========otp");
                                                              Utils.snackBar(
                                                                  context,
                                                                  'فشل',
                                                                  'الرجاء إدخال كلمة المرور الصحيحة');
                                                              print(
                                                                  'Incorrect OTP');
                                                            }
                                                          }
                                                        },
                                                        text: 'يؤكد',
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    24.h),
                                                        buttonStyle:
                                                            CustomButtonStyles
                                                                .fillPrimary,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        Utils.snackBar(context, 'فشل',
                                            'لقد تم بالفعل التحقق من البريد الإلكتروني');
                                      }
                                    }
                                  },
                                  child: !(verifyemail.value == true)
                                      ? Text(
                                          'التحقق من البريد الإلكتروني',
                                          style: TextStyle(
                                              fontFamily: 'Almarai',
                                              color: Color(0xffFE8300),
                                              fontSize: 12),
                                        )
                                      : Text(
                                          'تم التحقق',
                                          style: TextStyle(
                                              fontFamily: 'Almarai',
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Text('كلمة المرور',
                                style: TextStyle(
                                    fontFamily: 'Almarai',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            SizedBox(height: 17.v),
                            _buildPassword(context),
                            SizedBox(height: 20.v),
                            _buildContinueButton(context),
                            SizedBox(height: 109.v),
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'هل لديك حساب؟ ',
                                        style: TextStyle(
                                            fontFamily: 'Almarai',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(() => LoginScreen_arabic());
                                            // Handle the tap gesture
                                            print('TextSpan tapped!');
                                          },
                                        text: "تسجيل الدخول",
                                        style: TextStyle(
                                            fontFamily: 'Almarai',
                                            color: Color(0xffff8300),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
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
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال الاسم الأول';
        } else if (signup_controller.firstNameController.value.length <= 2) {
          return 'يجب أن يتكون الاسم الأول من 3 أحرف على الأقل. ';
        } else if (RegExp(r'[0-9]').hasMatch(value)) {
          // Check if the value contains numbers
          return ' Name should not contain numbers';
        }
        // else if (value.length <= 3) {
        //             return 'يجب أن يتكون الاسم الأول من 3 أحرف على الأقل.';}
        else {
          return null;
        }
      },
      controller: signup_controller.firstNameController.value,
      hintText: 'أدخل اسمك الأول',
      hintStyle: TextStyle(fontFamily: 'Almarai'),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال الاسم الأخير';
        } else if (signup_controller.lastNameController.value.length <= 2) {
          return 'يجب أن يتكون الاسم الأخير من 3 أحرف على الأقل. ';
        } else if (RegExp(r'[0-9]').hasMatch(value)) {
          // Check if the value contains numbers
          return 'Last Name should not contain numbers';
        }
        // else if (value.length <= 3) {
        //             return 'يجب أن يتكون الاسم الأخير من 3 أحرف على الأقل..';}
        else {
          return null;
        }
      },
      controller: signup_controller.lastNameController.value,
      hintText: 'أدخل اسمك الأخير',
      hintStyle: TextStyle(fontFamily: 'Almarai'),
    );
  }

  /// Section Widget
  Widget _buildGroup280(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.h,
          top: 3.v,
        ),
        child: CustomTextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء إدخال رقم الجوال';
            } else {
              return null;
            }
          },
          controller: signup_controller.phoneController.value,
          hintText: 'أدخل رقم هاتفك المحمول',
          hintStyle: TextStyle(fontFamily: 'Almarai'),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup281(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 3.v,
          ),
          child: Text(
            "+880",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ),
        _buildGroup280(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!)) {
          return 'يرجى إدخال البريد الإلكتروني الصحيح.';
        }
        return null;
      },
      controller: signup_controller.emailController.value,
      hintText: 'أدخل بريدك الإلكتروني',
      hintStyle: TextStyle(fontFamily: 'Almarai'),
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      obscureText: !_passwordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال كلمة المرور';
        } else if (signup_controller.passwordController.value.length < 6) {
          return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل.';
        } else {
          return null;
        }
      },
      controller: signup_controller.passwordController.value,
      hintText: '      ادخل رقمك السري                   ',
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
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          )),
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

  Widget _buildCountry(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        readOnly: true,
        controller: signup_controller.countryController.value,
        decoration: InputDecoration(
          prefix: CountryCodePicker(
            padding: EdgeInsets.only(bottom: 1),
            onChanged: (element) {
              signup_controller.countryController.value.text =
                  element.toString();
            },
            initialSelection: 'IN',
            showCountryOnly: false,
            showOnlyCountryWhenClosed: true,
            showDropDownButton: true,
            showFlag: true,
            alignLeft: true,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 17.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Color(0XFFE6E6E6),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Color(0XFFE6E6E6)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Color(0XFFE6E6E6),
            ),
          ),
          filled: true,
          fillColor: Color(0XFFF4F4F4),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        isDisabled: !(verifyemail.value && verifyphone.value),
        loading: signup_controller.loading.value,
        onPressed: () {
          checkvalidate();
        },
        text: 'يكمل',
        buttonTextStyle: TextStyle(
            fontFamily: 'Almarai',
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18),
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    });
  }

  checkvalidate() {
    print("_send".tr);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _submit();
    }
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'تم إرسال الدبوس. قيمة:$pin',
            style: const TextStyle(fontSize: 25.0, fontFamily: 'Almarai'),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}


                          // Align(
                          //   alignment: Alignment.bottomRight,
                          //   child: 
                            
                             

                                            
                                              
                                           
                          //                     // RichText(
                          //                     //   text: TextSpan(
                          //                     //     children: [
                          //                     //       TextSpan(
                          //                     //         text: "I don’t receive a code!",
                          //                     //         style: CustomTextStyles.bodyLargeLight,
                          //                     //       ),
                          //                     //       TextSpan(
                          //                     //         text: "Resend",
                          //                     //         style: CustomTextStyles.titleMediumPrimary,
                          //                     //         // !waitOtpShow.value == true
                          //                     //         //     ? "Resend"
                          //                     //         //     : waitOtp.value.toString(),
                          //                     //         // style: CustomTextStyles.titleMediumPrimary,
                          //                     //         // recognizer: TapGestureRecognizer()
                          //                     //         //   ..onTap = waitOtpShow.value == true
                          //                     //         //       ? () {}
                          //                     //         //       : () {
                          //                     //         //           waitOtp.value = 60;
                          //                     //         //           resetpasswordOTP_controller
                          //                     //         //               .ResetpasswordOTP_apihit();
                          //                     //         //
                          //                     //         //           waitOtpUpdate();
                          //                     //         //         }
                          //                     //       ),
                          //                     //     ],
                          //                     //   ),
                          //                     //   textAlign: TextAlign.left,
                          //                     // ),
                                             
                            
                          // ),























// Widget _buildCountry(BuildContext context){
//   return Container(
//     height: Get.height*.08,
//     width: Get.width*.9,
//     child: TextFormField(
//       //  validator: (value) {
//       //     if (!isEmail(value!)) {
//       //       return 'Please Select Country';
//       //     }
//       //     return null;
//       //   },
//       controller: signup_controller.countryController.value,
//       decoration: InputDecoration(
//      prefix:  CountryCodePicker(
      
    
//                                 padding: EdgeInsets.only(bottom: 1),
//                                onChanged: (element) {
//                      signup_controller.countryController.value.text = element.toString();
//     },
//                                 initialSelection: 'IN',
//                                 showCountryOnly: false,
//                                 showOnlyCountryWhenClosed: true,
//                                 showDropDownButton: true,
//                                 showFlag: true,
//                                 alignLeft: true,
//                               ),
//                               contentPadding:EdgeInsets.symmetric(
//                 horizontal: 15.h,
//                 vertical: 17.v,
//               ),
//                                 focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30.0)),
//                                 borderSide: BorderSide(
//                                   color: Colors.grey,
//                                 )),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30.0)),
//                                 borderSide: BorderSide(
//                                 color: Color(0XFFE6E6E6)
//                                 )),
//                             errorBorder: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30.0)),
//                                 borderSide: BorderSide(color: Color(0XFFE6E6E6),)),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                               borderSide: BorderSide(
//                                color: Color(0XFFE6E6E6),
//                               ),
//                             ),
//                             filled: true,
//                             fillColor: Color(0XFFF4F4F4)
//       ),
     
                              
    
//       //  validator: (value) {
//       //     if (value!.isEmpty) {
//       //       return "Please Select Country ";
//       //     } else {
//       //       return null;
//       //     }
//       //   },
      
//     ),
//   );
// }








//code picker
   // Row(
                          //   children: [
                          //     CountryCodePicker(
                          //       // dialogSize: Size(Get.width * 0.6, Get.height * 0.6),
                          //       onChanged: (_) {
                          //         countryCode.value = _.toString();
                          //       },
                          //       // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          //       initialSelection: 'ca',
                          //       // favorite: ['+39', 'FR'],
                          //       // optional. Shows only country name and flag
                          //       showCountryOnly: false,
                          //       // optional. Shows only country name and flag when popup is closed.
                          //       showOnlyCountryWhenClosed: false,
                          //       // optional. aligns the flag and the Text left
                          //       alignLeft: false,
                          //       // dialogTextStyle: ,
                          //     ),
                          //     Expanded(
                          //       child: TextFormField(
                          //         controller: mobileController,
                          //         keyboardType: TextInputType.phone,
                          //         decoration: InputDecoration(
                          //             filled: true,
                          //             fillColor: Colors.white,
                          //             hintText: "Enter mobile number",
                          //             hintStyle: TextStyle(
                          //                 color: Color(0xff9796A1),
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w300,
                          //
                          //          ),
                          //             contentPadding:
                          //             EdgeInsets.fromLTRB(20, 10, 20, 10),
                          //             enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.circular(30),
                          //                 borderSide:
                          //                 BorderSide(color: Color(0xff9796A1))),
                          //             focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.circular(30),
                          //                 borderSide:
                          //                 BorderSide(color: Color(0xff9796A1))),
                          //             border: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.circular(30),
                          //                 borderSide: BorderSide(
                          //                     color: Color(0xff9796A1)))),
                          //         onFieldSubmitted: (value) {},
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return 'enter mobile number';
                          //           }
                          //           return null;
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),
