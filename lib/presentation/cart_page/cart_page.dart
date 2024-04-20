// ignore_for_file: unused_import
import 'dart:async';
import 'dart:ffi';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:mohally/presentation/payment_screen/payment_screen.dart';
import 'package:mohally/presentation/price_details_bottomsheet/price_details_bottomsheet.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/AddressViewController/address_view_controller.dart';
import 'package:mohally/view_models/controller/ApplyCouponCodeController/applycouponcodecontroller.dart';
import 'package:mohally/view_models/controller/Cart/DeleteCartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
import 'package:mohally/view_models/controller/Cart/ProductQtyUpdateController/cartproductqtyUpdateController.dart';
import 'package:mohally/view_models/controller/CouponController/couponcodeController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/PlaceOrderController/paceOrderController.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_radio_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

String? totalAmount;
RxString couponcodeee = "".obs;
RxString couponDiscountAmount = "".obs;

num totalAmountForApi = 0;

// ignore_for_file: must_be_immutable
class CartPage extends StatefulWidget {
  CartPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  RxInt quantity = 1.obs;
  int selectedImageIndex = 0;
  PageController _pageController = PageController();
  EnglishSingleProductViewController _singleproductviewController =
      EnglishSingleProductViewController();
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());
  CouponCodeApplyController _applycouponcode = CouponCodeApplyController();
  int selectedTabIndex = 0;

  String selectedImageUrl = "";
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  bool Allselected = false;
  bool Allselected2 = false;
  final DeleteCartCartControlleri = Get.put(DeleteCartCartController());
  final Qtycontroller = Get.put(CartProductQtyIncrementCartcontroller());
  TextEditingController addtoCartController = TextEditingController();
  bool allSelected = false;

  int counter = 1;
  int counter2 = 1;
  TextEditingController group166Controller = TextEditingController();
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();

  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  List<bool> isSelectedList = List.generate(100, (index) => false);
  PlaceOrdercontroller placeordercontroller = PlaceOrdercontroller();
  List<String> recomemded_text = [
    'Recommended',
    'Recommended',
    'Recommended',
    'Recommended',
    'Recommended',
  ];

  int selectedIndex = 0;
  String? selectedSize;
  String selectedSize22 = "Dark Blue/M(38)";
  int _currentIndex = 0;

  List<bool> tappedList = List.generate(200, (index) => false);
  TextEditingController trailRunningJacketByController =
      TextEditingController();

  TextEditingController vectorController = TextEditingController();
  Englishuseraddressviewcontroller viewaddresscontroller =
      Englishuseraddressviewcontroller();

  CouponCodeController _couponCodeController = CouponCodeController();

  EnglishViewCart _viewcartcontroller = EnglishViewCart();

  @override
  void initState() {
    super.initState();

    _viewcartcontroller.Viewcart_apihit();
    homeView_controller.homeview_apihit();
    _couponCodeController.fetchMycouponData();
    setState(() {
      sizeid = null;
      modelid = null;
      itemid = null;
      weightid = null;
      quantityid = null;
      capacityid = null;
      colorId = null;
      productpricechangeDetails = {};
      AselectedcolorIndex.value = (-1);
      AselectedSizeIndex.value = (-1);
      AselectedModelIndex.value = (-1);
      AselecteditemIndex.value = (-1);
      AselectedCapacityIndex.value = (-1);
      AselectedquantityIndex.value = (-1);
      AselectedweightIndex.value = (-1);
    });
  }

  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(context),
          body: SafeArea(
            child: Obx(() {
              if (_viewcartcontroller.rxRequestStatus.value == Status.LOADING) {
                return Center(child: CircularProgressIndicator());
              } else if (_viewcartcontroller.rxRequestStatus.value ==
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
                return _viewcartcontroller.userList.value.viewCart == null ||
                        _viewcartcontroller.userList.value.viewCart!.length == 0
                    // _viewcartcontroller.home_living_userlist.value
                    //         .productView?.length ==
                    //     0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/nocart.png',
                            width: Get.width * 0.42,
                          ),
                          Padding(
                            // padding: const EdgeInsets.fromLTRB(70, 0, 40, 0),
                            padding: EdgeInsets.fromLTRB(
                                Get.width * 0.2, 0, Get.width * 0.11, 0),
                            child: Text(
                              "Your cart is currently empty.\n Start adding items to your cart and make your shopping experience even better!",
                              style: theme.textTheme.headlineMedium?.copyWith(
                                  color: const Color.fromARGB(73, 0, 0, 0),
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ListView(
                            children: [
                              SizedBox(height: 7.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: Text(
                                    "${_viewcartcontroller.userList.value.viewCartTotal.toString()}  items! ",
                                    style: CustomTextStyles.bodyLargeGray50001_3
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.v),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.h, right: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "in cart",
                                      style: CustomTextStyles
                                          .bodyLargeGray50001_3
                                          ?.copyWith(),
                                    ),
                                    // CustomIconButton(
                                    //     onTap: () {
                                    //       // if (isSelectedList[index]) {

                                    //       // }
                                    //       DeleteCartCartController()
                                    //           .deleteCartApiHit(
                                    //               DeleteCartCartControlleri
                                    //                   .selectedCartIds);
                                    //     },
                                    //     height: 40.adaptSize,
                                    //     width: 40.adaptSize,
                                    //     decoration:
                                    //         IconButtonStyleHelper.fillGrayTL20,
                                    //     child: Center(
                                    //         child: Icon(
                                    //       Icons.delete,
                                    //       color: Colors.grey,
                                    //     ))),
                                    GestureDetector(
                                      onTap: () {
                                        if (DeleteCartCartControlleri
                                            .selectedCartIds.isEmpty) {
                                          Utils.snackBar(context, 'Failed',
                                              'Before deleting Item, please select Product');
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Are you sure?"),
                                                content: Text(
                                                  "Do you want to delete this item?",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                actions: <Widget>[
                                                  // No button
                                                  TextButton(
                                                    child: Text("No"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                  ),
                                                  // Yes button
                                                  TextButton(
                                                    child: Text("Yes"),
                                                    onPressed: () {
                                                      // Close the dialog
                                                      Navigator.of(context)
                                                          .pop();
                                                      // Execute delete action
                                                      DeleteCartCartController()
                                                          .deleteCartApiHit(
                                                              DeleteCartCartControlleri
                                                                  .selectedCartIds,
                                                              context);
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: CustomIconButton(
                                        height: 40.adaptSize,
                                        width: 40.adaptSize,
                                        decoration:
                                            IconButtonStyleHelper.fillGrayTL20,
                                        child: Center(
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 27.v),
                              _buildFreeShippingAnd(context),
                              SizedBox(height: 20.v),
                              // Padding(
                              //   padding: EdgeInsets.only(right: 20),
                              //   child: Align(
                              //     alignment: AlignmentDirectional.centerEnd,
                              //     child: GestureDetector(
                              // onTap: () {
                              //   // if (isSelectedList[index]) {

                              //   // }
                              //   DeleteCartCartController()
                              //       .deleteCartApiHit(
                              //           DeleteCartCartControlleri
                              //               .selectedCartIds);
                              // },
                              //       child: Icon(
                              //         Icons.delete_forever,
                              //         color: Colors.red,
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              ListView.separated(
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
                                itemCount: _viewcartcontroller
                                        .userList.value.viewCart?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    // padding: EdgeInsets.symmetric(
                                    //   horizontal: 16.h,
                                    //   vertical: 18.v,
                                    // ),
                                    // decoration: AppDecoration.fillGray.copyWith(
                                    //   borderRadius:
                                    //       BorderRadiusStyle.roundedBorder15,
                                    // ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              "${_viewcartcontroller.userList.value.viewCart?[index].image.toString()}",
                                          height: 100.adaptSize,
                                          width: 100.adaptSize,
                                          radius: BorderRadius.circular(
                                            10.h,
                                          ),
                                          margin: EdgeInsets.only(bottom: 15.v),
                                          onTap: () {
                                            mainCatId = _viewcartcontroller
                                                .userList
                                                .value
                                                .viewCart?[index]
                                                .categoryId
                                                .toString();
                                            productId = _viewcartcontroller
                                                .userList
                                                .value
                                                .viewCart?[index]
                                                .productId!
                                                .toString();
                                            _singleproductviewController
                                                .Single_ProductApiHit(context,
                                                    productId, mainCatId);
                                            Get.to(SingleProductView());
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 14.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: Get.width * .4,
                                                    // color: Colors.amberAccent,
                                                    child: Text(
                                                      "${_viewcartcontroller.userList.value.viewCart?[index].name.toString()}",
                                                      style: theme
                                                          .textTheme.titleSmall
                                                          ?.copyWith(
                                                              fontSize: 10),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: Get.width * .1),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isSelectedList[index] =
                                                            !isSelectedList[
                                                                index];
                                                      });

                                                      /// for selected item amount
                                                      if (isSelectedList[
                                                              index] ==
                                                          true) {
                                                        totalAmountForApi +=
                                                            _viewcartcontroller
                                                                .userList
                                                                .value
                                                                .viewCart?[
                                                                    index]
                                                                .totalPrice;
                                                      } else {
                                                        totalAmountForApi -=
                                                            _viewcartcontroller
                                                                .userList
                                                                .value
                                                                .viewCart?[
                                                                    index]
                                                                .totalPrice;
                                                      }
                                                      // DeleteCartCartControlleri.selectedCartIds.addIf()

                                                      if (!DeleteCartCartControlleri
                                                              .selectedCartIds
                                                              .contains(
                                                                  _viewcartcontroller
                                                                      .userList
                                                                      .value
                                                                      .viewCart?[
                                                                          index]
                                                                      .id
                                                                      .toString()) ||
                                                          !placeordercontroller
                                                              .selectedCartIds
                                                              .contains(
                                                                  _viewcartcontroller
                                                                      .userList
                                                                      .value
                                                                      .viewCart?[
                                                                          index]
                                                                      .id
                                                                      .toString()) ||
                                                          !_applycouponcode
                                                              .selectedCartIds
                                                              .contains(
                                                                  _viewcartcontroller
                                                                      .userList
                                                                      .value
                                                                      .viewCart?[
                                                                          index]
                                                                      .id
                                                                      .toString())) {
                                                        placeordercontroller
                                                            .selectedCartIds
                                                            .add(_viewcartcontroller
                                                                .userList
                                                                .value
                                                                .viewCart?[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        _applycouponcode
                                                            .selectedCartIds
                                                            .add(_viewcartcontroller
                                                                .userList
                                                                .value
                                                                .viewCart?[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        DeleteCartCartControlleri
                                                            .selectedCartIds
                                                            .add(_viewcartcontroller
                                                                .userList
                                                                .value
                                                                .viewCart?[
                                                                    index]
                                                                .id
                                                                .toString());
                                                        print(DeleteCartCartControlleri
                                                            .selectedCartIds);
                                                        print(
                                                            "${_applycouponcode.selectedCartIds}===couponcodeSelectedId");
                                                      } else {
                                                        placeordercontroller
                                                            .selectedCartIds
                                                            .remove(
                                                                _viewcartcontroller
                                                                    .userList
                                                                    .value
                                                                    .viewCart?[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        _applycouponcode
                                                            .selectedCartIds
                                                            .remove(
                                                                _viewcartcontroller
                                                                    .userList
                                                                    .value
                                                                    .viewCart?[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        DeleteCartCartControlleri
                                                            .selectedCartIds
                                                            .remove(
                                                                _viewcartcontroller
                                                                    .userList
                                                                    .value
                                                                    .viewCart?[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                        print(DeleteCartCartControlleri
                                                            .selectedCartIds);
                                                      }
                                                      // // deleteCartId = _viewcartcontroller
                                                      // //     .userList.value.viewCart?[index].id
                                                      // //     .toString();

                                                      // print(deleteCartId);
                                                      // DeleteCartCartController().deleteCartApiHit();
                                                    },
                                                    child: Container(
                                                      height: Get.height * .03,
                                                      width: Get.width * .05,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              Color(0xffff8300),
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child:
                                                          isSelectedList[index]
                                                              ? Center(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        Get.height *
                                                                            .02,
                                                                    width:
                                                                        Get.width *
                                                                            .03,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Color(
                                                                          0xffff8300),
                                                                    ),
                                                                  ),
                                                                )
                                                              : null,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * .02,
                                              ),
                                              if (_viewcartcontroller
                                                      .userList
                                                      .value
                                                      .viewCart?[index]
                                                      .productDetails !=
                                                  "null")
                                                Container(
                                                  height: Get.height * 0.035,
                                                  width: Get.width * 0.3,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(255,
                                                              224, 223, 223)
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: Center(
                                                      child: FittedBox(
                                                    child: Text(
                                                      '${_viewcartcontroller.userList.value.viewCart?[index].productDetails.toString()}',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )),
                                                ),

                                              ///

                                              /// sizedBox added

                                              SizedBox(
                                                height: Get.height * .01,
                                              ),

                                              ///
                                              SizedBox(
                                                width: 221.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.v),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  "${_viewcartcontroller.userList.value.viewCart?[index].price.toString()}",
                                                              style: theme
                                                                  .textTheme
                                                                  .titleMedium,
                                                            ),
                                                            TextSpan(
                                                              text: " ",
                                                            ),
                                                            // TextSpan(
                                                            //   text:
                                                            //       "${_viewcartcontroller.userList.value.viewCart?[index].totalPrice.toString()}",
                                                            //   style: CustomTextStyles
                                                            //       .titleSmallGray50001
                                                            //       .copyWith(
                                                            //     decoration:
                                                            //         TextDecoration
                                                            //             .lineThrough,
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   width: Get.width * .2,
                                                    //   height: Get.height * .04,
                                                    //   decoration: AppDecoration.fillPrimary.copyWith(
                                                    //     borderRadius:
                                                    //         BorderRadiusStyle.circleBorder30,
                                                    //   ),
                                                    //   child: Row(
                                                    //     mainAxisAlignment:
                                                    //         MainAxisAlignment.spaceAround,
                                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                                    //     children: [
                                                    //       // GestureDetector(
                                                    //       //   onTap: () {
                                                    //       //     CartId = _viewcartcontroller
                                                    //       //         .userList.value.viewCart![index].id
                                                    //       //         .toString();
                                                    //       //     // Decrement the counter when "-" is pressed
                                                    //       //     _viewcartcontroller
                                                    //       //         .userList
                                                    //       //         .value
                                                    //       //         .viewCart![index]
                                                    //       //         .totalQty
                                                    //       //         .value -= 1;
                                                    //       //     print(_viewcartcontroller.userList.value
                                                    //       //         .viewCart![index].totalQty.value);

                                                    //       //     CartProductQtyIncrementCartcontroller()
                                                    //       //         .QtyUpdate_Apihit(
                                                    //       //             context, index, "decrement");
                                                    //       //   },
                                                    //       //   child: Icon(
                                                    //       //     Icons.remove,
                                                    //       //     color: Colors.white,
                                                    //       //     size: 15,
                                                    //       //   ),
                                                    //       // ),
                                                    //       GestureDetector(
                                                    //         onTap: () {
                                                    //           CartId = _viewcartcontroller
                                                    //               .userList.value.viewCart![index].id
                                                    //               .toString();
                                                    //           // Check if the current quantity is greater than 1 before decrementing
                                                    //           if (_viewcartcontroller
                                                    //                   .userList
                                                    //                   .value
                                                    //                   .viewCart![index]
                                                    //                   .totalQty
                                                    //                   .value >
                                                    //               1) {
                                                    //             // Decrement the counter
                                                    //             _viewcartcontroller
                                                    //                 .userList
                                                    //                 .value
                                                    //                 .viewCart![index]
                                                    //                 .totalQty
                                                    //                 .value -= 1;
                                                    //             print(_viewcartcontroller
                                                    //                 .userList
                                                    //                 .value
                                                    //                 .viewCart![index]
                                                    //                 .totalQty
                                                    //                 .value);
                                                    //             CartProductQtyIncrementCartcontroller()
                                                    //                 .QtyUpdate_Apihit(
                                                    //                     context, index, "decrement");
                                                    //           } else {
                                                    //             // If quantity is already 1 or less, do nothing or show a message
                                                    //             // You can add a toast, snackbar, or any other UI feedback here
                                                    //           }
                                                    //         },
                                                    //         child: Icon(
                                                    //           Icons.remove,
                                                    //           color: Colors.white,
                                                    //           size: 15,
                                                    //         ),
                                                    //       ),

                                                    //       Center(
                                                    //           child: Text(
                                                    //         _viewcartcontroller.userList.value
                                                    //             .viewCart![index].totalQty.value
                                                    //             .toString(),
                                                    //         style: theme.textTheme.bodyMedium
                                                    //             ?.copyWith(color: Colors.white),
                                                    //       )),
                                                    //       GestureDetector(
                                                    //         onTap: () {
                                                    //           CartId = _viewcartcontroller
                                                    //               .userList.value.viewCart![index].id
                                                    //               .toString();
                                                    //           // Increment the counter when "+" is pressed
                                                    //           _viewcartcontroller
                                                    //               .userList
                                                    //               .value
                                                    //               .viewCart![index]
                                                    //               .totalQty
                                                    //               .value += 1;
                                                    //           print(_viewcartcontroller.userList.value
                                                    //               .viewCart![index].totalQty.value);

                                                    //           CartProductQtyIncrementCartcontroller()
                                                    //               .QtyUpdate_Apihit(
                                                    //                   context, index, "increment");
                                                    //         },
                                                    //         child: Icon(
                                                    //           Icons.add,
                                                    //           color: Colors.white,
                                                    //           size: 15,
                                                    //         ),
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                    Container(
                                                      width: Get.width * .2,
                                                      height: Get.height * .04,
                                                      decoration: AppDecoration
                                                          .fillPrimary
                                                          .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .circleBorder30,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              CartId =
                                                                  _viewcartcontroller
                                                                      .userList
                                                                      .value
                                                                      .viewCart![
                                                                          index]
                                                                      .id
                                                                      .toString();
                                                              // Check if the current quantity is greater than 1 before decrementing
                                                              if (_viewcartcontroller
                                                                      .userList
                                                                      .value
                                                                      .viewCart![
                                                                          index]
                                                                      .totalQuantity >
                                                                  1) {
                                                                // Decrement the counter
                                                                _viewcartcontroller
                                                                    .userList
                                                                    .value
                                                                    .viewCart![
                                                                        index]
                                                                    .totalQuantity -= 1;
                                                                print(_viewcartcontroller
                                                                    .userList
                                                                    .value
                                                                    .viewCart![
                                                                        index]
                                                                    .totalQuantity);
                                                                CartProductQtyIncrementCartcontroller()
                                                                    .QtyUpdate_Apihit(
                                                                        context,
                                                                        index,
                                                                        "decrement");
                                                              } else {
                                                                // If quantity is already 1 or less, do nothing or show a message
                                                                // You can add a toast, snackbar, or any other UI feedback here
                                                              }
                                                              // Force the widget to rebuild to reflect the new quantity
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              _viewcartcontroller
                                                                  .userList
                                                                  .value
                                                                  .viewCart![
                                                                      index]
                                                                  .totalQuantity
                                                                  .toString(),
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium
                                                                  ?.copyWith(
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              CartId =
                                                                  _viewcartcontroller
                                                                      .userList
                                                                      .value
                                                                      .viewCart![
                                                                          index]
                                                                      .id
                                                                      .toString();
                                                              // Increment the counter when "+" is pressed
                                                              _viewcartcontroller
                                                                  .userList
                                                                  .value
                                                                  .viewCart![
                                                                      index]
                                                                  .totalQuantity += 1;
                                                              print(_viewcartcontroller
                                                                  .userList
                                                                  .value
                                                                  .viewCart![
                                                                      index]
                                                                  .totalQuantity);

                                                              CartProductQtyIncrementCartcontroller()
                                                                  .QtyUpdate_Apihit(
                                                                      context,
                                                                      index,
                                                                      "increment");
                                                              // Force the widget to rebuild to reflect the new quantity
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              // _buildCartProduct(context),
                              // SizedBox(height: 29.v),
                              // _buildTrailRunningJacket1(context),
                              SizedBox(height: 30.v),
                              _buildTwentyNine(context),
                              SizedBox(height: 29.v),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 18),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Get.to(() => ShippingAddress());
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 14.v),
                              _buildAddress(context),
                              SizedBox(height: 29.v),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       'Payment or payment method',
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.w600,
                              //           color: Colors.black,
                              //           fontSize: 18),
                              //     ),
                              //     GestureDetector(
                              //         onTap: () {
                              //           Get.to(PaymentScreen());
                              //         },
                              //         child: Icon(
                              //           Icons.keyboard_arrow_right,
                              //           color: Colors.black,
                              //         )),
                              //   ],
                              // ),
                              // SizedBox(height: 15.v),
                              // _buildVisaClassic(context),
                              // SizedBox(height: 29.v),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        "Coupon Code",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: Get.width*.08,),
                                  // Container(
                                  //   height: 30.v,
                                  //   width: 120.h,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.all(
                                  //           Radius.circular(20)),
                                  //       border:
                                  //           Border.all(color: Colors.black)),
                                  //   margin: EdgeInsets.only(left: 23.h),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     // crossAxisAlignment:
                                  //     //     CrossAxisAlignment.center,
                                  //     children: [
                                  //       Text(
                                  //         'Your Coupon Code',
                                  //         style: theme.textTheme.titleMedium
                                  //             ?.copyWith(fontSize: 10),
                                  //       ),
                                  //       GestureDetector(
                                  //           onTap: () {
                                  //             showModalBottomSheet(
                                  //                 context: context,
                                  //                 builder: (context) {
                                  //                   return _buildYourcouponcode(
                                  //                       context);
                                  //                 });
                                  //           },
                                  //           child: Icon(
                                  //             Icons.keyboard_arrow_up_sharp,
                                  //             weight: 8,
                                  //           ))
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(height: 20.v),
                              _buildCouponCode(context),
                              SizedBox(height: 28.v),
                              _buildItemTotal(context),
                              SizedBox(height: 15.v),

                              if (couponDiscountAmount.value != '')
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Item(s) discount:",
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                            color: appTheme.gray90001,
                                          ),
                                        ),
                                        Text(
                                          _applycouponcode.discountPrice.value
                                              .toString(),
                                          style: CustomTextStyles
                                              .titleMediumPrimary_1
                                              .copyWith(
                                            color: theme.colorScheme.primary,
                                          ),
                                        ),
                                      ],
                                    )),

                              SizedBox(height: 15.v),
                              // if (_applycouponcode.totalPrice.value != "")

                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(
                                          color: appTheme.gray90001,
                                        ),
                                      ),
                                      couponDiscountAmount.value != ''
                                          ? Text(
                                              _applycouponcode.totalPrice.value
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .titleMediumPrimary_1
                                                  .copyWith(
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                            )
                                          : Text(
                                              "${_viewcartcontroller.userList.value.totalPrice.toString()}",
                                              style: CustomTextStyles
                                                  .titleMediumPrimary_1
                                                  .copyWith(
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                            ),
                                    ],
                                  )),
                              SizedBox(height: 17.v),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Container(
                                  height: 40.v,
                                  width: 100.h,
                                  child: ListView.builder(
                                                                        physics: NeverScrollableScrollPhysics(),

                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // double discountedSubTotal =
                                      //     totalAmountForApi -
                                      //         double.parse(
                                      //             couponDiscountAmount.value);
                                      return Container(
                                          height: 40.v,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                              color: Color(0xffff8300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                          // margin: EdgeInsets.only(left: 23.h),
                                          child: Center(
                                              child: GestureDetector(
                                            onTap: () {
                                              // setState(() {
                                              couponid = _applycouponcode
                                                  .userList.value.couponId
                                                  .toString();
                                              address_id =
                                                  addressIndexId.toString();
                                              itemdiscountAmount =
                                                  // _applycouponcode.userList
                                                  //     .value.discountPrice
                                                  //     .toString();
                                                  _applycouponcode.discountPrice
                                                      .toString();
                                              subtotalamount =
                                                  couponDiscountAmount.value !=
                                                          ''
                                                      ? _applycouponcode
                                                          .totalPrice
                                                          .toString()
                                                      : _viewcartcontroller
                                                          .userList
                                                          .value
                                                          .viewCart?[index]
                                                          .totalPrice
                                                          .toString();
                                              totalamount =
                                                  totalAmountForApi.toString();
                                              // });

                                              placeordercontroller
                                                  .Placeorderapihit(
                                                      placeordercontroller
                                                          .selectedCartIds,
                                                      context);
                                              // Get.offAll(
                                              //     () => OrderConfirmedScreen());
                                            },
                                            child: Text('Checkout',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                )),
                                          )));
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              //   child: Container(
                              //     height: 40.v,
                              //     width: 100.h,
                              //     decoration: BoxDecoration(
                              //       color: Color(0xffff8300),
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(20)),
                              //       border:
                              //           Border.all(color: Color(0xffff8300)),
                              //     ),
                              //     child: Center(
                              //       child: GestureDetector(
                              //         onTap: () {
                              //           print(
                              //               "address_id: $address_id"); // Debugging statement
                              //           if (address_id == null) {
                              //             print(
                              //                 "Address ID is null."); // Debugging statement
                              //             Utils.snackBar(context, 'Failed',
                              //                 'Please select a delivery address to proceed with checkout');
                              //             return;
                              //           }
                              //           print(
                              //               "addressIndexId: $addressIndexId"); // Debugging statement
                              //           setState(() {
                              //             couponid = couponidforcheckout;
                              //             address_id =
                              //                 addressIndexId.toString();
                              //             itemdiscountAmount = discountprice;
                              //             subtotalamount = _viewcartcontroller
                              //                 .userList.value.subTotalPrice
                              //                 .toString();
                              //             totalamount = _viewcartcontroller
                              //                 .userList.value.totalPrice
                              //                 .toString();
                              //           });
                              //           print(
                              //               "Before calling Placeorderapihit."); // Debugging statement
                              //           placeordercontroller.Placeorderapihit(
                              //               placeordercontroller
                              //                   .selectedCartIds,
                              //               context);
                              //           print(
                              //               "After calling Placeorderapihit."); // Debugging statement
                              //         },
                              //         child: Text(
                              //           'Checkout',
                              //           style: TextStyle(
                              //             fontSize: 14,
                              //             fontWeight: FontWeight.w600,
                              //             color: Colors.white,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              // Padding(
                              //   padding:
                              //       const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              //   child: _buildAll(context),
                              // ),
                              SizedBox(height: 29.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Text(
                                    "Explore your interests",
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 19.v),
                              _buildAddToCart(context),
                              // SizedBox(height: 19.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.imgMaskGroup16x16,
                                        height: 16.adaptSize,
                                        width: 16.adaptSize,
                                        margin: EdgeInsets.only(bottom: 2.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: Text(
                                          "secure payment options",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff8300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 318.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    right: 36.h,
                                  ),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a form book.",
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgMaskGroup2,
                                        height: 16.adaptSize,
                                        width: 16.adaptSize,
                                        margin: EdgeInsets.only(bottom: 2.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: Text(
                                          "privacy insurance",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff8300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 318.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    right: 36.h,
                                  ),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgMaskGroup3,
                                        height: 16.adaptSize,
                                        width: 16.adaptSize,
                                        margin: EdgeInsets.only(bottom: 2.v),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: Text(
                                          "Secure Privacy",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffff8300),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 318.h,
                                  margin: EdgeInsets.only(
                                    left: 20.h,
                                    right: 36.h,
                                  ),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 21.v),
                              // _buildListRecommended(context),
                              // // _buildCart(context),
                              // SizedBox(height: 15.v),
                              _buildCart1(context),
                              SizedBox(height: 2.v),
                            ],
                          ),
                        ),
                      );
              }
            }),
          )),
    );
  }

  Widget _buildFreeShippingAnd(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          color: Color.fromARGB(125, 252, 228, 236)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMaskGroup1,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 4.v,
            ),
            child: Text(
              "Free shipping and free returns",
              style:
                  CustomTextStyles.labelLargeInterPrimarySemiBold?.copyWith(),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              right: 3.h,
            ),
            child: Text(
              "limited time",
              style: CustomTextStyles.bodySmallInterGray90001?.copyWith(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartProduct(BuildContext context) {
    return Container(
      // width: Get.width,
      height: Get.height * .3,
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: _viewcartcontroller.userList.value.viewCart?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          _viewcartcontroller.userList.value.viewCart![index].totalQty.value =
              _viewcartcontroller.userList.value.viewCart![index].totalQuantity;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath:
                        "${_viewcartcontroller.userList.value.viewCart?[index].image.toString()}",
                    height: 100.adaptSize,
                    width: 100.adaptSize,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    margin: EdgeInsets.only(bottom: 15.v),
                    onTap: () {
                      mainCatId = _viewcartcontroller
                          .userList.value.viewCart?[index].categoryId
                          .toString();
                      productId = _viewcartcontroller
                          .userList.value.viewCart?[index].productId!
                          .toString();
                      _singleproductviewController.Single_ProductApiHit(
                          context, productId, mainCatId);
                      // setState(() {
                      //   Englishproductid = productId;
                      //   EnglishMainCatId = cartmainCatId;
                      // });
                      // print("$Englishproductid==");
                      // print("$EnglishMainCatId==");
                      // if (cartmainCatId == "153") {
                      //   Get.to(SingleProductView());
                      //   print(
                      //       "$cartmainCatId===========Mens Appearl main category id ");
                      // } else if (cartmainCatId == "154") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "155") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "156") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "157") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "174") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "166") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "170") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "171") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "172") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "173") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "176") {
                      //   Get.to(SingleProductView());
                      // } else if (cartmainCatId == "177") {
                      //   Get.to(SingleProductView());
                      // } else {
                      //   print('not found ');
                      // }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Get.width * .4,
                              // color: Colors.amberAccent,
                              child: Text(
                                "${_viewcartcontroller.userList.value.viewCart?[index].name.toString()}",
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(fontSize: 10),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(width: Get.width * .1),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedList[index] =
                                      !isSelectedList[index];
                                });
                                // DeleteCartCartControlleri.selectedCartIds.addIf()

                                if (!DeleteCartCartControlleri.selectedCartIds
                                        .contains(_viewcartcontroller
                                            .userList.value.viewCart?[index].id
                                            .toString()) ||
                                    !placeordercontroller.selectedCartIds
                                        .contains(_viewcartcontroller
                                            .userList.value.viewCart?[index].id
                                            .toString()) ||
                                    !_applycouponcode.selectedCartIds.contains(
                                        _viewcartcontroller
                                            .userList.value.viewCart?[index].id
                                            .toString())) {
                                  placeordercontroller.selectedCartIds.add(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  _applycouponcode.selectedCartIds.add(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  DeleteCartCartControlleri.selectedCartIds.add(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  print(DeleteCartCartControlleri
                                      .selectedCartIds);
                                  print(_applycouponcode.selectedCartIds);
                                } else {
                                  placeordercontroller.selectedCartIds.remove(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  _applycouponcode.selectedCartIds.remove(
                                      _viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  DeleteCartCartControlleri.selectedCartIds
                                      .remove(_viewcartcontroller
                                          .userList.value.viewCart?[index].id
                                          .toString());
                                  print(DeleteCartCartControlleri
                                      .selectedCartIds);
                                }
                                // // deleteCartId = _viewcartcontroller
                                // //     .userList.value.viewCart?[index].id
                                // //     .toString();

                                // print(deleteCartId);
                                // DeleteCartCartController().deleteCartApiHit();
                              },
                              child: Container(
                                height: Get.height * .03,
                                width: Get.width * .05,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xffff8300),
                                  ),
                                  color: Colors.white,
                                ),
                                child: isSelectedList[index]
                                    ? Center(
                                        child: Container(
                                          height: Get.height * .02,
                                          width: Get.width * .03,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffff8300),
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        SizedBox(
                          width: 221.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.v),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "${_viewcartcontroller.userList.value.viewCart?[index].price.toString()}",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                      TextSpan(
                                        text: " ",
                                      ),
                                      TextSpan(
                                        text:
                                            "${_viewcartcontroller.userList.value.viewCart?[index].totalPrice.toString()}",
                                        style: CustomTextStyles
                                            .titleSmallGray50001
                                            .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              // Container(
                              //   width: Get.width * .2,
                              //   height: Get.height * .04,
                              //   decoration: AppDecoration.fillPrimary.copyWith(
                              //     borderRadius:
                              //         BorderRadiusStyle.circleBorder30,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       // GestureDetector(
                              //       //   onTap: () {
                              //       //     CartId = _viewcartcontroller
                              //       //         .userList.value.viewCart![index].id
                              //       //         .toString();
                              //       //     // Decrement the counter when "-" is pressed
                              //       //     _viewcartcontroller
                              //       //         .userList
                              //       //         .value
                              //       //         .viewCart![index]
                              //       //         .totalQty
                              //       //         .value -= 1;
                              //       //     print(_viewcartcontroller.userList.value
                              //       //         .viewCart![index].totalQty.value);

                              //       //     CartProductQtyIncrementCartcontroller()
                              //       //         .QtyUpdate_Apihit(
                              //       //             context, index, "decrement");
                              //       //   },
                              //       //   child: Icon(
                              //       //     Icons.remove,
                              //       //     color: Colors.white,
                              //       //     size: 15,
                              //       //   ),
                              //       // ),
                              //       GestureDetector(
                              //         onTap: () {
                              //           CartId = _viewcartcontroller
                              //               .userList.value.viewCart![index].id
                              //               .toString();
                              //           // Check if the current quantity is greater than 1 before decrementing
                              //           if (_viewcartcontroller
                              //                   .userList
                              //                   .value
                              //                   .viewCart![index]
                              //                   .totalQty
                              //                   .value >
                              //               1) {
                              //             // Decrement the counter
                              //             _viewcartcontroller
                              //                 .userList
                              //                 .value
                              //                 .viewCart![index]
                              //                 .totalQty
                              //                 .value -= 1;
                              //             print(_viewcartcontroller
                              //                 .userList
                              //                 .value
                              //                 .viewCart![index]
                              //                 .totalQty
                              //                 .value);
                              //             CartProductQtyIncrementCartcontroller()
                              //                 .QtyUpdate_Apihit(
                              //                     context, index, "decrement");
                              //           } else {
                              //             // If quantity is already 1 or less, do nothing or show a message
                              //             // You can add a toast, snackbar, or any other UI feedback here
                              //           }
                              //         },
                              //         child: Icon(
                              //           Icons.remove,
                              //           color: Colors.white,
                              //           size: 15,
                              //         ),
                              //       ),

                              //       Center(
                              //           child: Text(
                              //         _viewcartcontroller.userList.value
                              //             .viewCart![index].totalQty.value
                              //             .toString(),
                              //         style: theme.textTheme.bodyMedium
                              //             ?.copyWith(color: Colors.white),
                              //       )),
                              //       GestureDetector(
                              //         onTap: () {
                              //           CartId = _viewcartcontroller
                              //               .userList.value.viewCart![index].id
                              //               .toString();
                              //           // Increment the counter when "+" is pressed
                              //           _viewcartcontroller
                              //               .userList
                              //               .value
                              //               .viewCart![index]
                              //               .totalQty
                              //               .value += 1;
                              //           print(_viewcartcontroller.userList.value
                              //               .viewCart![index].totalQty.value);

                              //           CartProductQtyIncrementCartcontroller()
                              //               .QtyUpdate_Apihit(
                              //                   context, index, "increment");
                              //         },
                              //         child: Icon(
                              //           Icons.add,
                              //           color: Colors.white,
                              //           size: 15,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                width: Get.width * .2,
                                height: Get.height * .04,
                                decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder30,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        CartId = _viewcartcontroller
                                            .userList.value.viewCart![index].id
                                            .toString();
                                        // Check if the current quantity is greater than 1 before decrementing
                                        if (_viewcartcontroller
                                                .userList
                                                .value
                                                .viewCart![index]
                                                .totalQty
                                                .value >
                                            1) {
                                          // Decrement the counter
                                          _viewcartcontroller
                                              .userList
                                              .value
                                              .viewCart![index]
                                              .totalQty
                                              .value -= 1;
                                          print(_viewcartcontroller
                                              .userList
                                              .value
                                              .viewCart![index]
                                              .totalQty
                                              .value);
                                          CartProductQtyIncrementCartcontroller()
                                              .QtyUpdate_Apihit(
                                                  context, index, "decrement");
                                        } else {
                                          // If quantity is already 1 or less, do nothing or show a message
                                          // You can add a toast, snackbar, or any other UI feedback here
                                        }
                                        // Force the widget to rebuild to reflect the new quantity
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        _viewcartcontroller.userList.value
                                            .viewCart![index].totalQty.value
                                            .toString(),
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        CartId = _viewcartcontroller
                                            .userList.value.viewCart![index].id
                                            .toString();
                                        // Increment the counter when "+" is pressed
                                        _viewcartcontroller
                                            .userList
                                            .value
                                            .viewCart![index]
                                            .totalQty
                                            .value += 1;
                                        print(_viewcartcontroller.userList.value
                                            .viewCart![index].totalQty.value);

                                        CartProductQtyIncrementCartcontroller()
                                            .QtyUpdate_Apihit(
                                                context, index, "increment");
                                        // Force the widget to rebuild to reflect the new quantity
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      width: 98.h,
      controller: vectorController,
      hintText: "أزرق داكن/متوسط(38)",
      hintStyle: CustomTextStyles.bodySmallGray90001?.copyWith(),
      suffix: Container(
        margin: EdgeInsets.fromLTRB(4.h, 7.v, 10.h, 7.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgVectorGray900013x6,
          height: 3.v,
          width: 6.h,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 20.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 10.h,
        top: 5.v,
        bottom: 5.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.fillGray,
      fillColor: appTheme.gray10003,
    );
  }

  /// Section Widget
  // Widget _buildTrailRunningJacket1(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 10.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CustomImageView(
  //           imagePath: ImageConstant.imgRectangle569100x100,
  //           height: 100.adaptSize,
  //           width: 100.adaptSize,
  //           radius: BorderRadius.circular(
  //             10.h,
  //           ),
  //           margin: EdgeInsets.only(bottom: 15.v),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 14.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               SizedBox(height: 20),
  //               Row(
  //                 children: [
  //                   Text(
  //                     "Nike running jacket...",
  //                     style: theme.textTheme.titleSmall?.copyWith(),
  //                   ),
  //                   SizedBox(width: Get.width * .2),
  //                   GestureDetector(
  //                     onTap: () {
  //                       setState(() {
  //                         isSelected = !isSelected;
  //                       });
  //                     },
  //                     child: Container(
  //                       height: Get.height * .03,
  //                       width: Get.width * .05,
  //                       decoration: BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         border: Border.all(
  //                           width: 2,
  //                           color: Color(0xffff8300),
  //                         ),
  //                         color: Colors.white,
  //                       ),
  //                       child: isSelected
  //                           ? Center(
  //                               child: Container(
  //                                 height: Get.height * .02,
  //                                 width: Get.width * .03,
  //                                 decoration: BoxDecoration(
  //                                   shape: BoxShape.circle,
  //                                   color: Color(0xffff8300),
  //                                 ),
  //                               ),
  //                             )
  //                           : null,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               // CustomRadioButton(
  //               //   width: 221.h,
  //               //   text: "سترة الجري من نايك...",
  //               //   value: "سترة الجري من نايك...",
  //               //   groupValue: radioGroup1,
  //               //   textStyle: theme.textTheme.titleSmall?.copyWith(),
  //               //   isRightCheck: true,
  //               //   onChange: (value) {
  //               //     radioGroup1 != value;
  //               //   },
  //               // ),
  //               SizedBox(height: 9.v),
  //               _buildTrailRunningJacketBy(context),
  //               SizedBox(height: 9.v),
  //               Text(
  //                 "Black Friday! Ends at 16:19:50:21",
  //                 style: CustomTextStyles.labelLargePrimary?.copyWith(),
  //               ),
  //               SizedBox(height: 6.v),
  //               _buildprice_2(
  //                 context,
  //                 price: "\$99 \$120",
  //                 one: "1",
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Container(
      height: 70.v,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color.fromARGB(125, 252, 228, 236)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          // alignment: Alignment.topRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgInfoCircle1,
              height: 10.adaptSize,
              width: 10.adaptSize,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(
                top: 19.v,
              ),
            ),
            SizedBox(
              width: 306.h,
              child: Text(
                  "  The availability and price of the item are not guaranteed until final payment is made.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Obx(() {
      if (addressname.value == "" || addressIndexId == null) {
        return Center(
            child: Text(
          'Please Go and Select Address',
          style: TextStyle(color: Colors.red),
        ));
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.adaptSize,
                width: 50.adaptSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle584,
                      height: 50.adaptSize,
                      width: 50.adaptSize,
                      radius: BorderRadius.circular(
                        10.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    CustomIconButton(
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      padding: EdgeInsets.all(3.h),
                      decoration: IconButtonStyleHelper.fillPrimaryTL10,
                      alignment: Alignment.center,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgGroup26,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * .03,
              ),
              Container(
                width: 193.h,
                margin: EdgeInsets.only(
                  left: 15.h,
                  top: 5.v,
                  bottom: 4.v,
                ),
                child: Text("${addressname.value}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumGray9000115
                        .copyWith(height: 1.47)),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.v,
                  bottom: 12.v,
                ),
                child: CustomIconButton(
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  decoration: IconButtonStyleHelper.fillGreen,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheck,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  /// Section Widget
  Widget _buildVisaClassic(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 50.adaptSize,
            width: 50.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillGray,
            child: CustomImageView(
              imagePath: ImageConstant.imgGroup27,
            ),
          ),
          SizedBox(
            width: Get.width * .03,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 4.v,
              bottom: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Visa Classic",
                  style: CustomTextStyles.titleSmall15,
                ),
                SizedBox(height: 12.v),
                Text(
                  "**** 7690",
                  style: CustomTextStyles.bodyMedium13,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 13.v,
              bottom: 12.v,
            ),
            child: CustomIconButton(
              height: 25.adaptSize,
              width: 25.adaptSize,
              padding: EdgeInsets.all(5.h),
              decoration: IconButtonStyleHelper.fillGreen,
              child: CustomImageView(
                imagePath: ImageConstant.imgCheck,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  // Widget _buildCouponCode(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 20.h),
  //     decoration: AppDecoration.outlinePrimary.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder15,
  //     ),
  //     child: DottedBorder(
  //       color: theme.colorScheme.primary,
  //       padding: EdgeInsets.only(
  //         left: 1.h,
  //         top: 1.v,
  //         right: 1.h,
  //         bottom: 1.v,
  //       ),
  //       strokeWidth: 1.h,
  //       radius: Radius.circular(15),
  //       borderType: BorderType.RRect,
  //       dashPattern: [
  //         5,
  //         5,
  //       ],
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 15.h,
  //           vertical: 16.v,
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Expanded(
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: 4.v),
  //                 child: CustomTextFormField(
  //                   controller: group166Controller,
  //                   hintText: "Enter coupon code here",
  //                   hintStyle: CustomTextStyles.bodyLargeOnError_1,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(
  //                 left: 12.h,
  //                 top: 3.v,
  //                 right: 2.h,
  //               ),
  //               child: Text("Apply",
  //                   style: TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w600,
  //                       color: Color(0xffff8300))),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _buildCouponCode(BuildContext context) {
    // void _selectCoupon(String coupon) {
    //   group166Controller.text = coupon;
    // }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: DottedBorder(
        color: theme.colorScheme.primary,
        padding: EdgeInsets.only(
          left: 1.h,
          top: 1.v,
          right: 1.h,
          bottom: 1.v,
        ),
        strokeWidth: 1.h,
        radius: Radius.circular(15),
        borderType: BorderType.RRect,
        dashPattern: [
          5,
          5,
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 16.v,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: CustomTextFormField(
                    controller: group166Controller,
                    hintText: couponcodeee.value.isNotEmpty
                        ? couponcodeee.value
                        : "Enter coupon code here",
                    hintStyle: CustomTextStyles.bodyLargeOnError_1,
                    readOnly: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  // top: 3.v,
                  bottom: 10.h,
                  right: 2.h,
                ),
                child: GestureDetector(
                  // onTap: () {
                  //   if (_couponCodeController
                  //               .couponlist.value.availableCoupon ==
                  //           [] ||
                  //       _couponCodeController
                  //               .couponlist.value.availableCoupon ==
                  //           "") {
                  //     return Utils.snackBar(context, 'Oops! ',
                  //         "Looks like there are no coupons available at the moment.\n Check back later for exciting offers!");
                  //   } else {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         isScrollControlled: true,
                  //         builder: (context) {
                  //           return _openCouponList(context);
                  //         });
                  //   }
                  // },
                  onTap: () {
                    if (_couponCodeController
                                .couponlist.value.availableCoupon ==
                            [] ||
                        _couponCodeController
                            .couponlist.value.availableCoupon!.isEmpty) {
                      return Utils.snackBar(context, 'Oops! ',
                          "Looks like there are no coupons available at the moment.\n Check back later for exciting offers!");
                    } else {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return _openCouponList(context);
                          });
                    }
                  },
                  child: Text(
                    couponcodeee.value.isNotEmpty ? "Applied" : "Apply",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffff8300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _openCouponList(
    BuildContext context,
  ) {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      child: Container(
        height: double.infinity,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 18.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          children: [
            ListView.builder(
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
                    width: Get.width * .5,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(52, 158, 158, 158),
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
                                  ?.copyWith(color: Colors.white, fontSize: 45),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .06,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  .copyWith(color: Colors.grey.shade400),
                            ),
                            Gap(5),
                            CustomElevatedButton(
                              height: 40.v,
                              width: 100.h,
                              text: "Apply",
                              margin: EdgeInsets.only(left: 8.h),
                              buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                              buttonTextStyle:
                                  CustomTextStyles.labelLargeWhiteA70002_1,
                              onPressed: () {
                                String? couponid = _couponCodeController
                                    .couponlist.value.availableCoupon![index].id
                                    .toString();
                                String? totalAmount =
                                    totalAmountForApi.toString();
                                couponcodeee.value = _couponCodeController
                                    .couponlist
                                    .value
                                    .availableCoupon?[index]
                                    .code;
                                couponDiscountAmount.value =
                                    _couponCodeController.couponlist.value
                                        .availableCoupon?[index].amount;
                                print(couponid);
                                print(totalAmount);
                                setState(() {
                                  CouponId = couponid;
                                  TotalAmount = totalAmount;
                                  // Timer(Duration(seconds: 1), () {
                                  //   setState(() {
                                  //     _applycouponcode.discountPrice.value;
                                  //   });
                                  // });
                                });
                                _applycouponcode.applyCoupon_apihit(
                                    context, _applycouponcode.selectedCartIds);

                                print(
                                    "${_applycouponcode.discountPrice.value}==discountt");
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })
            //   }
            // }),
          ],
        ),
      ),
    );
  }

  Widget _buildItemTotal(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Item(s) total:",
            style: theme.textTheme.bodyLarge,
          ),
          totalAmountForApi == 0
              ? Text(
                  "${_viewcartcontroller.userList.value.totalPrice.toString()}",
                  style: CustomTextStyles.titleMediumMedium16,
                )
              : Text(
                  totalAmountForApi.toString(),
                  style: CustomTextStyles.titleMediumMedium16,
                ),
        ],
      ),
    );
  }

  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Size", style: theme.textTheme.titleMedium),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 2.v),
            //   child: Text("Size Guide",
            //       style: theme.textTheme.titleMedium
            //           ?.copyWith(color: Colors.grey)),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckout(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1.5,
                padding: EdgeInsets.symmetric(vertical: 18.v),
                decoration: AppDecoration.fillWhiteA.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.v),
                              child: Text(
                                "Pricing Details",
                                style: theme.textTheme.titleMedium?.copyWith(),
                              ),
                            ),
                            CustomImageView(
                              onTap: () {
                                Get.back();
                              },
                              imagePath: ImageConstant.imgMaskGroup24x24,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 17.v),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(height: 19.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "shopping cart (1)",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle56980x80,
                        height: Get.height * .2,
                        width: Get.width * .3,
                        radius: BorderRadius.circular(
                          5.h,
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 20.h),
                      ),
                      SizedBox(height: 7.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$99",
                                  style: theme.textTheme.titleSmall,
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "x 1",
                                  style: CustomTextStyles.bodyMediumPrimary_1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 26.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "Item Total:",
                          priceText: "\$99",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "Item Discount:",
                          priceText: "\$20",
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: _buildItemDiscount(
                          context,
                          itemDiscountText: "Total",
                          priceText: "\$218",
                        ),
                      ),
                      SizedBox(height: 27.v),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: Get.width * .19,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Allselected2 = !Allselected2;
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * .03,
                                    width: Get.width * .05,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xffff8300),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Allselected2
                                        ? Center(
                                            child: Container(
                                              height: Get.height * .02,
                                              width: Get.width * .03,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffff8300),
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .01,
                                ),
                                Text(
                                  "All",
                                  style: theme.textTheme.titleSmall?.copyWith(),
                                ),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              Get.to(() => OrderConfirmedScreen());
                            },
                            height: 40.v,
                            width: 100.h,
                            text: "Checkout",
                            margin: EdgeInsets.only(left: 10.h),
                            buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                            buttonTextStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Container(
                            height: 40.v,
                            width: 120.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.black)),
                            margin: EdgeInsets.only(left: 23.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Total\$",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      TextSpan(
                                        text: " 218",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(Icons.keyboard_arrow_up_sharp)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 40.v,
        width: 120.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black)),
        margin: EdgeInsets.only(left: 23.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Total \$",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  TextSpan(
                    text: " 79",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            Icon(Icons.keyboard_arrow_up_sharp)
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: Get.width * .19,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'All',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Allselected = !Allselected;
                  });
                },
                child: Container(
                  height: Get.height * .03,
                  width: Get.width * .05,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                    color: Colors.white,
                  ),
                  child: Allselected
                      ? Center(
                          child: Container(
                            height: Get.height * .02,
                            width: Get.width * .03,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
        _buildCheckout(context),
        Container(
            height: 40.v,
            width: 100.h,
            decoration: BoxDecoration(
                color: Color(0xffff8300),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Color(0xffff8300))),
            margin: EdgeInsets.only(left: 23.h),
            child: Center(
                child: Text('Checkout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )))),
      ],
    );
  }

  /// Section Widget
  Widget _buildAddToCart(BuildContext context) {
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (homeView_controller.rxRequestStatus.value == Status.ERROR) {
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
              style: theme.textTheme.headlineMedium
                  ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
            ),
          ],
        )));
      } else {
        return Container(
          height: Get.height * .3,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount:
                homeView_controller.userList.value.recommendedProduct?.length,
            itemBuilder: (BuildContext context, int index) {
              // bool inCart =
              // productviewcontroller.userlist.value.productView!.inCart;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                fit: BoxFit.cover,
                                imagePath:
                                    "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                                height: 120.adaptSize,
                                width: 120.adaptSize,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                onTap: () {
                                  mainCatId = homeView_controller
                                      .userList
                                      .value
                                      .recommendedProduct?[index]
                                      .mainCategoryId!
                                      .toString();
                                  productId = homeView_controller.userList.value
                                      .recommendedProduct?[index].id!
                                      .toString();
                                  print('${mainCatId}===${productId}===');
                                  _singleproductviewController
                                      .Single_ProductApiHit(
                                          context, productId, mainCatId);
                                  Get.to(SingleProductView());
                                },
                              ),
                              SizedBox(height: 9.v),
                              Container(
                                width: Get.width * .3,
                                child: Text(
                                  "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                                  style: theme.textTheme.labelLarge
                                      ?.copyWith(fontSize: 10),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 1.v),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.v),
                                    child: CustomRatingBar(
                                      ignoreGestures: true,
                                      initialRating: homeView_controller
                                          .userList
                                          .value
                                          .recommendedProduct?[index]
                                          .averageRating
                                          ?.toDouble(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      "(${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()})",
                                      style:
                                          CustomTextStyles.labelMediumGray90001,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.v),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
                                      style: CustomTextStyles
                                          .titleSmallPrimarySemiBold,
                                    ),
                                    TextSpan(
                                      text: " ",
                                    ),
                                    TextSpan(
                                      text: "2k+ sold",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 6.v),
                              GestureDetector(
                                onTap: () {
                                  mainCatId = homeView_controller.userList.value
                                      .recommendedProduct?[index].mainCategoryId
                                      .toString();
                                  productId = homeView_controller.userList.value
                                      .recommendedProduct?[index].id
                                      ?.toString();

                                  print("${mainCatId},=====${productId}");

                                  // if (mainCatId == "153") {
                                  productviewcontroller.Single_ProductApiHit(
                                      context, productId, mainCatId);

                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return _buildAddtocart(
                                            context, productId, mainCatId);
                                      });
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    border: Border.all(
                                      color: tappedList[index]
                                          ? Colors.orange
                                          : Colors.black,
                                      width: 2,
                                    ),
                                    color: tappedList[index]
                                        ? Colors.orange
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      // inCart?"Already In Cart":
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: tappedList[index]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ])),
              );
            },
          ),
        );
      }
    });
  }

  /// Section Widget
  Widget _buildCart1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: Get.height * .4,
          crossAxisCount: 2,
          // mainAxisSpacing: 2,
          crossAxisSpacing: 10.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount:
            homeView_controller.userList.value.recommendedProduct?.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width, padding: EdgeInsets.only(left: 10),
                //    width: 170.adaptSize,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageView(
                      onTap: () {
                        mainCatId = homeView_controller.userList.value
                            .recommendedProduct?[index].mainCategoryId!
                            .toString();
                        productId = homeView_controller
                            .userList.value.recommendedProduct?[index].id!
                            .toString();
                        print('${mainCatId}===${productId}===');
                        _singleproductviewController.Single_ProductApiHit(
                            context, productId, mainCatId);
                        Get.to(SingleProductView());
                      },
                      fit: BoxFit.cover,
                      imagePath:
                          "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                      // ImageConstant.imgRectangle569,
                      height: 190.adaptSize,
                      width: 190.adaptSize,
                      radius: BorderRadius.circular(
                        10.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 10.v,
                          right: 10.h,
                        ),
                        child: CustomIconButton(
                          onTap: () {
                            Add_remove_productidd = homeView_controller
                                .userList.value.recommendedProduct![index].id!
                                .toString();
                            EnglishAdd_remove_wishlistController()
                                .AddRemoveWishlish_apihit();

                            setState(() {
                              isButtonTappedList[index] =
                                  !isButtonTappedList[index];
                            });
                          },
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          padding: EdgeInsets.all(5.h),
                          decoration: IconButtonStyleHelper.fillWhiteA,
                          alignment: Alignment.topRight,
                          child: CustomImageView(
                            imagePath: isButtonTappedList[index]
                                ? ImageConstant
                                    .imgGroup239531 // Change this to your tapped image
                                : ImageConstant.imgSearch, // Default image
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 16.v,
                  width: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(71, 228, 193, 204),
                  ),
                  child: Center(
                    child: Text(
                      "10% Off",
                      style: TextStyle(
                        fontSize: 8, color: Color(0xffff8300),
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'Jost'
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 131.h,
                  child: Text(
                    "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                    //  "Luxury Rhinestone Quartz Watch Ladies Rome...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge!.copyWith(
                      height: 1.33,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
                                // "4.8",
                                style: theme.textTheme.labelMedium,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: CustomRatingBar(
                                  ignoreGestures: true,
                                  initialRating: homeView_controller
                                      .userList
                                      .value
                                      .recommendedProduct?[index]
                                      .averageRating
                                      ?.toDouble(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.v),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
                                //"99 ",
                                style: CustomTextStyles.titleMediumPrimary_2,
                              ),
                              TextSpan(
                                text: "2k+ sold",
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 35.h,
                        top: 5.v,
                      ),
                      child: CustomIconButton(
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          padding: EdgeInsets.all(6.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGroup239533,
                            onTap: () {
                              mainCatId = homeView_controller.userList.value
                                  .recommendedProduct?[index].mainCategoryId
                                  .toString();
                              productId = homeView_controller
                                  .userList.value.recommendedProduct?[index].id
                                  ?.toString();

                              print("${mainCatId},=====${productId}");

                              // if (mainCatId == "153") {
                              productviewcontroller.Single_ProductApiHit(
                                  context, productId, mainCatId);

                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return _buildAddtocart(
                                        context, productId, mainCatId);
                                  });
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Common widget
  Widget _buildPaymentMethod(
    BuildContext context, {
    required String paymentMethodText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          paymentMethodText,
          style: theme.textTheme.titleMedium!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ],
    );
  }

  Widget _buildItemDiscount(
    BuildContext context, {
    required String itemDiscountText,
    required String priceText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemDiscountText,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        Text(
          priceText,
          style: CustomTextStyles.titleMediumMedium16.copyWith(
            color: Color(0xffFF8300),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "My Cart",
        margin: EdgeInsets.only(left: 20.h),
      ),
    );
  }

  Widget _buildAddtocart(
    BuildContext context,
    String? productId,
    String? mainCatId,
  ) {
    if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
      return Container(
          constraints: BoxConstraints(
              // maxHeight: 400
              maxHeight: Get.height * 0.54),
          child: Container(
              height: double.infinity,
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(vertical: 18.v),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL30,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.v),
                            child: Text(
                              "Add to cart",
                              style: theme.textTheme.titleMedium?.copyWith(),
                            ),
                          ),
                          CustomImageView(
                            onTap: () {
                              Get.back();
                            },
                            imagePath: ImageConstant.imgMaskGroup24x24,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                    Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/error2.png',
                          height: Get.height * 0.3,
                        ),
                        Text(
                          "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
                          style: theme.textTheme.headlineMedium?.copyWith(
                              color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
                        ),
                      ],
                    ))
                  ])));
    } else {
      return Container(
        constraints: BoxConstraints(
            // maxHeight: 700
            maxHeight: Get.height * 0.93),
        child: Container(
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(vertical: 18.v),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.v),
                      child: Text(
                        "Add to cart",
                        style: theme.textTheme.titleMedium?.copyWith(),
                      ),
                    ),
                    CustomImageView(
                      onTap: () {
                        Get.back();
                        setState(() {
                          color = null;
                          size1 = null;
                          selectedcolored.value = "";
                          sizeid = null;
                          modelid = null;
                          itemid = null;
                          weightid = null;
                          quantityid = null;
                          capacityid = null;
                          colorId = null;
                          productpricechangeDetails = {};
                          AselectedcolorIndex.value = (-1);
                          AselectedSizeIndex.value = (-1);
                          AselectedModelIndex.value = (-1);
                          AselecteditemIndex.value = (-1);
                          AselectedCapacityIndex.value = (-1);
                          AselectedquantityIndex.value = (-1);
                          AselectedweightIndex.value = (-1);
                          _currentIndex = 0;
                        });
                      },
                      imagePath: ImageConstant.imgMaskGroup24x24,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade200,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              height: Get.height * .5,
                              width: double.maxFinite,
                              decoration: AppDecoration.fillGray10003,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (productviewcontroller.userlist.value
                                          .productView?.productType ==
                                      "variable")
                                    selectedcolored.value.isNotEmpty
                                        ? PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: productviewcontroller
                                                    .userlist
                                                    .value
                                                    .productView!
                                                    .productDetails
                                                    ?.details
                                                    ?.color?[0]
                                                    .gallery
                                                    ?.length ??
                                                0,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              List<String>? colorGallery =
                                                  productviewcontroller
                                                      .userlist
                                                      .value
                                                      .productView!
                                                      .productDetails
                                                      ?.details
                                                      ?.color?[
                                                          selectedcolorIndex
                                                              .value]
                                                      .gallery;
                                              String imageUrl =
                                                  colorGallery?[index] ?? '';
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                                                    "$imageUrl",
                                                // "${productviewcontroller.userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                                                height: 504.v,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                        : PageView.builder(
                                            controller: _pageController,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomImageView(
                                                fit: BoxFit.fill,
                                                imagePath:
                                                    "${productviewcontroller.userlist.value.productView?.imageUrl}",
                                                height: Get.height * .5,
                                                width: Get.width,
                                                alignment: Alignment.center,
                                              );
                                            },
                                            onPageChanged: (index) {
                                              setState(() {
                                                _currentIndex = index;
                                              });
                                            },
                                          )
                                  else
                                    PageView.builder(
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productviewcontroller
                                              .userlist
                                              .value
                                              .productView
                                              ?.galleryUrl
                                              ?.length ??
                                          0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return CustomImageView(
                                          fit: BoxFit.fill,
                                          imagePath:
                                              // selectedImageUrl.isNotEmpty
                                              //     ? selectedImageUrl

                                              "${productviewcontroller.userlist.value.productView?.galleryUrl?[index] ?? ''}",
                                          height: Get.height * .5,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                        );
                                      },
                                      onPageChanged: (index) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (productviewcontroller
                                                  .userlist
                                                  .value
                                                  .productView
                                                  ?.productType ==
                                              "variable")
                                            selectedcolored.value.isNotEmpty
                                                ? _buildButtonOneHundredTen(
                                                    context,
                                                    productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView!
                                                            .productDetails
                                                            ?.details
                                                            ?.color?[0]
                                                            .gallery
                                                            ?.length ??
                                                        0,
                                                    _currentIndex, // Pass the current index
                                                  )
                                                : _buildButtonOneHundredTen(
                                                    context,
                                                    1,
                                                    _currentIndex, // Pass the current index
                                                  )
                                          else
                                            _buildButtonOneHundredTen(
                                              context,

                                              productviewcontroller
                                                      .userlist
                                                      .value
                                                      .productView
                                                      ?.galleryUrl
                                                      ?.length ??
                                                  0,
                                              _currentIndex, // Pass the current index
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.userlist.value.productView?.title.toString()}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                            ),
                          ),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Text(
                            // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                            "${productviewcontroller.userlist.value.productView?.description.toString()}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Jost',
                            ),
                          ),
                        ),
                        SizedBox(height: 14.v),
                        Container(
                          height: Get.height * .04,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${productviewcontroller.userlist.value.productView?.price.toString()}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text: " \$120",
                                              //   style: CustomTextStyles
                                              //       .titleMediumGray50001
                                              //       .copyWith(
                                              //     decoration: TextDecoration
                                              //         .lineThrough,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(width: Get.width * .02),
                                        Container(
                                          width: 63,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color.fromARGB(
                                                36, 206, 117, 147),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "-20% off",
                                              style: TextStyle(
                                                color: Color(0xffff8300),
                                                fontSize: 9,
                                                fontFamily: 'Jost',
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .03,
                        ),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.color !=
                                null)
                          Container(
                            // height: Get.height * .16,
                            height: Get.height * .18,
                            child: ListView.builder(
                                itemCount: 1,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  color = productviewcontroller
                                      .userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .value
                                      .toString();

                                  return Column(
                                    children: [
                                      // SizedBox(height: 11.v),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Colors: ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: selectedcolorIndex
                                                                .value !=
                                                            -1
                                                        ? selectedcolored.value
                                                        : " ",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    158,
                                                                    158,
                                                                    158),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 11.v),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            // height: Get.height * .13,
                                            height: Get.height * .14,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .color
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String selectedcolorname =
                                                    productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.color?[index]
                                                            .value ??
                                                        "";
                                                String imageUrl =
                                                    productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView
                                                        ?.productDetails
                                                        ?.details
                                                        ?.color?[index]
                                                        .featureImage;
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedcolored
                                                                  .value =
                                                              selectedcolorname;
                                                          selectedcolorIndex
                                                              .value = index;
                                                          selectedImageUrl =
                                                              imageUrl;
                                                          selectedImageIndex =
                                                              index;
                                                          print(
                                                              "${selectedcolored.value},${selectedcolorIndex.value}");
                                                        });

                                                        colorId =
                                                            productviewcontroller
                                                                .userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.color?[index]
                                                                .id
                                                                .toString();

                                                        pid =
                                                            productviewcontroller
                                                                .userlist
                                                                .value
                                                                .productView
                                                                ?.id
                                                                .toString();
                                                        productColor =
                                                            colorId.toString();
                                                        productSize =
                                                            sizeid.toString();
                                                        productQuantity =
                                                            quantityid
                                                                .toString();
                                                        productweight =
                                                            weightid.toString();
                                                        productCapacity =
                                                            capacityid
                                                                .toString();
                                                        productItem =
                                                            productItem
                                                                .toString();
                                                        productModel =
                                                            productModel
                                                                .toString();

                                                        _productpricechangebyattributecontroller
                                                            .ProductPriceChangeByAttribute(
                                                                context);

                                                        // print(selectedSizeIndex);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                            height: 100,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: selectedcolorIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                            3)
                                                                    : Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height: 80,
                                                                  width: 70,
                                                                  child: Center(
                                                                    child:
                                                                        CustomImageView(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      imagePath:
                                                                          "$imageUrl",
                                                                      height: 80
                                                                          .adaptSize,
                                                                      width: 70
                                                                          .adaptSize,
                                                                      radius: BorderRadius
                                                                          .circular(
                                                                        6.h,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Center(
                                                                  child: Text(
                                                                    '$selectedcolorname',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.size !=
                                null)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              // itemCount: 1,
                              itemCount: productviewcontroller
                                      .userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.size
                                      ?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                size1 = productviewcontroller
                                    .userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.size?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    _buildRowSize(context),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: 10.h,
                                              );
                                            },
                                            itemCount: productviewcontroller
                                                    .userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .size
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String selectedsizename =
                                                  productviewcontroller
                                                          .userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.size?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    AselectedSizeIndex.value =
                                                        index;
                                                    sizeid =
                                                        productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.size?[index]
                                                            .id
                                                            .toString();

                                                    pid = productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView
                                                        ?.id
                                                        .toString();
                                                    productColor =
                                                        colorId.toString();
                                                    productSize =
                                                        sizeid.toString();
                                                    productQuantity =
                                                        quantityid.toString();
                                                    productweight =
                                                        weightid.toString();
                                                    productCapacity =
                                                        capacityid.toString();
                                                    productItem =
                                                        productItem.toString();
                                                    productModel =
                                                        productModel.toString();

                                                    _productpricechangebyattributecontroller
                                                        .ProductPriceChangeByAttribute(
                                                            context);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: AselectedSizeIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$selectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.capacity !=
                                null)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Capacity = productviewcontroller
                                    .userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.capacity?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Capacity",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(fontSize: 20)),
                                            // Padding(
                                            //   padding: EdgeInsets.only(bottom: 2.v),
                                            //   child: Text("Size Guide",
                                            //       style: theme.textTheme.titleMedium
                                            //           ?.copyWith(color: Colors.grey, fontSize: 20)),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: 10.h,
                                              );
                                            },
                                            itemCount: productviewcontroller
                                                    .userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .capacity
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String Aselectedsizename =
                                                  productviewcontroller
                                                          .userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.capacity?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    AselectedCapacityIndex
                                                        .value = index;
                                                    capacityid =
                                                        productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.capacity?[index]
                                                            .id
                                                            .toString();

                                                    pid = productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView
                                                        ?.id
                                                        .toString();
                                                    productColor =
                                                        colorId.toString();
                                                    productSize =
                                                        sizeid.toString();
                                                    productQuantity =
                                                        quantityid.toString();
                                                    productweight =
                                                        weightid.toString();
                                                    productCapacity =
                                                        capacityid.toString();
                                                    productItem =
                                                        productItem.toString();
                                                    productModel =
                                                        productModel.toString();

                                                    _productpricechangebyattributecontroller
                                                        .ProductPriceChangeByAttribute(
                                                            context);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: AselectedCapacityIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$Aselectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.quantityy !=
                                null)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Quantity = productviewcontroller
                                    .userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.quantityy?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Quantity",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(fontSize: 20)),
                                            // Padding(
                                            //   padding: EdgeInsets.only(bottom: 2.v),
                                            //   child: Text("Size Guide",
                                            //       style: theme.textTheme.titleMedium
                                            //           ?.copyWith(color: Colors.grey, fontSize: 20)),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: 10.h,
                                              );
                                            },
                                            itemCount: productviewcontroller
                                                    .userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .quantityy
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String Aselectedsizename =
                                                  productviewcontroller
                                                          .userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.quantityy?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    AselectedquantityIndex
                                                        .value = index;
                                                    quantityid =
                                                        productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.quantityy?[index]
                                                            .id
                                                            .toString();

                                                    pid = productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView
                                                        ?.id
                                                        .toString();
                                                    productColor =
                                                        colorId.toString();
                                                    productSize =
                                                        sizeid.toString();
                                                    productQuantity =
                                                        quantityid.toString();
                                                    productweight =
                                                        weightid.toString();
                                                    productCapacity =
                                                        capacityid.toString();
                                                    productItem =
                                                        productItem.toString();
                                                    productModel =
                                                        productModel.toString();

                                                    _productpricechangebyattributecontroller
                                                        .ProductPriceChangeByAttribute(
                                                            context);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: AselectedquantityIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$Aselectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.weight !=
                                null)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Weight = productviewcontroller
                                    .userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.weight?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Weight",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(fontSize: 20)),
                                            // Padding(
                                            //   padding: EdgeInsets.only(bottom: 2.v),
                                            //   child: Text("Size Guide",
                                            //       style: theme.textTheme.titleMedium
                                            //           ?.copyWith(color: Colors.grey, fontSize: 20)),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: 10.h,
                                              );
                                            },
                                            itemCount: productviewcontroller
                                                    .userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .weight
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String Aselectedsizename =
                                                  productviewcontroller
                                                          .userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.weight?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    AselectedweightIndex.value =
                                                        index;
                                                    weightid =
                                                        productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.weight?[index]
                                                            .id
                                                            .toString();

                                                    pid = productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView
                                                        ?.id
                                                        .toString();
                                                    productColor =
                                                        colorId.toString();
                                                    productSize =
                                                        sizeid.toString();
                                                    productQuantity =
                                                        quantityid.toString();
                                                    productweight =
                                                        weightid.toString();
                                                    productCapacity =
                                                        capacityid.toString();
                                                    productItem =
                                                        productItem.toString();
                                                    productModel =
                                                        productModel.toString();

                                                    _productpricechangebyattributecontroller
                                                        .ProductPriceChangeByAttribute(
                                                            context);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: AselectedweightIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$Aselectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.model !=
                                null)
                          Container(
                              height: Get.height * .14,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  Model = productviewcontroller
                                      .userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.model?[index]
                                      .value;

                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * .03,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Model",
                                                  style: theme
                                                      .textTheme.titleMedium
                                                      ?.copyWith(fontSize: 20)),
                                              // Padding(
                                              //   padding: EdgeInsets.only(bottom: 2.v),
                                              //   child: Text("Size Guide",
                                              //       style: theme.textTheme.titleMedium
                                              //           ?.copyWith(color: Colors.grey, fontSize: 20)),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.v),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 35.v,
                                            child: ListView.separated(
                                              // padding: EdgeInsets.only(left: 20.h),
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder: (
                                                context,
                                                index,
                                              ) {
                                                return SizedBox(
                                                  width: 10.h,
                                                );
                                              },
                                              itemCount: productviewcontroller
                                                      .userlist
                                                      .value
                                                      .productView
                                                      ?.productDetails
                                                      ?.details!
                                                      .model
                                                      ?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                String Aselectedsizename =
                                                    productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.model?[index]
                                                            .value ??
                                                        "";

                                                return SizedBox(
                                                  width: 70.h,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      AselectedModelIndex
                                                          .value = index;
                                                      modelid =
                                                          productviewcontroller
                                                              .userlist
                                                              .value
                                                              .productView
                                                              ?.productDetails
                                                              ?.details
                                                              ?.model?[index]
                                                              .id
                                                              .toString();

                                                      pid =
                                                          productviewcontroller
                                                              .userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      productColor =
                                                          colorId.toString();
                                                      productSize =
                                                          sizeid.toString();
                                                      productQuantity =
                                                          quantityid.toString();
                                                      productweight =
                                                          weightid.toString();
                                                      productCapacity =
                                                          capacityid.toString();
                                                      productItem = productItem
                                                          .toString();
                                                      productModel =
                                                          productModel
                                                              .toString();

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                    },
                                                    child: Obx(
                                                      () => Center(
                                                        child: Container(
                                                          width: 70.h,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          45,
                                                                          158,
                                                                          158,
                                                                          158),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  border: AselectedModelIndex
                                                                              .value ==
                                                                          index
                                                                      ? Border.all(
                                                                          color: Colors
                                                                              .black)
                                                                      : Border
                                                                          .all(
                                                                          color: Color.fromARGB(
                                                                              45,
                                                                              158,
                                                                              158,
                                                                              158),
                                                                        )),
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Center(
                                                            child: Text(
                                                              '$Aselectedsizename',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.item !=
                                null)
                          Container(
                            height: Get.height * .14,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                Item = productviewcontroller
                                    .userlist
                                    .value
                                    .productView
                                    ?.productDetails
                                    ?.details
                                    ?.item?[index]
                                    .value;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .03,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Items",
                                                style: theme
                                                    .textTheme.titleMedium
                                                    ?.copyWith(fontSize: 20)),
                                            // Padding(
                                            //   padding: EdgeInsets.only(bottom: 2.v),
                                            //   child: Text("Size Guide",
                                            //       style: theme.textTheme.titleMedium
                                            //           ?.copyWith(color: Colors.grey, fontSize: 20)),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 35.v,
                                          child: ListView.separated(
                                            // padding: EdgeInsets.only(left: 20.h),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (
                                              context,
                                              index,
                                            ) {
                                              return SizedBox(
                                                width: 10.h,
                                              );
                                            },
                                            itemCount: productviewcontroller
                                                    .userlist
                                                    .value
                                                    .productView
                                                    ?.productDetails
                                                    ?.details!
                                                    .item
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              String Aselectedsizename =
                                                  productviewcontroller
                                                          .userlist
                                                          .value
                                                          .productView
                                                          ?.productDetails
                                                          ?.details
                                                          ?.item?[index]
                                                          .value ??
                                                      "";

                                              return SizedBox(
                                                width: 70.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    AselecteditemIndex.value =
                                                        index;
                                                    itemid =
                                                        productviewcontroller
                                                            .userlist
                                                            .value
                                                            .productView
                                                            ?.productDetails
                                                            ?.details
                                                            ?.item?[index]
                                                            .id
                                                            .toString();

                                                    pid = productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView
                                                        ?.id
                                                        .toString();
                                                    productColor =
                                                        colorId.toString();
                                                    productSize =
                                                        sizeid.toString();
                                                    productQuantity =
                                                        quantityid.toString();
                                                    productweight =
                                                        weightid.toString();
                                                    productCapacity =
                                                        capacityid.toString();
                                                    productItem =
                                                        productItem.toString();
                                                    productModel =
                                                        productModel.toString();

                                                    _productpricechangebyattributecontroller
                                                        .ProductPriceChangeByAttribute(
                                                            context);
                                                  },
                                                  child: Obx(
                                                    () => Center(
                                                      child: Container(
                                                        width: 70.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Color
                                                                        .fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                border: AselecteditemIndex
                                                                            .value ==
                                                                        index
                                                                    ? Border.all(
                                                                        color: Colors
                                                                            .black)
                                                                    : Border
                                                                        .all(
                                                                        color: Color.fromARGB(
                                                                            45,
                                                                            158,
                                                                            158,
                                                                            158),
                                                                      )),
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Center(
                                                          child: Text(
                                                            '$Aselectedsizename',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (productviewcontroller
                                .userlist.value.productView?.productType ==
                            "variable")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (sizeid != null ||
                                                  colorId != null ||
                                                  itemid != null ||
                                                  weightid != null ||
                                                  quantityid != null ||
                                                  capacityid != null ||
                                                  modelid != null ||
                                                  (sizeid != null &&
                                                      colorId != null) ||
                                                  (sizeid != null &&
                                                      itemid != null) ||
                                                  (sizeid != null &&
                                                      weightid != null) ||
                                                  (sizeid != null &&
                                                      quantityid != null) ||
                                                  (sizeid != null &&
                                                      capacityid != null) ||
                                                  (sizeid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      itemid != null) ||
                                                  (colorId != null &&
                                                      weightid != null) ||
                                                  (colorId != null &&
                                                      quantityid != null) ||
                                                  (colorId != null &&
                                                      capacityid != null) ||
                                                  (colorId != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      weightid != null) ||
                                                  (itemid != null &&
                                                      quantityid != null) ||
                                                  (itemid != null &&
                                                      capacityid != null) ||
                                                  (itemid != null &&
                                                      modelid != null) ||
                                                  (weightid != null &&
                                                      quantityid != null) ||
                                                  (weightid != null &&
                                                      capacityid != null) ||
                                                  (weightid != null &&
                                                      modelid != null) ||
                                                  (quantityid != null &&
                                                      capacityid != null) ||
                                                  (quantityid != null &&
                                                      modelid != null) ||
                                                  (capacityid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      itemid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      weightid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      quantityid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      capacityid != null) ||
                                                  (sizeid != null &&
                                                      itemid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      weightid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      itemid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      weightid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      weightid != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (weightid != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (weightid != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (quantityid != null &&
                                                      capacityid != null &&
                                                      modelid != null)) {
                                                // int totalQuantity = int.tryParse(
                                                //         _productpricechangebyattributecontroller
                                                //             .totalQuantity
                                                //             .value) ??
                                                //     0;
                                                if (quantity > 1)
                                                  setState(() {
                                                    quantity--;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please select the desired detail before adding to cart ');
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (sizeid != null ||
                                                  colorId != null ||
                                                  itemid != null ||
                                                  weightid != null ||
                                                  quantityid != null ||
                                                  capacityid != null ||
                                                  modelid != null ||
                                                  (sizeid != null &&
                                                      colorId != null) ||
                                                  (sizeid != null &&
                                                      itemid != null) ||
                                                  (sizeid != null &&
                                                      weightid != null) ||
                                                  (sizeid != null &&
                                                      quantityid != null) ||
                                                  (sizeid != null &&
                                                      capacityid != null) ||
                                                  (sizeid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      itemid != null) ||
                                                  (colorId != null &&
                                                      weightid != null) ||
                                                  (colorId != null &&
                                                      quantityid != null) ||
                                                  (colorId != null &&
                                                      capacityid != null) ||
                                                  (colorId != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      weightid != null) ||
                                                  (itemid != null &&
                                                      quantityid != null) ||
                                                  (itemid != null &&
                                                      capacityid != null) ||
                                                  (itemid != null &&
                                                      modelid != null) ||
                                                  (weightid != null &&
                                                      quantityid != null) ||
                                                  (weightid != null &&
                                                      capacityid != null) ||
                                                  (weightid != null &&
                                                      modelid != null) ||
                                                  (quantityid != null &&
                                                      capacityid != null) ||
                                                  (quantityid != null &&
                                                      modelid != null) ||
                                                  (capacityid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      itemid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      weightid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      quantityid != null) ||
                                                  (sizeid != null &&
                                                      colorId != null &&
                                                      capacityid != null) ||
                                                  (sizeid != null &&
                                                      itemid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      weightid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (sizeid != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      itemid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      weightid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (colorId != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      weightid != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (itemid != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (weightid != null &&
                                                      quantityid != null &&
                                                      modelid != null) ||
                                                  (weightid != null &&
                                                      capacityid != null &&
                                                      modelid != null) ||
                                                  (quantityid != null &&
                                                      capacityid != null &&
                                                      modelid != null)) {
                                                int totalQuantity = int.tryParse(
                                                        _productpricechangebyattributecontroller
                                                            .totalQuantity
                                                            .value) ??
                                                    0;
                                                if (quantity < totalQuantity)
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                print(quantity);
                                              } else {
                                                Utils.snackBar(
                                                    context,
                                                    'Failed',
                                                    'Please select the desired detail before adding to cart ');
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller
                                .userlist.value.productView?.productType ==
                            "simple")
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                                Row(
                                  children: [
                                    Text("Qty",
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(
                                      width: Get.width * .03,
                                    ),
                                    Container(
                                      width: Get.width * .3,
                                      height: Get.height * .05,
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                              color: Colors.white,
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30,
                                              border: Border.all(
                                                  color: Color(0xffff8300))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // int totalQuantity = int.tryParse(
                                              //         _productpricechangebyattributecontroller
                                              //             .totalQuantity
                                              //             .value) ??
                                              //     0;
                                              if (quantity > 1)
                                                setState(() {
                                                  quantity--;
                                                });
                                              print(quantity);
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              quantity.toString(),
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      color: Color(0xffff8300),
                                                      fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              int totalQuantity = int.tryParse(
                                                      productviewcontroller
                                                          .userlist
                                                          .value
                                                          .productView!
                                                          .quantity
                                                          .toString()) ??
                                                  0;
                                              if (quantity < totalQuantity)
                                                setState(() {
                                                  quantity++;
                                                });
                                              print(quantity);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * .02,
                                ),
                              ],
                            ),
                          ),
                        if (productviewcontroller
                                .userlist.value.productView?.productType ==
                            "variable")
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                    .userlist.value.productView!.inCart;
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      if (sizeid != null ||
                                          colorId != null ||
                                          itemid != null ||
                                          weightid != null ||
                                          quantityid != null ||
                                          capacityid != null ||
                                          modelid != null ||
                                          (sizeid != null && colorId != null) ||
                                          (sizeid != null && itemid != null) ||
                                          (sizeid != null &&
                                              weightid != null) ||
                                          (sizeid != null &&
                                              quantityid != null) ||
                                          (sizeid != null &&
                                              capacityid != null) ||
                                          (sizeid != null && modelid != null) ||
                                          (colorId != null && itemid != null) ||
                                          (colorId != null &&
                                              weightid != null) ||
                                          (colorId != null &&
                                              quantityid != null) ||
                                          (colorId != null &&
                                              capacityid != null) ||
                                          (colorId != null &&
                                              modelid != null) ||
                                          (itemid != null &&
                                              weightid != null) ||
                                          (itemid != null &&
                                              quantityid != null) ||
                                          (itemid != null &&
                                              capacityid != null) ||
                                          (itemid != null && modelid != null) ||
                                          (weightid != null &&
                                              quantityid != null) ||
                                          (weightid != null &&
                                              capacityid != null) ||
                                          (weightid != null &&
                                              modelid != null) ||
                                          (quantityid != null &&
                                              capacityid != null) ||
                                          (quantityid != null &&
                                              modelid != null) ||
                                          (capacityid != null &&
                                              modelid != null) ||
                                          (sizeid != null &&
                                              colorId != null &&
                                              modelid != null) ||
                                          (sizeid != null &&
                                              colorId != null &&
                                              itemid != null) ||
                                          (sizeid != null &&
                                              colorId != null &&
                                              weightid != null) ||
                                          (sizeid != null &&
                                              colorId != null &&
                                              quantityid != null) ||
                                          (sizeid != null &&
                                              colorId != null &&
                                              capacityid != null) ||
                                          (sizeid != null &&
                                              itemid != null &&
                                              modelid != null) ||
                                          (sizeid != null &&
                                              weightid != null &&
                                              modelid != null) ||
                                          (sizeid != null &&
                                              quantityid != null &&
                                              modelid != null) ||
                                          (sizeid != null &&
                                              capacityid != null &&
                                              modelid != null) ||
                                          (colorId != null &&
                                              itemid != null &&
                                              modelid != null) ||
                                          (colorId != null &&
                                              weightid != null &&
                                              modelid != null) ||
                                          (colorId != null &&
                                              quantityid != null &&
                                              modelid != null) ||
                                          (colorId != null &&
                                              capacityid != null &&
                                              modelid != null) ||
                                          (itemid != null &&
                                              weightid != null &&
                                              modelid != null) ||
                                          (itemid != null &&
                                              quantityid != null &&
                                              modelid != null) ||
                                          (itemid != null &&
                                              capacityid != null &&
                                              modelid != null) ||
                                          (weightid != null &&
                                              quantityid != null &&
                                              modelid != null) ||
                                          (weightid != null &&
                                              capacityid != null &&
                                              modelid != null) ||
                                          (quantityid != null &&
                                              capacityid != null &&
                                              modelid != null)) {
                                        if (_productpricechangebyattributecontroller
                                                .Productincart.value ==
                                            0) {
                                          Englishcartproductid =
                                              productviewcontroller.userlist
                                                  .value.productView?.id
                                                  .toString();
                                          EnglishAddtocartColor =
                                              colorId?.toString();
                                          EnglishAddtocartprice = pid != ''
                                              ? _productpricechangebyattributecontroller
                                                  .productPrice.value
                                              : productviewcontroller.userlist
                                                  .value.productView?.price
                                                  .toString();
                                          EnglishAddtocartquantity =
                                              quantity.toString();
                                          EnglishAddtocartSize =
                                              sizeid?.toString();
                                          EnglishAddtocartModelId =
                                              modelid?.toString();
                                          EnglishAddtocartItem =
                                              itemid?.toString();
                                          EnglishAddtocartWeight =
                                              weightid?.toString();
                                          EnglishAddtocarQuantityy =
                                              quantityid?.toString();
                                          EnglishAddtocarCapacity =
                                              capacityid?.toString();
                                          AddToCartcontrollerin
                                              .addtocart_Apihit(context);
                                          quantity.value = 1;
                                          AselectedcolorIndex.value = (-1);
                                          AselectedSizeIndex.value = (-1);
                                          AselectedModelIndex.value = (-1);
                                          AselecteditemIndex.value = (-1);
                                          AselectedCapacityIndex.value = (-1);
                                          AselectedquantityIndex.value = (-1);
                                          AselectedweightIndex.value = (-1);
                                          colorId = null;
                                          sizeid = null;
                                          modelid = null;
                                          itemid = null;
                                          weightid = null;
                                          quantityid = null;
                                          capacityid = null;
                                        } else {
                                          Utils.snackBar(context, 'Failed',
                                              'Already in cart');
                                        }
                                      } else {
                                        Utils.snackBar(context, 'Failed',
                                            'Please select the desired detail before adding to cart');
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  _productpricechangebyattributecontroller
                                                              .Productincart
                                                              .value ==
                                                          0
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Container(
                            height: Get.height * .1,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                bool inCart = productviewcontroller
                                        .userlist.value.productView?.inCart ??
                                    false;

                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      if (!inCart) {
                                        // Execute only if inCart is false
                                        Englishcartproductid =
                                            productviewcontroller
                                                .userlist.value.productView?.id
                                                .toString();
                                        // EnglishAddtocartColor = "";
                                        EnglishAddtocartprice =
                                            productviewcontroller.userlist.value
                                                .productView?.price
                                                .toString();
                                        EnglishAddtocartquantity = "1";
                                        // EnglishAddtocartSize = "";
                                        AddToCartcontrollerin.addtocart_Apihit(
                                            context);

                                        quantity.value = 1;
                                      } else {
                                        Utils.snackBar(context, 'Failed',
                                            'Already in Cart');
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 0, 45, 0),
                                      child: Container(
                                        height: Get.height * .06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          border: Border.all(
                                            color: Color(0xffff8300),
                                            width: 2,
                                          ),
                                          color: Color(0xffff8300),
                                        ),
                                        child: AddToCartcontrollerin
                                                    .loading.value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  inCart == false
                                                      ? "Add to Cart"
                                                      : "Already in Cart",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildButtonOneHundredTen(
      BuildContext context, int totalImages, int selectedIndex) {
    return Row(
      children: [
        Padding(
          // padding: const EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(left: Get.width * 0.027),

          child: Container(
            height: 20.v,
            width: 41.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color.fromARGB(127, 0, 0, 0),
            ),
            child: Center(
              child: Text(
                '${selectedIndex + 1}/$totalImages',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
