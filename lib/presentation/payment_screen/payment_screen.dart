import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/add_new_card_screen/add_new_card_screen.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_switch.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController johnDueController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController group116Controller = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  bool isSelectedSwitch = false;

  List<String> cardImages =[
 "assets/images/card1.png",
 "assets/images/card2.png",
];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 22.v),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _buildHorizontalScroll(context),
                  _buildcard(context),

                  SizedBox(height: 19.v),
                  _buildAddNewCard(context),
                  SizedBox(height: 27.v),
                  Text(
                    "Card Owner" ,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 9.v),
                  _buildJohnDue(context),
                  SizedBox(height: 17.v),
                  Text(
                    "Card Number",
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 9.v),
                  _buildCardNumber(context),
                  SizedBox(height: 17.v),
                  _buildGroup117(context),
                  SizedBox(height: 20.v),
                  _buildSave(context),
                  SizedBox(height: 30.v),
                  _buildSaveCard(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: (){
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Payment",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScroll(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: _buildCard2(
                context,
                userName: "Mrh Raju",
                visaType: "Visa Classic",
                amount: "5254 **** **** 7690",
                price: "3,763.87",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: _buildCard2(
                context,
                userName: "Mrh Raju",
                visaType: "Visa Classic",
                amount: "5254 **** **** 7690",
                price: "3,763.87",
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddNewCard(BuildContext context) {
    return CustomOutlinedButton(
      text: "Add new card",
      margin: EdgeInsets.only(right: 20.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 7.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgSettings,
          height: 13.adaptSize,
          width: 13.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlinePrimaryTL251,
      buttonTextStyle: CustomTextStyles.bodyLargePrimary17,
      onPressed: () {
        Get.to(AddNewCardScreen());
      },
    );
  }

  /// Section Widget
  Widget _buildJohnDue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: CustomTextFormField(
        controller: johnDueController,
        hintText: "John Due",
      ),
    );
  }

  /// Section Widget
  Widget _buildCardNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: CustomTextFormField(
        controller: cardNumberController,
        hintText: "5254 7634 8734 7690",
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup116(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: group116Controller,
      hintText: "24/24",
    );
  }

  /// Section Widget
  Widget _buildCvv(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: cvvController,
      hintText: "7763",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildGroup117(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EXP",
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 9.v),
              _buildGroup116(context),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CVV",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 9.v),
                _buildCvv(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 4.v,
              bottom: 5.v,
            ),
            child: Text(
              "Save card info",
              style: theme.textTheme.bodyLarge,
            ),
          ),
         CustomSwitch(
  value: isSelectedSwitch,
  onChange: (value) {
// Handle the change in switch state
setState(() {
  isSelectedSwitch = value;
});
  },
),

        ],
      ),
    );
  }

Widget _buildcard(BuildContext context){
  return   CarouselSlider(
  options: CarouselOptions(
autoPlay: false, // Set to true for automatic sliding
aspectRatio: 2.0,
enlargeCenterPage: true,
  ),
  items: cardImages.map((String imageUrl) {
return Builder(
  builder: (BuildContext context) {
 return Container(
   width: MediaQuery.of(context).size.width,
   // margin: EdgeInsets.symmetric(horizontal: 6.0),
   decoration: BoxDecoration(
borderRadius: BorderRadius.all(Radius.circular(10)
),
image: DecorationImage(image: AssetImage(  imageUrl,),
 fit: BoxFit.fill,
)
   ),
   // child: Image.asset(
   //   imageUrl,
   //   fit: BoxFit.cover,
   // ),
 );
  },
);
  }).toList(),
);
  
}

  /// Section Widget
  Widget _buildSaveCard(BuildContext context) {
    return CustomElevatedButton(
      text: "Save Card",
      margin: EdgeInsets.only(
        left: 10.h,
        right: 30.h,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  /// Common widget
  Widget _buildCard2(
    BuildContext context, {
    required String userName,
    required String visaType,
    required String amount,
    required String price,
  }) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 20.v,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: fs.Svg(
                ImageConstant.imgCard2,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 6.v,
                      bottom: 7.v,
                    ),
                    child: Text(
                      userName,
                      style: CustomTextStyles.titleSmallInterWhiteA7000115
                          .copyWith(
                        color: appTheme.whiteA70001,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgFlag,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                  ),
                ],
              ),
              SizedBox(height: 39.v),
              Text(
                visaType,
                style: CustomTextStyles.labelLargeInterWhiteA70001.copyWith(
                  color: appTheme.whiteA70001,
                ),
              ),
              SizedBox(height: 7.v),
              Text(
                amount,
                style: CustomTextStyles.bodyMediumInterWhiteA70001.copyWith(
                  color: appTheme.whiteA70001,
                ),
              ),
              SizedBox(height: 13.v),
              Text(
                price,
                style: CustomTextStyles.titleSmallInterWhiteA70001.copyWith(
                  color: appTheme.whiteA70001,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
