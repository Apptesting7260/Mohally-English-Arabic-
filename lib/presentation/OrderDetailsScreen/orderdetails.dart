import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/my_orders_tab_container_screen/my_orders_tab_container_screen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/OrderDetailsController/OrderDetailsController.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  EnglishSingleProductViewController _singleproductviewController =
      EnglishSingleProductViewController();
  OrderDetailsController _orderDetailsController = OrderDetailsController();
  @override
  void initState() {
    super.initState();
    _orderDetailsController.ordeDetailsHit(orderdetailId.value);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_orderDetailsController.rxRequestStatus.value == Status.LOADING) {
        return Center(child: CircularProgressIndicator());
      } else if (_orderDetailsController.rxRequestStatus.value ==
          Status.ERROR) {
        return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 11, left: 10),
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
            ),
            body: Column(
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
        return Scaffold(
          appBar: _buildAppBar(context),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Almarai')),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    _buildOrderItemInfo(context),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    Text('Order Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Almarai')),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    _buildOrderInfo(context)
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20,
          top: 8,
          bottom: 8,
        ),
      ),
      title: AppbarSubtitle(
        text: "Order Information",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }

  Widget _buildOrderItemInfo(BuildContext context) {
    return ListView.separated(
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
      itemCount: 1,
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    onTap: () {
                      mainCatId = _orderDetailsController.userlist.value
                          .orderItemInformation?[index].categoryId!
                          .toString();
                      productId = _orderDetailsController
                          .userlist.value.orderItemInformation?[index].id!
                          .toString();
                      _singleproductviewController.Single_ProductApiHit(
                          context, productId, mainCatId);
                      Get.to(SingleProductView());
                    },
                    fit: BoxFit.cover,
                    imagePath:
                        "${_orderDetailsController.userlist.value.orderItemInformation?[index].image.toString()}",
                    // ImageConstant.imgRectangle569,
                    height: 110.adaptSize,
                    width: 110.adaptSize,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(right: 50),
                  //       child: Text(
                  // "${_orderDetailsController.userlist.value.orderItemInformation?[index].name.toString()}",
                  //         style: theme.textTheme.bodyMedium,
                  //         textAlign: TextAlign.center,
                  //         maxLines: 3,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * .5,
                              // color: Colors.amberAccent,
                              child: Text(
                                "${_orderDetailsController.userlist.value.orderItemInformation?[index].name.toString()}",
                                style: theme.textTheme.titleSmall?.copyWith(
                                    fontFamily: 'Almarai',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            // Text(
                            //   "${_orderDetailsController.userlist.value.orderItemInformation?[index].productDetails?.Color.toString()}/${_orderDetailsController.userlist.value.orderItemInformation?[index].productDetails?.Size.toString()}",
                            //   style: theme.textTheme.bodyMedium?.copyWith(
                            //       fontFamily: 'Almarai',
                            //       fontSize: 14,
                            //       fontWeight: FontWeight.w500),
                            // ),
                          ]))
                ],
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        "Price",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "${_orderDetailsController.userlist.value.orderItemInformation?[index].price.toString()}",
                        style: theme.textTheme.titleSmall?.copyWith(
                            fontFamily: 'Almarai',
                            fontSize: 16,
                            color: Color(0xffff8300)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        "Quantity",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "${_orderDetailsController.userlist.value.orderItemInformation?[index].totalQuantity.toString()}",
                        style: theme.textTheme.titleSmall?.copyWith(
                            fontFamily: 'Almarai',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        "Total Price",
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Almarai',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "${_orderDetailsController.userlist.value.orderItemInformation?[index].price.toString()}",
                        style: theme.textTheme.titleSmall?.copyWith(
                            fontFamily: 'Almarai',
                            fontSize: 16,
                            color: Color(0xffff8300)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrderInfo(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Order No:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${_orderDetailsController.userlist.value.orderInformation?.orderId.toString()}",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Delivery Status:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${_orderDetailsController.userlist.value.orderInformation?.orderStatus.toString()}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Order Date:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${_orderDetailsController.userlist.value.orderInformation?.orderDate.toString()}",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          // SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Shipping To:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${_orderDetailsController.userlist.value.orderInformation?.shippingTo.toString()}",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          if (_orderDetailsController
                  .userlist.value.orderInformation?.shipingDate
                  .toString() !=
              null.toString())
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Text(
                      "Shipping Date:",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Almarai',
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.h),
                    child: Text(
                      "${_orderDetailsController.userlist.value.orderInformation?.shipingDate.toString()}",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          Divider(
            thickness: 1,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Item Amount:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${_orderDetailsController.userlist.value.orderInformation?.amount.toString()}",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          if (_orderDetailsController
                  .userlist.value.orderInformation?.discunt !=
              null.toString())
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Text(
                      "Discount:",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Almarai',
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.h),
                    child: Text(
                      "${_orderDetailsController.userlist.value.orderInformation?.discunt.toString()}",
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          Divider(
            thickness: 1,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "Order Total:",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Almarai',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "${_orderDetailsController.userlist.value.orderInformation?.payAmount.toString()}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Almarai',
                        fontSize: 18,
                        color: Color(0xffff8300),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Shipping Address',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai')),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "${_orderDetailsController.userlist.value.shippingAddress?.tempUserName.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai')),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${_orderDetailsController.userlist.value.shippingAddress?.address.toString()}",
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${_orderDetailsController.userlist.value.shippingAddress?.city.toString()},${_orderDetailsController.userlist.value.shippingAddress?.state.toString()},${_orderDetailsController.userlist.value.shippingAddress?.zipCode.toString()}",
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${_orderDetailsController.userlist.value.shippingAddress?.country.toString()}",
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontFamily: 'Almarai', fontSize: 16),
            ),
          ),
          SizedBox(height: 15.v),
        ],
      ),
    );
  }
}
