import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/MyOrder_Widgets/My_Order_Deliver.dart';
import 'package:mohally/presentation/my_orders_one_page/MyOrder_Processing.dart';
import 'package:mohally/presentation/my_orders_two_page/my_orders_two_page.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

RxString orderdetailId = "".obs;

class MyOrdersTabContainerScreen extends StatefulWidget {
  const MyOrdersTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersTabContainerScreenState createState() =>
      MyOrdersTabContainerScreenState();
}

class MyOrdersTabContainerScreenState extends State<MyOrdersTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  void refreshTabContainerScreen() {
    setState(() {});
  }
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.v),
                  _buildTabview(context),
                  SizedBox(
                    height: 658.v,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: tabviewController,
                      children: [
                        MyOrdersDelivererdPage(),
                        MyOrdersProcessingPage(
                            ),
                        MyOrdersCancelledPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
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
        text: "My Orders",
        margin: EdgeInsets.only(left: 16.h),
      ),
      // actions: [
      //   Container(
      //     height: 90.v,
      //     width: 90.h,
      //     child: AppbarTrailingIconbuttonOne(
      //       imagePath: ImageConstant.imgSearchGray90001,
      //       margin: EdgeInsets.symmetric(
      //         horizontal: 10.h,
      //         vertical: 8.v,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: Get.height * .05,
      width: Get.width,
      // margin: EdgeInsets.only(left: 20.h),
      child: TabBar(
        controller: tabviewController,
        // labelPadding: EdgeInsets.only(left: 5,right: 5),
        labelColor: appTheme.whiteA70002,
        labelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
        ),

        unselectedLabelColor: appTheme.gray90001,
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'League Spartan',
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
                "Delivered",
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                "Processing",
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                "Cancelled",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
