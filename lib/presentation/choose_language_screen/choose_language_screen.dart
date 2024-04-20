import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/presentation/welcome_screen/arabic_welcomeScreen.dart';
import 'package:mohally/presentation/welcome_screen/welcome_screen.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_radio_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLanguageScreen extends StatefulWidget {
  ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String radioGroup = "";
  String continueButtonText = "Continue";
  // int _value = 1;
  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      radioGroup = prefs.getString('selectedLanguage') ?? "";
      continueButtonText = (radioGroup == "Arabic") ? "يكمل" : "Continue";
      continueButtonText = (radioGroup == "English") ? "Continue" : "يكمل";
      if (radioGroup.isEmpty) {
        setState(() {
          continueButtonText = "Continue";
        });
      }
    });
  }

  Future<void> _saveSelectedLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', language);
  }

  void _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    if (lang == "Arabic") {
      print(
          "$lang=========l==a==n==g==u==a==g==e========s==e==l==e==c==t==e==d===========");
      Get.to(() => arabic_WelcomeScreen());
    } else if (lang == "English") {
      print(
          "$lang=========l==a==n==g==u==a==g==e========s==e==l==e==c==t==e==d===========");
      Get.to(() => WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose language",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 23.v),
              _buildChooseLanguageArabic(context),
              SizedBox(height: 20.v),
              _buildChooseLanguageEnglish(context),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                onPressed: () async {
                  if (radioGroup.isNotEmpty) {
                    await _saveSelectedLanguage(radioGroup);
                    _navigateToNextScreen();
                  } else {
                    Utils.snackBar(context, '',
                        'Please Select a Language\nيرجى تحديد لغة ');
                    print("Please choose a language");
                  }
                },
                text: continueButtonText,
                buttonStyle: CustomButtonStyles.fillPrimary,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  // Section Widget
  Widget _buildChooseLanguageArabic(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img123604121,
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                top: 5.v,
                bottom: 5.v,
              ),
              child: CustomRadioButton(
                width: 240.h,
                text: "Arabic",
                value: "Arabic",
                groupValue: radioGroup,
                isRightCheck: true,
                onChange: (value) {
                  setState(() {
                    //  Get.updateLocale(Locale('ar','DZ'));
                    radioGroup = value;
                    continueButtonText = "يكمل";
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Section Widget
  Widget _buildChooseLanguageEnglish(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img123604122,
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 13.h,
                top: 5.v,
                bottom: 5.v,
              ),
              child: CustomRadioButton(
                width: 240.h,
                text: "English",
                value: "English",
                groupValue: radioGroup,
                isRightCheck: true,
                onChange: (value) {
                  setState(() {
                    Get.updateLocale(Locale('en', 'US'));
                    radioGroup = value;
                    continueButtonText = "Continue";
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
