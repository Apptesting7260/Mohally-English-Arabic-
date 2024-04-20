import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicLanguageSwitch extends StatefulWidget {
  const ArabicLanguageSwitch({Key? key}) : super(key: key);

  @override
  State<ArabicLanguageSwitch> createState() => _ArabicLanguageSwitchState();
}

class _ArabicLanguageSwitchState extends State<ArabicLanguageSwitch> {
  void _updateLanguageAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (showCheckMarkEnglish) {
      await prefs.setString('selectedLanguage', 'English');
      await prefs.getString('token').toString();
      print(prefs.getString('token').toString());
      Get.offAll(() => TabScreen(index: 0));
    } else {
      await prefs.setString('selectedLanguage', 'Arabic');
      await prefs.getString('token').toString();
      Get.offAll(() => arabic_TabScreen(index: 0));
    }
  }

  String languageSelectedText = "عربي";
  String languageSelectedSubtitle = "اللغة مختارة";
  bool showCheckMarkEnglish = true;
  bool showCheckMarkArabic = false;

  @override
  void initState() {
    super.initState();
    _checkStoredLanguage();
  }

  void _checkStoredLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLanguage = prefs.getString('selectedLanguage');
    if (storedLanguage != null) {
      setState(() {
        languageSelectedText = storedLanguage;
        if (storedLanguage == 'Arabic') {
          showCheckMarkEnglish = false;
          showCheckMarkArabic = true;
        } else {
          showCheckMarkEnglish = true;
          showCheckMarkArabic = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageSelectedText,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    // fontSize: 18,
                    color: Color(0xffff8300),
                  ),
                ),
                Text(
                  languageSelectedSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    // fontSize: 18,
                    color: Color.fromARGB(104, 0, 0, 0),
                  ),
                ),
                SizedBox(
                  height: Get.height * .06,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showCheckMarkEnglish = false;
                            showCheckMarkArabic = true;
                            languageSelectedText = "عربي";
                            languageSelectedSubtitle = "اللغة مختارة";
                          });
                        },
                        child: Container(
                          height: Get.height * .3,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(139, 255, 132, 0),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // color of the shadow
                                spreadRadius: 5, // spread radius
                                blurRadius: 7, // blur radius
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/shape.png',
                                        color: Color(0xFFEF4511E),
                                        height: Get.height * .2,
                                        width: Get.width * .3,
                                      ),
                                      Positioned(
                                        top: 10,
                                        bottom: 20,
                                        left: 40,
                                        child: Center(
                                          child: Text(
                                            'ع',
                                            style: theme.textTheme.displayMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                              // fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          'language',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            // fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Arabic',
                                          style: theme.textTheme.bodyLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    // fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  maxLines: 3,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (showCheckMarkArabic)
                      Positioned(
                          top: -2,
                          right: -5,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_circle_sharp,
                              color: Color(0xFFEF4511E),
                              size: 20,
                            ),
                          )),
                  ],
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showCheckMarkEnglish = true;
                            showCheckMarkArabic = false;
                            languageSelectedText = "English";
                            languageSelectedSubtitle = "language Selected";
                          });
                        },
                        child: Container(
                          height: Get.height * .3,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(139, 255, 132, 0),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // color of the shadow
                                spreadRadius: 5, // spread radius
                                blurRadius: 7, // blur radius
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/shape.png',
                                        color: Color(0xFFEF4511E),
                                        height: Get.height * .2,
                                        width: Get.width * .3,
                                      ),
                                      Positioned(
                                        top: 10,
                                        bottom: 20,
                                        left: 40,
                                        child: Center(
                                          child: Text(
                                            'A',
                                            style: theme.textTheme.displayMedium
                                                ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                              // fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          'language',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            // fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'English',
                                          style: theme.textTheme.bodyLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    // fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  maxLines: 3,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (showCheckMarkEnglish)
                      Positioned(
                          top: -2,
                          right: -5,
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_circle_sharp,
                              color: Color(0xFFEF4511E),
                              size: 20,
                            ),
                          )
                          // : SizedBox(), // Empty container when check mark is not shown
                          ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                CustomOutlinedButton(
                  text: "Update Language",
                  margin: EdgeInsets.symmetric(horizontal: 30.h),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL25,
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
                  alignment: Alignment.center,
                  onPressed: () {
                    _updateLanguageAndNavigate();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
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
        text: "لغة",
        // margin: EdgeInsets.only(left: 10),
      ),
    );
  }
}
