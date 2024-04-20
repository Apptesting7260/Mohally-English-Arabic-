import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_add_new_address.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_edit_address.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class ShippingaddressesItemWidget_arabic extends StatefulWidget {
  const ShippingaddressesItemWidget_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<ShippingaddressesItemWidget_arabic> createState() =>
      _ShippingaddressesItemWidget_arabicState();
}

class _ShippingaddressesItemWidget_arabicState
    extends State<ShippingaddressesItemWidget_arabic> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.all(10.h),
                  decoration: AppDecoration.fillGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 9.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 9.v,
                                bottom: 1.v,
                              ),
                              child: Text(
                                "جين دو",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(fontFamily: 'Almarai'),
                              ),
                            ),
                            CustomElevatedButton(
                              height: 28.v,
                              width: 56.h,
                              text: "يحرر",
                              onPressed: () {
                                Get.to(EditAddress_arabic());
                              },
                              leftIcon: Container(
                                margin: EdgeInsets.only(right: 4.h),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgEditWhiteA70002,
                                  height: 12.adaptSize,
                                  width: 12.adaptSize,
                                ),
                              ),
                              buttonTextStyle:
                                  CustomTextStyles.bodySmallWhiteA70002,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Container(
                        width: 239.h,
                        margin: EdgeInsets.only(
                          left: 10.h,
                          right: 10.h,
                        ),
                        child: Text(
                            "3 نيوبريدج كورت \nتشينو هيلز، كاليفورنيا 91709، الولايات المتحدة",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontFamily: 'Almarai',
                            )),
                      ),
                      SizedBox(height: 1.v),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStatePropertyAll(Color(0xffff8300)),
                              activeColor: Color(0xffff8300),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.h,
                                top: 3.v,
                              ),
                              child: Text(
                                "استخدم كعنوان الشحن",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Almarai',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.v),
                    ],
                  ),
                )),
            SizedBox(height: 30.v),
            _buildSaveAddressButton(context),
          ],
        ));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
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
        text: "عناوين الشحن",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  Widget _buildSaveAddressButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Get.to(() => add_new_Address_arabic());
      },
      text: "إضافة عنوان جديد",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
      ),
      buttonTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
