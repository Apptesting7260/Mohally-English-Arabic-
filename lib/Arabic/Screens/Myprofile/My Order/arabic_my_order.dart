import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_myorder_Processing.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabic_myorder_cancelled.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/widgets/arabuc_myorder_delievered.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class MyOrdersTab_arabic extends StatefulWidget {
  const MyOrdersTab_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersTab_arabicState createState() => MyOrdersTab_arabicState();
}

class MyOrdersTab_arabicState extends State<MyOrdersTab_arabic>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

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
            text: "طلباتي",
            // margin: EdgeInsets.only(left: 10),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.v),
                  _buildTabview(context),
                  Container(
                    height: Get.height * .8,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: tabviewController,
                      children: [
                        MyOrdersPage_arabic_delieverd(),
                        MyOrders_arabic_processing(),
                        MyOrdersTwoPage_cancelled_arabic(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: Get.height * .04,
      width: Get.width,
      // margin: EdgeInsets.only(left: 20.h),
      child: TabBar(
        controller: tabviewController,
        // labelPadding: EdgeInsets.only(left: 5,right: 5),
        labelColor: appTheme.whiteA70002,
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w500,
        ),

        unselectedLabelColor: appTheme.gray90001,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            30.h,
          ),
        ),
        tabs: [
          Tab(
            child: Center(
              child: Text(
                "تم التوصيل",
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                "يعالج",
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                "ألغيت",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
