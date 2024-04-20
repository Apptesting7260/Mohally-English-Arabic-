import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/OrderStatusController/orderstatuscontroller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class MyOrdersPage_arabic_delieverd extends StatefulWidget {
  const MyOrdersPage_arabic_delieverd({Key? key})
      : super(
          key: key,
        );

  @override
  MyOrdersPage_arabic_delieverdState createState() =>
      MyOrdersPage_arabic_delieverdState();
}

class MyOrdersPage_arabic_delieverdState
    extends State<MyOrdersPage_arabic_delieverd>
    with AutomaticKeepAliveClientMixin<MyOrdersPage_arabic_delieverd> {
  @override
  void initState() {
    _orderStatuscontroller.OrderStatus_Apihit(context, "delivered");
    super.initState();
  }

  OrderStatuscontroller _orderStatuscontroller = OrderStatuscontroller();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(body: Obx(() {
        // if (_orderStatuscontroller.rxRequestStatus.value == Status.LOADING) {
        //   return Center(child: CircularProgressIndicator());
        // } else
        if (_orderStatuscontroller.rxRequestStatus.value == Status.ERROR) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error2.png',
              ),
              Text(
                "أُووبس! تواجه خوادمنا مشكلة في الاتصال.\nيُرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
              ),
            ],
          ));
        } else {
          return Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.v),
                _orderStatuscontroller.Userlist.value.orders == [] ||
                        _orderStatuscontroller.Userlist.value.orders == null ||
                        _orderStatuscontroller.Userlist.value.orders?.length ==
                            0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/no-order.png',
                            color: Color(0xffff8300),
                            height: Get.height * .2,
                            width: Get.width * .4,
                          ),
                          // SizedBox(
                          //   height: Get.height * .03,
                          // ),
                          Center(
                            child: Text(
                              "أُووبس! يبدو أنك لم \nتقدم أية طلبات حتى الآن.",
                              style: theme.textTheme.headlineMedium?.copyWith(
                                  color: Color.fromARGB(120, 0, 0, 0),
                                  fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    : _buildMyOrdersList(context),
              ],
            ),
          );
        }
      })),
    );
  }

  /// Section Widget
  Widget _buildMyOrdersList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 15.v,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 18.v,
            ),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order No: 1947034",
                      style: CustomTextStyles.titleMediumMedium16,
                    ),
                    Text(
                      "05-12-2019",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 15.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          "عدد تتبع",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "IW3475453455",
                          style: CustomTextStyles.bodyMediumGray90001_1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "كمية",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "3",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "المبلغ الإجمالي",
                      style: CustomTextStyles.bodyMediumGray90001_1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "199",
                        style: CustomTextStyles.titleMediumPrimary16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      child: Text(
                        "تم التوصيل",
                        style: CustomTextStyles.bodyMediumGreen40002,
                      ),
                    ),
                    Spacer(),
                    CustomOutlinedButton(
                      height: 30.v,
                      width: 80.h,
                      text: "تفاصيل",
                      buttonTextStyle: CustomTextStyles.labelLargePrimary,
                    ),
                    CustomElevatedButton(
                      height: 30.v,
                      width: 80.h,
                      text: "إعادة الطلب",
                      margin: EdgeInsets.only(left: 8.h),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                      buttonTextStyle: CustomTextStyles.labelLargeWhiteA70002_1,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
