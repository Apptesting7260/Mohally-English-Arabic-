import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class NotificationsOneScreen_arabic extends StatelessWidget {
  const NotificationsOneScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
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
            text: "إشعارات",
            // margin: EdgeInsets.only(left: 10),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                "لا يوجد إشعار حتى الآن ",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0),
                    fontSize: 12,
                    fontFamily: 'Almarai'),
              ),
              SizedBox(height: 5.v),
            ],
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
          //       return Container(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 15.h,
          //           vertical: 17.v,
          //         ),
          //         decoration: AppDecoration.fillGray.copyWith(
          //           borderRadius: BorderRadiusStyle.roundedBorder8,
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             CustomImageView(
          //               imagePath: ImageConstant.imgNotification1Gray9000124x24,
          //               height: 24.adaptSize,
          //               width: 24.adaptSize,
          //               margin: EdgeInsets.only(
          //                 top: 4.v,
          //                 bottom: 6.v,
          //               ),
          //             ),
          //             Container(
          //               width: 200.h,
          //               margin: EdgeInsets.only(
          //                 left: 12.h,
          //                 top: 2.v,
          //               ),
          //               child: Text(
          //                   "جيلبرت، لقد قمت بوضع الطلب والتحقق منه \nسجل الطلب للحصول على التفاصيل الكاملة",
          //                   maxLines: 3,
          //                   overflow: TextOverflow.ellipsis,
          //                   style: TextStyle(
          //                       fontFamily: 'Almarai',
          //                       fontSize: 12,
          //                       fontWeight: FontWeight.w400,
          //                       color: Colors.black)),
          //             ),
          //             Spacer(),
          //             Container(
          //               height: 9.v,
          //               width: 2.h,
          //               margin: EdgeInsets.only(
          //                 top: 4.v,
          //                 bottom: 21.v,
          //               ),
          //               decoration: BoxDecoration(
          //                 color: appTheme.blueGray40001,
          //                 borderRadius: BorderRadius.circular(
          //                   4.h,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ),
      ),
    );
  }

  /// Section Widget
}
