

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';

class arabic_WelcomeScreen extends StatelessWidget {
  const arabic_WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 52.h,
            vertical: 23.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(
                flex: 51,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgBags,
                height: 210.v,
                width: 217.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 17.h),
              ),
              Spacer(
                flex: 48,
              ),
              Container(
                width: 189.h,
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:"مرحبا بك في\n",
                          style: TextStyle(fontFamily: 'Almarai', color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14)
                      ),
                      TextSpan(
                        text: "موهالي",
                         style: TextStyle(fontFamily: 'Almarai', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40)
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 28.v),
              SizedBox(
                width: 268.h,
                child: Text(
                  'لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                   style: TextStyle(fontFamily: 'Almarai', color: Color.fromARGB(115, 143, 149, 158), fontWeight: FontWeight.bold, fontSize: 12)
                  
                  //  CustomTextStyles.bodyLargeGray50001_1.copyWith(
                  //   height: 1.50,
                    
                  // ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildGetStartedButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildGetStartedButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        //  Get.to(()=>arabic_WelcomeScreen());
        Get.to(()=>LoginScreen_arabic());
      },
      text: "البدء",
      margin: EdgeInsets.only(
        left: 37.h,
        right: 38.h,
        bottom: 56.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
