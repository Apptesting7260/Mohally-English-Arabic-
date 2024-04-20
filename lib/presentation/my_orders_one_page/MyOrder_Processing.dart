// ignore_for_file: unused_import
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/OrderDetailsScreen/orderdetails.dart';
import 'package:mohally/presentation/my_orders_tab_container_screen/my_orders_tab_container_screen.dart';
import 'package:mohally/view_models/controller/CancelOrderController/cancelOrderController.dart';
import 'package:mohally/view_models/controller/OrderDetailsController/OrderDetailsController.dart';
import 'package:mohally/view_models/controller/OrderStatusController/orderstatuscontroller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyOrdersProcessingPage extends StatefulWidget {
  // final VoidCallback onCancel;
  const MyOrdersProcessingPage({Key? key, })
      : super(
          key: key,
        );

  @override
  MyOrdersProcessingPageState createState() => MyOrdersProcessingPageState();
}

class MyOrdersProcessingPageState extends State<MyOrdersProcessingPage>
    with AutomaticKeepAliveClientMixin<MyOrdersProcessingPage> {
  @override
  void initState() {
    // Initialize the controller
    _orderStatuscontroller.OrderStatus_Apihit(context, "processing");
    super.initState();
  }

  OrderDetailsController _orderDetails = OrderDetailsController();
  CancelOrderController _cancelOrderController = CancelOrderController();
  OrderStatuscontroller _orderStatuscontroller = OrderStatuscontroller();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(body: SafeArea(
      child: Obx(() {
        if (_orderStatuscontroller.rxRequestStatus.value == Status.LOADING) {
          return Center(child: CircularProgressIndicator());
        } else if (_orderStatuscontroller.rxRequestStatus.value ==
            Status.ERROR) {
          return Center(
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
          ));
        } else {
          return _orderStatuscontroller.Userlist.value.orders == [] ||
                  _orderStatuscontroller.Userlist.value.orders!.isEmpty ||
                  _orderStatuscontroller.Userlist.value.orders == null
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
                        "Oops! It seems like you haven't \nplaced any orders yet.",
                        style: theme.textTheme.headlineMedium?.copyWith(
                            color: Color.fromARGB(120, 0, 0, 0), fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    decoration: AppDecoration.fillWhiteA,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.v),
                        _buildMyProcessingOrders(context),
                      ],
                    ),
                  ),
                );
        }
      }),
    ));
  }

  /// Section Widget
  Widget _buildMyProcessingOrders(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 15.v,
          );
        },
        itemCount: _orderStatuscontroller.Userlist.value.orders?.length ?? 0,
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
                      "${_orderStatuscontroller.Userlist.value.orders?[index].orderId.toString()}",
                      style: CustomTextStyles.titleMediumMedium16,
                    ),
                    Text(
                      "${_orderStatuscontroller.Userlist.value.orders?[index].orderDate.toString()}",
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
                          "Tracking number",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "${_orderStatuscontroller.Userlist.value.orders?[index].id.toString().toString()}",
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
                        "Quantity",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "${_orderStatuscontroller.Userlist.value.orders?[index].Quantity.toString().toString()}",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Total Amount",
                      style: CustomTextStyles.bodyMediumGray90001_1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "${_orderStatuscontroller.Userlist.value.orders?[index].netAmount.toString().toString()}",
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
                      padding: EdgeInsets.only(
                        top: 10.v,
                        bottom: 6.v,
                      ),
                      child: Text(
                        " Processing",
                        style: CustomTextStyles.bodyMediumPrimary,
                      ),
                    ),
                    Spacer(),
                    CustomOutlinedButton(
                      height: 30.v,
                      width: 80.h,
                      text: "Cancel",
                      buttonTextStyle: CustomTextStyles.labelLargePrimary,
                      onPressed: () {
                        String? id = _orderStatuscontroller
                            .Userlist.value.orders?[index].id
                            .toString();
                        print(id);
                        setState(() {
                          Orderid = id;
                        });
                        _cancelOrderController.orderCancelHit(context);
                        // Get.off(MyOrdersTabContainerScreen(
                        // ));
                      },
                    ),
                    CustomElevatedButton(
                      height: 30.v,
                      width: 80.h,
                      text: " Details",
                      margin: EdgeInsets.only(left: 8.h),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                      buttonTextStyle: CustomTextStyles.labelLargeWhiteA70002_1,
                      onPressed: () {
                        orderdetailId.value = _orderStatuscontroller
                            .Userlist.value.orders![index].id
                            .toString();

                        _orderDetails.ordeDetailsHit(orderdetailId.value);
                        Get.to(OrderDetails());
                        print("Order detail Id =====> ${orderdetailId}");
                      },
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
