// ignore_for_file: unused_import
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/view_models/controller/reset_password/reset_password_controller.dart';
import 'package:mohally/view_models/controller/resetpasswordotp_controller/verificationOtp_controller.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page_one_tab_container_page/home_page_one_tab_container_page.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import '../home_page_tab_container_screen/home_page_tab_container_screen.dart';
import '../tab_screen/tab_bar.dart';

RxBool otpbuttonused = false.obs;

// ignore: must_be_immutable
class VerificationCodeScreen extends StatefulWidget {
  String? emailText;

  final FocusNode? pinPutFocusNode;
  final TextEditingController? controller;
  VerificationCodeScreen(
      {Key? key,
       this.controller,
       this.emailText,
       this.pinPutFocusNode})
      : super(
          key: key,
        );

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  Resetpassword_controller resend =Get.put(Resetpassword_controller());
  VerificationOTP_controller resetpasswordOTP_controller =
      Get.put(VerificationOTP_controller());
  RxInt waitOtp = 60.obs;
  RxBool waitOtpShow = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode _pinPutFocusNode = FocusNode();

  waitOtpUpdate() {
    waitOtpShow.value = true;
    Future.delayed(Duration(seconds: 1), () {
      if (waitOtp.value > 0) {
        waitOtp.value--;

        waitOtpUpdate();
      } else {
        waitOtpShow.value = false;
      }
    });
  }


void resendOtp() async {
  try {
     resetpasswordOTP_controller.loading.value = true;
    // Get the email from the widget
    String? email = widget.emailText;
 SharedPreferences prefs = await SharedPreferences.getInstance();

    String language = prefs.getString('selectedLanguage') ?? "";
    // Call the resendOtp method from the controller
    bool success = await resend.resendOtp(email!,language );
    // Show a snackbar based on the response
    if (success) {
      Utils.snackBar(context ,'Success', 'OTP resend successfully');
       resetpasswordOTP_controller.pinController.value.clear();
        resetpasswordOTP_controller.loading.value = false;

    } else {
      Utils.snackBar(context ,'Error', 'Failed to resend OTP');
       resetpasswordOTP_controller.loading.value = false;

    }
  } catch (error) {
    print("Error: $error");
    Utils2.snackBar('Error', 'Failed to resend OTP');
  }
}
  @override
  void initState() {
    resetpasswordOTP_controller.pinController.value.clear();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    resetpasswordOTP_controller.ResetpasswordOTP_apihit(context);
    resetpasswordOTP_controller.pinController.value.dispose();
    // pinController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: TextStyle(
          fontSize: 20, color: Color(0xffFF8300), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFF8300)),
        borderRadius: BorderRadius.circular(30),
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              height: Get.height,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 45.v,
              ),
              child: 
              Column(
                children: [
                  SizedBox(height: 10.v),
                  Text(
                    'Verification Code',
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 19.v),
                  Container(
                    width: 261.h,
                    margin: EdgeInsets.symmetric(horizontal: 50.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:'Please type the verification code sent to',
                            style: CustomTextStyles.bodyLargeGray50001_2,
                          ),
                           TextSpan(
                          text:'\n',
                           
                        ),
                        TextSpan(
                          text:'\n',
                           
                        ),
                          TextSpan(
                            text: varificationemail,
                            style: CustomTextStyles.titleMediumPrimary16_1,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 36.v),
                 
                  Pinput(
                    validator:(value) {
                        if (value!.isEmpty) {
                          return "The otp field is required.";
                        }
                        return null; },
                    length: 6,
                    autofocus: false,
                    useNativeKeyboard: true,
                    keyboardType: TextInputType.number,
                    defaultPinTheme: defaultPinTheme,
                    onSubmitted: (String pin) => _showSnackBar(pin, context),
                    focusNode: _pinPutFocusNode,
                    controller: resetpasswordOTP_controller.pinController.value,
                    submittedPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme,
                    followingPinTheme: defaultPinTheme,
                    errorTextStyle: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'League Spartan', fontSize: 10, color: Colors.red),
                  ),
                        
                  SizedBox(height: 20.v),
                  Obx((){
                    return CustomElevatedButton(
                      loading: resetpasswordOTP_controller.loading.value,
                      onPressed: 
                      () {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  } 
                                      else {
                                 resetpasswordOTP_controller.loading.value=true;
                                 resetpasswordOTP_controller
                                      .ResetpasswordOTP_apihit(context);
                                      _pinPutFocusNode.unfocus();
                                        formKey.currentState!.save();
                                  }
                                  },
                      text: 'Verify',
                      margin: EdgeInsets.symmetric(horizontal: 24.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                    );
                  }
                         
                  ),
                  SizedBox(height: 24.v),
                  InkWell(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:'I don\'t receive a code!',
                            style: CustomTextStyles.bodyLargeLight,
                          ),
                          TextSpan(
                            text: "Resend",
                            style: CustomTextStyles.titleMediumPrimary,
                            
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    onTap: (){
                      resendOtp();
                    },
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
  // Widget _buildVerificationCodeGrid(BuildContext context) {
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       mainAxisExtent: 47.v,
  //       crossAxisCount: 3,
  //       mainAxisSpacing: 6.h,
  //       crossAxisSpacing: 6.h,
  //     ),
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: 9,
  //     itemBuilder: (context, index) {
  //       return VerificationcodegridItemWidget();
  //     },
  //   );
  // }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
           'Pin Submitted. Value:$pin'.tr,
            style: const TextStyle(fontSize: 25.0),
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
