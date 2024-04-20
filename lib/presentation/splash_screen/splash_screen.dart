import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/choose_language_screen/choose_language_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer; // Store the Timer reference
  var x;
  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    x = await prefs.getString('token') ??
        ''; // Returns the token or an empty string if it doesn't exist.
  }

  checkuser() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token').toString();
    String lang = prefs.getString('selectedLanguage').toString();
    print("$token=========t==o==k==e==n==================");
    print("$lang=========l==a==n==g==u==a==g==e============");
    if (token == "null") {
      prefs.remove('selectedLanguage');
      Get.to(ChooseLanguageScreen());
    } else if (token != "null" && lang == "Arabic") {
      // Get.offAll(arabic_TabScreen(index: 0,));
      print(lang);
      Get.offAll(arabic_TabScreen(
        index: 0,
      ));
    } else if (token != "null" && lang == "English") {
      Get.offAll(TabScreen(
        index: 0,
      ));
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      checkuser();
    });
    super.initState();
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: SizedBox(
          height: mediaQueryData.size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage2023110,
                height: 375.adaptSize,
                width: 375.adaptSize,
                alignment: Alignment.center,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgImage2023111,
                height: 375.adaptSize,
                width: 375.adaptSize,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
