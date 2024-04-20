import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/CouponController/couponcodeController.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';

class CoupanScreen extends StatefulWidget {
  const CoupanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CoupanScreen> createState() => _CoupanScreenState();
}

class _CoupanScreenState extends State<CoupanScreen> {
  CouponCodeController _couponCodeController = CouponCodeController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _couponCodeController.fetchMycouponData();
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Obx(() {
            if (_couponCodeController.rxRequestStatus.value == Status.LOADING) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (_couponCodeController.rxRequestStatus.value ==
                Status.ERROR) {
              return Scaffold(
                  body: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/error2.png',
                  ),
                  Text(
                    "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
                  ),
                ],
              )));
            } else {
              return _couponCodeController.couponlist.value.availableCoupon ==
                          null ||
                      _couponCodeController
                          .couponlist.value.availableCoupon!.isEmpty
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/nocoupon.png'),
                        Text(
                          "No Coupon Available",
                          style: theme.textTheme.headlineMedium?.copyWith(
                              color: Color.fromARGB(73, 0, 0, 0), fontSize: 20),
                        ),
                      ],
                    ))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: _couponCodeController
                                  .couponlist.value.availableCoupon?.length ??
                              0,
                          itemExtent: 90,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(5),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              height: Get.height * .15,
                              width: Get.width * .8,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(37, 158, 158, 158),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.height * .15,
                                    width: Get.width * .2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10)),
                                      color: Color(0xffff8300),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_couponCodeController.couponlist.value.availableCoupon?[index].amount}",
                                        style: theme.textTheme.headlineMedium
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 45),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * .06,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${_couponCodeController.couponlist.value.availableCoupon?[index].type}",
                                        style: theme.textTheme.subtitle1,
                                      ),
                                      Text(
                                        "${_couponCodeController.couponlist.value.availableCoupon?[index].code}",
                                        style: theme.textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width * .08,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Expire At: ${_couponCodeController.couponlist.value.availableCoupon?[index].expireAt}",
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(
                                                color: Colors.grey.shade400),
                                      ),
                                      Gap(5),
                                      // CustomElevatedButton(
                                      //   height: 40.v,
                                      //   width: 100.h,
                                      //   text: "Apply",
                                      //   margin: EdgeInsets.only(left: 8.h),
                                      //   buttonStyle:
                                      //       CustomButtonStyles.fillPrimaryTL15,
                                      //   buttonTextStyle: CustomTextStyles
                                      //       .labelLargeWhiteA70002_1,
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }));
            }
          })),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
        text: "Coupan & Offers",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
