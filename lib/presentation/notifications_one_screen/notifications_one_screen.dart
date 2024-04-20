import 'package:get/get.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';

class NotificationsOneScreen extends StatelessWidget {
  const NotificationsOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 231.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBell1,
                height: 100.adaptSize,
                width: 100.adaptSize,
                alignment: Alignment.center,
                // margin: EdgeInsets.only(right: 38.h),
              ),
              SizedBox(height: 28.v),
              Text(
                "No Notification Yet ",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),

        // Padding(
        //   padding: EdgeInsets.only(
        //     left: 20.h,
        //     top: 22.v,
        //     right: 20.h,
        //   ),
        //   child: ListView.separated(
        //     physics: BouncingScrollPhysics(),
        //     shrinkWrap: true,
        //     separatorBuilder: (
        //       context,
        //       index,
        //     ) {
        //       return SizedBox(
        //         height: 10.v,
        //       );
        //     },
        //     itemCount: 3,
        //     itemBuilder: (context, index) {
        //       return NotificationsoneItemWidget();
        //     },
        //   ),
        // ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: CustomIconButton(
            onTap: () {
              Get.back();
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
        text: "Notifications",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
