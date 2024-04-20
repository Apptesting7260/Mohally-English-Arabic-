import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_forget_password_controller.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

class Forgot_arabic extends StatefulWidget {
  const Forgot_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<Forgot_arabic> createState() => _Forgot_arabicState();
}

class _Forgot_arabicState extends State<Forgot_arabic> {
  arabic_Resetpassword_controller resetpassword_controller =
      Get.put(arabic_Resetpassword_controller());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 45.v),
                Align(
                  alignment: Alignment.center,
                  child: Text("هل نسيت كلمة السر",
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
                SizedBox(height: 17.v),
                Text('بريد إلكتروني',
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18)),
                SizedBox(height: 9.v),
                _buildEmail(context),
                SizedBox(height: 20.v),
                _buildContinueButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkvalidate() {
    print("_send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      resetpassword_controller.loading.value = true;
      resetpassword_controller.arabic_forget_password(context);
      _formKey.currentState!.save();
      // Get.to(() => VerificationCodeScreen(
      //       controller: TextEditingController(),
      //       pinPutFocusNode: FocusNode(),
      //     ));
    }
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (!isEmail(value!)) {
          return 'الرجاء إدخال بريد إلكتروني أو رقم هاتف صالح.';
        }
        return null;
      },
      controller: resetpassword_controller.emailController.value,
      hintText: 'أدخل بريدك الإلكتروني',
      hintStyle: TextStyle(fontFamily: 'Almarai'),
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        loading: resetpassword_controller.loading.value,
        onPressed: () {
          // Get.to(() => VerificationCodeScreen(
          //       controller: TextEditingController(),
          //       pinPutFocusNode: FocusNode(),
          //     ));
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
}
