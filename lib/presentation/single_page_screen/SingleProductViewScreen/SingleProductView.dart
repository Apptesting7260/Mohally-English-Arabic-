import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/presentation/search_screen/widgets/SearchHistoryScreen.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/Cart/EnglishViewCartController.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

RxInt AselectedcolorIndex = (-1).obs;
RxInt AselectedSizeIndex = (-1).obs;
RxInt AselectedModelIndex = (-1).obs;
RxInt AselecteditemIndex = (-1).obs;
RxInt AselectedCapacityIndex = (-1).obs;
RxInt AselectedquantityIndex = (-1).obs;
RxInt AselectedweightIndex = (-1).obs;
String? sizeid;
String? modelid;
String? itemid;
String? weightid;
String? quantityid;
String? capacityid;
String? colorId;
String? color;
String? size1;
String? Model;
String? Item;
String? Quantity;
String? Weight;
String? Capacity;
String? inaCart;

class SingleProductView extends StatefulWidget {
  const SingleProductView({Key? key})
      : super(
          key: key,
        );

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  RxInt quantity = 1.obs;
  bool SeeAllImage = false;
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  EnglishViewCart _viewcartcontroller = EnglishViewCart();
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());
  PageController _pageController = PageController();
  String selectedImageUrl = '';
  int _currentIndex = 0;
  RxString Aselectedcolored = "".obs;
  RxInt AselectedImageIndex = 0.obs;
  RxString AselectedImageUrl = ''.obs;
  int selectedImageIndex = 0;
  bool LikeisActive = false;
  int counter = 1;
  bool PrizeAdjustmentisExpanded = false;
  bool ShoppingSecurityisExpanded = false;
  int selectedIndex = 0;
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  int selectedTabIndex = 0;
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  List<String> recomemded_text = [
    'Recommended',
    'Men\'s clothing',
    'Recommended',
    'Men\'s clothing',
    'Recommended',
  ];
  @override
  void initState() {
    super.initState();
    productviewcontroller.Single_ProductApiHit(context, productId, mainCatId);
    homeView_controller.homeview_apihit();
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
    // homeView_controller.homeview_apihit();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Obx(() {
      if (productviewcontroller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (productviewcontroller.rxRequestStatus.value == Status.ERROR) {
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
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: productviewcontroller.userlist.value.productView == null
                  // productviewcontroller.userlist.value
                  //         .productView?.length ==
                  //     0
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/no_product.png',
                            color: Color(0xffff8300),
                          ),
                          SizedBox(
                            height: Get.height * .03,
                          ),
                          Text(
                            "Page Not Found",
                            style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ],
                      ),
                    ))
                  : ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStackSixtyNine(context),
                        SizedBox(height: 26.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                              "${productviewcontroller.userlist.value.productView?.title.toString()}",
                              // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan')),
                        ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                              "${productviewcontroller.userlist.value.productView?.slug.toString()}",
                              // "NOBERO Men's Cotton Travel Solid Hooded Winter Sports Jacket",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'League Spartan')),
                        ),

                        SizedBox(height: 13.v),
                        Container(
                          height: Get.height * .03,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 15.h),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: Text(
                                        "${productviewcontroller.userlist.value.productReview?.productAverageReview.toString()}",
                                        // "4.8",
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
                                                fontFamily: 'Almarai',
                                                fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomRatingBar(
                                        itemSize: 18,
                                        ignoreGestures: true,
                                        initialRating: productviewcontroller
                                            .userlist
                                            .value
                                            .productReview
                                            ?.productAverageReview
                                            ?.toDouble()),
                                  ],
                                ),
                              );
                            },
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
                                padding: EdgeInsets.only(left: 15.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${productviewcontroller.userlist.value.productView!.price}',
                                                style: CustomTextStyles
                                                    .titleLargePrimary,
                                              ),
                                              TextSpan(
                                                text: " ",
                                              ),
                                              // TextSpan(
                                              //   text:
                                              //       '${productviewcontroller.userlist.value.productView!.productDetails!.details?[index].productPrice}',
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
                                        SizedBox(
                                          width: Get.width * .02,
                                        ),
                                        Container(
                                          width: 63,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Color.fromARGB(
                                                  36, 206, 117, 147)),
                                          child: Center(
                                            child: Text(
                                              "-20% off",
                                              style: TextStyle(
                                                  color: Color(0xffff8300),
                                                  fontSize: 9,
                                                  fontFamily: 'League Spartan'),
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
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.color !=
                                null)
                          _buildColors(context),

                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.size !=
                                null)
                          _buildsize(context),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.capacity !=
                                null)
                          _buildcapacity(context),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.model !=
                                null)
                          _buildmodel(context),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.item !=
                                null)
                          _builditem(context),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.quantityy !=
                                null)
                          _buildquantity(context),
                        if (productviewcontroller
                                    .userlist.value.productView?.productType ==
                                "variable" &&
                            productviewcontroller.userlist.value.productView
                                    ?.productDetails?.details!.weight !=
                                null)
                          _buildweight(context),

                        // _buildListRectangle(context),

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
                                              // if(productviewcontroller.userlist
                                              //     .value.productView?.inCart==true){

                                              //     }
                                              // bool inCart =
                                              //     productviewcontroller.userlist
                                              //         .value.productView?.inCart;
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

                        // Padding(
                        //   padding: EdgeInsets.only(left: 15.h),
                        //   child: Row(
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.only(
                        //           top: 13.v,
                        //           bottom: 9.v,
                        //         ),
                        //         child: Text(
                        //           "Qty",
                        //           style: theme.textTheme.titleMedium,
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(right: 15),
                        //         child: Container(
                        //           width: 100.h,
                        //           height: Get.height * .05,
                        //           margin: EdgeInsets.only(left: 14.h),
                        //           padding: EdgeInsets.symmetric(vertical: 10.v),
                        //           decoration:
                        //               AppDecoration.fillPrimary.copyWith(
                        //             borderRadius:
                        //                 BorderRadiusStyle.circleBorder30,
                        //           ),
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceAround,
                        //             children: [
                        //               CustomImageView(
                        //                 onTap: () {
                        //                   setState(() {
                        //                     // Increment the counter when "+" is pressed
                        //                     counter++;
                        //                   });
                        //                 },
                        //                 imagePath: ImageConstant
                        //                     .imgGroup239412WhiteA70002,
                        //                 height: 13.adaptSize,
                        //                 width: 13.adaptSize,
                        //                 margin: EdgeInsets.only(
                        //                   top: 2.v,
                        //                   bottom: 3.v,
                        //                 ),
                        //               ),
                        //               Text(
                        //                 counter.toString(),
                        //                 style: CustomTextStyles
                        //                     .titleLargeWhiteA7000220,
                        //               ),
                        //               CustomImageView(
                        //                 onTap: () {
                        //                   setState(() {
                        //                     // Decrement the counter when "-" is pressed
                        //                     if (counter > 1) {
                        //                       counter--;
                        //                     }
                        //                   });
                        //                 },
                        //                 imagePath: ImageConstant.imgLine1,
                        //                 height: 13.adaptSize,
                        //                 width: 13.adaptSize,
                        //                 margin:
                        //                     EdgeInsets.symmetric(vertical: 9.v),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: 10.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/img_mask_group_4.png',
                                  width: 16,
                                ),
                                SizedBox(
                                  width: Get.width * .03,
                                ),
                                Text(
                                  'shipping',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'League Spartan',
                                      color: Colors.black),
                                )
                              ],
                            )
                            //     // _buildShoppingSecurity(
                            //     //   context,
                            //     //   image: ImageConstant.imgMaskGroup4,
                            //     //   securityMessage:"Shipping",
                            //     // ),
                            ),
                        SizedBox(height: 12.v),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: _buildRowDescription(context),
                        ),
                        SizedBox(height: 35.v),
                        _buildRowReturnOne(context),
                        SizedBox(height: 29.v),
                        _buildShoppingSecurity(context),

                        if (productviewcontroller.userlist.value.productReview
                                    ?.productReviewDetails !=
                                null ||
                            productviewcontroller.userlist.value.productReview
                                    ?.productReviewDetails !=
                                [] ||
                            productviewcontroller.userlist.value.productReview
                                    ?.productReviewDetails?.length !=
                                0)
                          // _buildReview(context),
                          // // SizedBox(height: 30.v),
                          // // // _buildRowFollow(context),
                          SizedBox(height: 27.v),

                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text("Product Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'League Spartan',
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 14.v),
                        // Obx(() {
                        // var materialTags = productviewcontroller.userList
                        //     .value.productView?.productCatgories?.tags;
                        // var materialsubTags = productviewcontroller.userList
                        //     .value.productView?.productCatgories?.subtags;
                        //   return
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productCatgories
                                  ?.tags
                                  ?.item
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var materialTags = productviewcontroller
                                .userlist
                                .value
                                .productView
                                ?.productCatgories
                                ?.tags
                                ?.item;
                            var tagValue =
                                (materialTags?[index].value as List).join(', ');
                            return Padding(
                              padding: EdgeInsets.only(left: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${materialTags?[index].key}:",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'League Spartan',
                                              color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: " $tagValue",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'League Spartan',
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: Get.height * .02,
                                  )
                                ],
                              ),
                            );
                          },
                        ),

                        if (productviewcontroller
                                .userlist.value.productView?.productType ==
                            "simple")
                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: 30.v),
                                CustomImageView(
                                  imagePath:
                                      "${productviewcontroller.userlist.value.productView?.imageUrl.toString()}",
                                  height: Get.height * .4,
                                  width: 335.h,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 5.v),
                                if (SeeAllImage) _buildGridRectangle(context),
                                SizedBox(height: 18.v),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      SeeAllImage = !SeeAllImage;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "See All",
                                        style: CustomTextStyles
                                            .titleMediumPrimaryMedium,
                                      ),
                                      Icon(
                                        SeeAllImage
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        size: 20,
                                        color: Color(0xffff8300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        SizedBox(height: 17.v),
                        if (productviewcontroller
                                .userlist.value.productView!.productType ==
                            "variable")
                          _buildAddToCartVariable(context)
                        else
                          _buildAddToCartSimple(context),
                        // SizedBox(height: 37.v),
                        // _buildListRecommended(context),
                        SizedBox(height: 15.v),
                        _buildHomePageSection(context),
                        SizedBox(height: 15.v),
                      ],
                    ),
            ),
          ),
        );
      }
    });
  }

  Widget _buildButtonOneHundredTen(
      BuildContext context, int totalImages, int selectedIndex) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
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

  /// Section Widget
  Widget _buildStackSixtyNine(BuildContext context) {
    return Container(
      height: 514.v,
      // height: Get.height * 0.59,
      width: double.maxFinite,
      decoration: AppDecoration.fillGray10003,
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (productviewcontroller.userlist.value.productView!.productType ==
              "variable")
            Aselectedcolored.value.isNotEmpty
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
                    itemBuilder: (BuildContext context, int index) {
                      List<String>? colorGallery = productviewcontroller
                          .userlist
                          .value
                          .productView!
                          .productDetails
                          ?.details
                          ?.color?[AselectedcolorIndex.value]
                          .gallery;
                      String imageUrl = colorGallery?[index] ?? '';
                      return CustomImageView(
                        fit: BoxFit.fill,
                        imagePath:
                            // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
                            "$imageUrl",
                        // "${productviewcontroller.userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
                        height: 514.v,
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
                    itemBuilder: (BuildContext context, int index) {
                      return CustomImageView(
                        fit: BoxFit.fill,
                        imagePath:
                            "${productviewcontroller.userlist.value.productView?.imageUrl}",
                        height: 514.v,
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
                      .userlist.value.productView?.galleryUrl?.length ??
                  0,
              itemBuilder: (BuildContext context, int index) {
                return CustomImageView(
                  fit: BoxFit.fill,
                  imagePath:
                      // selectedImageUrl.isNotEmpty
                      //     ? selectedImageUrl

                      "${productviewcontroller.userlist.value.productView?.galleryUrl?[index] ?? ''}",
                  height: 514.v,
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
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: Get.width * .09,
                            height: Get.height * .05,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                ))),
                        InkWell(
                          onTap: () {
                            Get.to(SearchHistoryScreen());
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                left: 20.h,
                              ),
                              width: Get.width * .09,
                              height: Get.height * .05,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Image.asset(
                                'assets/images/search.png',
                              )),
                        ),
                      ],
                    )),
                SizedBox(height: 371.v),
                if (productviewcontroller
                        .userlist.value.productView!.productType ==
                    "variable")
                  Aselectedcolored.value.isNotEmpty
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
                            .userlist.value.productView?.galleryUrl?.length ??
                        0,
                    _currentIndex, // Pass the current index
                  ),
                SizedBox(height: 17.v),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 10.v,
                    ),
                    decoration: AppDecoration.fillPrimary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgMaskGroup1,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                          margin: EdgeInsets.only(top: 1.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 6.h,
                            top: 3.v,
                          ),
                          child: Text("Free shipping for you",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'League Spartan')),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.v,
                            bottom: 2.v,
                          ),
                          child: Text("Limited time offer",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'League Spartan')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildListRectangle(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60.v,
        child: ListView.separated(
          padding: EdgeInsets.only(
            left: 20.h,
            right: 23.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 8.h,
            );
          },
          itemCount: productviewcontroller
                  .userlist.value.productView?.galleryUrl?.length ??
              0,
          itemBuilder: (context, index) {
            String imageUrl = productviewcontroller
                    .userlist.value.productView?.galleryUrl?[index] ??
                '';
            return GestureDetector(
              onTap: () {
                // Set the selected image URL when an image is clicked
                setState(() {
                  // selectedImageUrl = imageUrl;
                  selectedImageIndex = index;
                });
              },
              child: SizedBox(
                width: 60.h,
                child: Align(
                  alignment: Alignment.center,
                  child: CustomImageView(
                    fit: BoxFit.cover,
                    imagePath: "$imageUrl",
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    radius: BorderRadius.circular(
                      6.h,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Size",
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 20)),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 2.v),
            //   child: Text("Size Guide",
            //       style: theme.textTheme.titleMedium
            //           ?.copyWith(color: Colors.grey, fontSize: 20)),
            // ),
          ],
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildRowDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        width: 300,
        height: 119,
        child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Center(
                  child: IntrinsicWidth(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                    Expanded(
                      child: Container(
                        width: 300,
                        height: 119,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 9.v,
                        ),
                        decoration: AppDecoration.fillGray10003.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5.v),
                            Text(
                              "Standard: Free for all orders",
                              style: TextStyle(
                                color: Color(0xffff8300),
                                fontFamily: 'League Spartan',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  "delivery",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "November 15-23, 73.9% ≥ 8 days",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: Get.height*.01,),

                            Text(
                              "Get £5.00 credit for late delivery",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'League Spartan',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  'Courier company:',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ' Royal Mail, Yodel, etc',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'League Spartan',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .06,
                    )
                  ])));
            }),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowReturnOne(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  PrizeAdjustmentisExpanded = !PrizeAdjustmentisExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgReturn1,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text(
                      "Free Returns",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'League Spartan',
                          color: Colors.black),
                    ),
                  ),
                  // SizedBox(width:Get.width*.02),
                  Container(
                    height: 4.adaptSize,
                    width: 4.adaptSize,
                    margin: EdgeInsets.only(
                        //   left: 8.h,
                        top: 10.v,
                        bottom: 8.h),
                    decoration: BoxDecoration(
                      color: appTheme.gray90001,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                  ),
                  //SizedBox(width:Get.width*.02),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "Price Adjusments",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'League Spartan',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    PrizeAdjustmentisExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: PrizeAdjustmentisExpanded ? 20 : 10,
                  )
                ],
              ),
            )),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Safe Payment Options"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Secure Logistics"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Secure Privacy "),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("Purchase protection "),
      ],
    );
  }

  /// Section Widget
  Widget _buildRowItemsReviewsAnd(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          children: [
            Text("item reviews",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'League Spartan',
                    color: Colors.black)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen());
              },
              child: Text("Show all",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'League Spartan',
                      color: Color(0xffff8300))),
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => ReviewsScreen());
                },
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Color(0xffff8300),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildGridRectangle(BuildContext context) {
    return SizedBox(
      //  height: Get.height * .2,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: productviewcontroller
                .userlist.value.productView?.galleryUrl?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          String imageUrl = productviewcontroller
                  .userlist.value.productView?.galleryUrl?[index] ??
              '';
          return SizedBox(
            height: Get.height * .1,
            //  width: 80.adaptSize,
            child: CustomImageView(
              imagePath: "$imageUrl",
              height: 150.adaptSize,
              width: 150.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
              alignment: Alignment.center,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildListRecommended(BuildContext context) {
    return Container(
      height: Get.height * .05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recomemded_text.length,
        itemBuilder: (context, index) {
          bool isSelected = index ==
              selectedTabIndex; // Assuming you have a variable to track the selected tab index

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recomemded_text[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                      fontFamily: 'League Spartan',
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

  Widget _buildShoppingSecurity(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: InkWell(
              onTap: () {
                setState(() {
                  ShoppingSecurityisExpanded = !ShoppingSecurityisExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMaskGroup16x16,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7.h),
                    child: Text(
                      "Shopping Security",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Almarai',
                          color: Colors.black),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    ShoppingSecurityisExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.arrow_forward_ios,
                    size: ShoppingSecurityisExpanded ? 20 : 10,
                  )
                ],
              ),
            )),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Safe Payment Options"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Secure Logistics"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Secure Privacy "),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("Purchase protection "),
      ],
    );
  }

  Widget _buildAdditionalInformation(String text) {
    return Column(
      children: [
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.only(left: 27.h),
          child: Row(
            children: [
              Container(
                height: Get.height * 0.01,
                width: Get.width * 0.02,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: Get.width * 0.03),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Almarai',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReview(BuildContext context) {
    return Container(
      height: Get.height * .5,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productviewcontroller
                .userlist.value.productReview?.productReviewDetails?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          String imageUrl = productviewcontroller.userlist.value.productReview
                  ?.productReviewDetails?[index].userImage ??
              '';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .04,
              ),
              _buildRowItemsReviewsAnd(context),
              SizedBox(height: 8.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${productviewcontroller.userlist.value.productReview?.productAverageReview?.toString()}",
                      style: CustomTextStyles.titleMediumInter,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 2.v,
                        bottom: 2.v,
                      ),
                      child: CustomRatingBar(
                        initialRating: productviewcontroller
                            .userlist.value.productReview?.productAverageReview
                            ?.toDouble(),
                        itemSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 60.adaptSize,
                      width: 60.adaptSize,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      // AppDecoration.fillBlueGray.copyWith(
                      //   borderRadius: BorderRadiusStyle.circleBorder20,
                      // ),
                      child: CustomImageView(
                        imagePath: "$imageUrl",
                        height: 60.adaptSize,
                        width: 60.adaptSize,
                        radius: BorderRadius.circular(
                          30.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].userName.toString()}",
                            style: TextStyle(
                                fontFamily: 'League Spartan',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        SizedBox(height: 8.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgClock,
                              height: 15.adaptSize,
                              width: 15.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                bottom: 2.v,
                              ),
                              child: Text(
                                  "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].reviewDate.toString()}",
                                  style: TextStyle(
                                      fontFamily: 'League Spartan',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: CustomRatingBar(
                  initialRating: productviewcontroller.userlist.value
                      .productReview?.productReviewDetails?[index].ratting
                      ?.toDouble(),
                  itemSize: 14,
                ),
              ),
              SizedBox(height: 4.v),
              Container(
                width: 322.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                ),
                child: Text(
                    "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].description.toString()}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'League Spartan',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: 13.v),
              //_buildListRectangle1(context),
              Container(
                height: Get.height * .1,
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                  ),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: Get.width * .04,
                    );
                  },
                  itemCount: productviewcontroller.userlist.value.productReview
                          ?.productReviewDetails?.length ??
                      0,
                  itemBuilder: (context, index) {
                    if (productviewcontroller.userlist.value.productReview
                            ?.productReviewDetails?[index].galleryUrl ==
                        null) {
                      return Text("");
                    } else {
                      return SizedBox(
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                        child: CustomImageView(
                          imagePath:
                              "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
                          height: 80.adaptSize,
                          width: 80.adaptSize,
                          radius: BorderRadius.circular(
                            8.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(left: 190.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text('Share',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'League Spartan',
                              color: Colors.black)),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgShare1,
                      height: 16.adaptSize,
                      width: 16.adaptSize,
                    ),
                    SizedBox(
                      width: Get.width * .02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                          "Helpful(${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].helpful.toString()})",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'League Spartan',
                              color: Colors.black)),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          LikeisActive =
                              !LikeisActive; // Toggle isActive state on tap
                        });
                      },
                      child: CustomImageView(
                        imagePath: LikeisActive
                            ? ImageConstant.imgLike1
                            : ImageConstant.imgLike1,
                        color: LikeisActive ? Colors.black : Color(0xffff8300),
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                        margin: EdgeInsets.only(left: 10.h),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup239583,
                      height: 15.v,
                      width: 3.h,
                      margin: EdgeInsets.only(left: 10.h),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 20.v),
              Center(
                child: Divider(
                  color: Color.fromARGB(40, 39, 39, 39),
                  endIndent: 20,
                  indent: 20,
                  thickness: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHomePageSection(BuildContext context) {
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return homeView_controller.userList.value.categoryData == null ||
                homeView_controller.userList.value.categoryData?.length == 0
            ? Center(child: Text('Error: ${homeView_controller.error.value}'))
            : Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: Get.height * .35,
                    crossAxisCount: 2,
                    // mainAxisSpacing: 20.h,
                    // crossAxisSpacing: 35.h,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: homeView_controller
                          .userList.value.recommendedProduct?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: Get.width,
                          // padding: EdgeInsets.only(left: 20),
                          height: 170.adaptSize,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                fit: BoxFit.cover,
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
                                  // _singleproductviewController
                                  //     .Single_ProductApiHit(
                                  //         context, productId, mainCatId);
                                  // Get.to(SingleProductView());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleProductView()),
                                  );
                                },
                                imagePath:
                                    "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                                // ImageConstant.imgRectangle569,
                                height: 160.adaptSize,
                                width: 160.adaptSize,
                                radius: BorderRadius.circular(
                                  10.h,
                                ),
                                alignment: Alignment.center,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.v,
                                  right: 20.h,
                                ),
                                child: CustomIconButton(
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  padding: EdgeInsets.all(5.h),
                                  decoration: IconButtonStyleHelper.fillWhiteA,
                                  alignment: Alignment.topRight,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgSearch,
                                  ),
                                ),
                              ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(71, 228, 193, 204),
                            ),
                            child: Center(
                              child: Text(
                                "10% Off",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xffff8300),
                                  fontWeight: FontWeight.w600,
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
                              maxLines: 2,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${homeView_controller.userList.value.recommendedProduct?[index].averageRating?.toString()}",
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
                                          style: CustomTextStyles
                                              .titleMediumPrimary_2,
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
                                  onTap: () {
                                    mainCatId = homeView_controller
                                        .userList
                                        .value
                                        .recommendedProduct?[index]
                                        .mainCategoryId
                                        .toString();
                                    productId = homeView_controller.userList
                                        .value.recommendedProduct?[index].id
                                        ?.toString();
                                    // _singleproductviewController
                                    //     .Single_ProductApiHit(
                                    //         context, productId, mainCatId);
                                    // Get.to(SingleProductView());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SingleProductView()),
                                    );
                                    // if (mainCatId == "153") {
                                    //   productviewcontroller
                                    //       .Single_ProductApiHit(context);

                                    //   showModalBottomSheet(
                                    //       context: context,
                                    //       isScrollControlled: true,
                                    //       builder: (context) {
                                    //         return _buildAddtocartmensShirt(
                                    //             context, mainCatId, productId);
                                    //       });
                                    // }
                                  },
                                  height: 25.adaptSize,
                                  width: 25.adaptSize,
                                  padding: EdgeInsets.all(6.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgGroup239533,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                    //HomepagesectionItemWidget();
                  },
                ),
              );
      }
    });
  }

  _buildColors(BuildContext context) {
    return Container(
      // height: Get.height * .16,
      height: Get.height * .18,
      child: ListView.builder(
          itemCount: 1,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            color = productviewcontroller.userlist.value.productView
                ?.productDetails?.details?.color![index].value
                .toString();

            return Column(
              children: [
                // SizedBox(height: 11.v),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Colors: ",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: Aselectedcolored.value.isNotEmpty
                                  ? Aselectedcolored.value
                                  : "",
                              style: theme.textTheme.titleMedium?.copyWith(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 158, 158, 158),
                                  fontWeight: FontWeight.normal),
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                          String Aselectedcolorname = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.color?[index]
                                  .value ??
                              "";
                          String imageUrl = productviewcontroller
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
                                    Aselectedcolored.value = Aselectedcolorname;
                                    AselectedcolorIndex.value = index;
                                    selectedImageUrl = imageUrl;
                                    selectedImageIndex = index;
                                    print(
                                        "${Aselectedcolored.value},${AselectedcolorIndex.value}");
                                  });

                                  colorId = productviewcontroller
                                      .userlist
                                      .value
                                      .productView
                                      ?.productDetails
                                      ?.details
                                      ?.color?[index]
                                      .id
                                      .toString();

                                  print("${colorId}=====COLORID");

                                  pid = productviewcontroller
                                      .userlist.value.productView?.id
                                      .toString();
                                  productColor = colorId.toString();
                                  productSize = sizeid.toString();
                                  productQuantity = quantityid.toString();
                                  productweight = weightid.toString();
                                  productCapacity = capacityid.toString();
                                  productItem = itemid.toString();
                                  productModel = modelid.toString();

                                  _productpricechangebyattributecontroller
                                      .ProductPriceChangeByAttribute(context);

                                  updatedprice.value =
                                      _productpricechangebyattributecontroller
                                          .userlist.value.data!.totalQuantity
                                          .toString();

                                  // print(selectedSizeIndex);
                                },
                                child: Obx(
                                  () => Container(
                                      // height: 100,
                                      // width: 70,
                                      height: Get.height * 0.14,
                                      width: Get.width * 0.2,
                                      decoration: BoxDecoration(
                                          border: AselectedcolorIndex.value ==
                                                  index
                                              ? Border.all(
                                                  color: Colors.black, width: 3)
                                              : Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // height: 80,
                                            // width: 70,
                                            height: Get.height * 0.11,
                                            width: Get.width * 0.2,
                                            child: Center(
                                              child: CustomImageView(
                                                fit: BoxFit.cover,
                                                imagePath: "$imageUrl",
                                                height: 80.adaptSize,
                                                width: 70.adaptSize,
                                                radius: BorderRadius.circular(
                                                  6.h,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              '$Aselectedcolorname',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
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
    );
  }

  Widget _buildsize(BuildContext context) {
    return Container(
      height: Get.height * .14,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          size1 = productviewcontroller.userlist.value.productView
              ?.productDetails?.details?.size?[index].value;

          return Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              _buildRowSize(context),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    // height: 35.v,
                    height: 40.v,
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
                        String Aselectedsizename = productviewcontroller
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
                              AselectedSizeIndex.value = index;
                              sizeid = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.size?[index]
                                  .id
                                  .toString();
                              print("${sizeid}=====SizeID");
                              pid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              productColor = colorId.toString();
                              productSize = sizeid.toString();
                              productQuantity = quantityid.toString();
                              productweight = weightid.toString();
                              productCapacity = capacityid.toString();
                              productItem = productItem.toString();
                              productModel = productModel.toString();

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(45, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20),
                                      border: AselectedSizeIndex.value == index
                                          ? Border.all(color: Colors.black)
                                          : Border.all(
                                              color: Color.fromARGB(
                                                  45, 158, 158, 158),
                                            )),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: Colors.black,
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
    );
  }

  Widget _buildcapacity(BuildContext context) {
    return Container(
      height: Get.height * .14,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          Capacity = productviewcontroller.userlist.value.productView
              ?.productDetails?.details?.capacity?[index].value;

          return Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Capacity",
                          style: theme.textTheme.titleMedium
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        String Aselectedsizename = productviewcontroller
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
                              AselectedCapacityIndex.value = index;
                              capacityid = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.capacity?[index]
                                  .id
                                  .toString();

                              pid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              productColor = colorId.toString();
                              productSize = sizeid.toString();
                              productQuantity = quantityid.toString();
                              productweight = weightid.toString();
                              productCapacity = capacityid.toString();
                              productItem = itemid.toString();
                              productModel = modelid.toString();

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(45, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          AselectedCapacityIndex.value == index
                                              ? Border.all(color: Colors.black)
                                              : Border.all(
                                                  color: Color.fromARGB(
                                                      45, 158, 158, 158),
                                                )),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: Colors.black,
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
    );
  }

  Widget _buildmodel(BuildContext context) {
    return Container(
      height: Get.height * .14,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          Model = productviewcontroller.userlist.value.productView
              ?.productDetails?.details?.model?[index].value;

          return Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Model",
                          style: theme.textTheme.titleMedium
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        String Aselectedsizename = productviewcontroller
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
                              AselectedModelIndex.value = index;
                              modelid = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.model?[index]
                                  .id
                                  .toString();
                              pid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              productColor = colorId.toString();
                              productSize = sizeid.toString();
                              productQuantity = quantityid.toString();
                              productweight = weightid.toString();
                              productCapacity = capacityid.toString();
                              productItem = itemid.toString();
                              productModel = modelid.toString();

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(45, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20),
                                      border: AselectedModelIndex.value == index
                                          ? Border.all(color: Colors.black)
                                          : Border.all(
                                              color: Color.fromARGB(
                                                  45, 158, 158, 158),
                                            )),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: Colors.black,
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
    );
  }

  Widget _builditem(BuildContext context) {
    return Container(
      height: Get.height * .14,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          String item = productviewcontroller.userlist.value.productView
              ?.productDetails?.details?.item?[index].value;

          return Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Items",
                          style: theme.textTheme.titleMedium
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        String Aselectedsizename = productviewcontroller
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
                              AselecteditemIndex.value = index;
                              itemid = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.item?[index]
                                  .id
                                  .toString();

                              pid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              productColor = colorId.toString();
                              productSize = sizeid.toString();
                              productQuantity = quantityid.toString();
                              productweight = weightid.toString();
                              productCapacity = capacityid.toString();
                              productItem = itemid.toString();
                              productModel = modelid.toString();

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(45, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20),
                                      border: AselecteditemIndex.value == index
                                          ? Border.all(color: Colors.black)
                                          : Border.all(
                                              color: Color.fromARGB(
                                                  45, 158, 158, 158),
                                            )),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: Colors.black,
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
    );
  }

  Widget _buildweight(BuildContext context) {
    return Container(
      height: Get.height * .14,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          String weight = productviewcontroller.userlist.value.productView
              ?.productDetails?.details?.weight?[index].value;

          return Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Weight",
                          style: theme.textTheme.titleMedium
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        String Aselectedsizename = productviewcontroller
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
                              AselectedweightIndex.value = index;
                              weightid = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.weight?[index]
                                  .id
                                  .toString();

                              pid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              productColor = colorId.toString();
                              productSize = sizeid.toString();
                              productQuantity = quantityid.toString();
                              productweight = weightid.toString();
                              productCapacity = capacityid.toString();
                              productItem = itemid.toString();
                              productModel = modelid.toString();

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(45, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          AselectedweightIndex.value == index
                                              ? Border.all(color: Colors.black)
                                              : Border.all(
                                                  color: Color.fromARGB(
                                                      45, 158, 158, 158),
                                                )),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: Colors.black,
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
    );
  }

  Widget _buildquantity(BuildContext context) {
    return Container(
      height: Get.height * .14,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          Quantity = productviewcontroller.userlist.value.productView
              ?.productDetails?.details?.quantityy?[index].value;

          return Column(
            children: [
              SizedBox(
                height: Get.height * .03,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quantity",
                          style: theme.textTheme.titleMedium
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
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        String Aselectedsizename = productviewcontroller
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
                              AselectedquantityIndex.value = index;
                              quantityid = productviewcontroller
                                  .userlist
                                  .value
                                  .productView
                                  ?.productDetails
                                  ?.details
                                  ?.quantityy?[index]
                                  .id
                                  .toString();

                              // pid = productviewcontroller
                              //     .userlist.value.productView?.id
                              //     .toString();
                              // productColor = colorId.toString();
                              // productSize = sizeid.toString();
                              // productQuantity = quantityid.toString();
                              // productweight = weightid.toString();
                              // productCapacity = capacityid.toString();
                              // productItem = itemid.toString();
                              // productModel = modelid.toString();

                              // _productpricechangebyattributecontroller
                              //     .ProductPriceChangeByAttribute(context);
                            },
                            child: Obx(
                              () => Center(
                                child: Container(
                                  width: 70.h,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(45, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          AselectedquantityIndex.value == index
                                              ? Border.all(color: Colors.black)
                                              : Border.all(
                                                  color: Color.fromARGB(
                                                      45, 158, 158, 158),
                                                )),
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      '$Aselectedsizename',
                                      style: TextStyle(
                                        color: Colors.black,
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
    );
  }

  Widget _buildAddToCartVariable(BuildContext context) {
    return Container(
      height: Get.height * .1,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          bool inCart =
              productviewcontroller.userlist.value.productView!.inCart;
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
                    (sizeid != null && weightid != null) ||
                    (sizeid != null && quantityid != null) ||
                    (sizeid != null && capacityid != null) ||
                    (sizeid != null && modelid != null) ||
                    (colorId != null && itemid != null) ||
                    (colorId != null && weightid != null) ||
                    (colorId != null && quantityid != null) ||
                    (colorId != null && capacityid != null) ||
                    (colorId != null && modelid != null) ||
                    (itemid != null && weightid != null) ||
                    (itemid != null && quantityid != null) ||
                    (itemid != null && capacityid != null) ||
                    (itemid != null && modelid != null) ||
                    (weightid != null && quantityid != null) ||
                    (weightid != null && capacityid != null) ||
                    (weightid != null && modelid != null) ||
                    (quantityid != null && capacityid != null) ||
                    (quantityid != null && modelid != null) ||
                    (capacityid != null && modelid != null) ||
                    (sizeid != null && colorId != null && modelid != null) ||
                    (sizeid != null && colorId != null && itemid != null) ||
                    (sizeid != null && colorId != null && weightid != null) ||
                    (sizeid != null && colorId != null && quantityid != null) ||
                    (sizeid != null && colorId != null && capacityid != null) ||
                    (sizeid != null && itemid != null && modelid != null) ||
                    (sizeid != null && weightid != null && modelid != null) ||
                    (sizeid != null && quantityid != null && modelid != null) ||
                    (sizeid != null && capacityid != null && modelid != null) ||
                    (colorId != null && itemid != null && modelid != null) ||
                    (colorId != null && weightid != null && modelid != null) ||
                    (colorId != null &&
                        quantityid != null &&
                        modelid != null) ||
                    (colorId != null &&
                        capacityid != null &&
                        modelid != null) ||
                    (itemid != null && weightid != null && modelid != null) ||
                    (itemid != null && quantityid != null && modelid != null) ||
                    (itemid != null && capacityid != null && modelid != null) ||
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
                    Englishcartproductid = productviewcontroller
                        .userlist.value.productView?.id
                        .toString();
                    EnglishAddtocartColor = colorId?.toString();
                    EnglishAddtocartprice = pid != ''
                        ? _productpricechangebyattributecontroller
                            .productPrice.value
                        : productviewcontroller
                            .userlist.value.productView?.price
                            .toString();
                    EnglishAddtocartquantity = quantity.toString();
                    EnglishAddtocartSize = sizeid?.toString();
                    EnglishAddtocartModelId = modelid?.toString();
                    EnglishAddtocartItem = itemid?.toString();
                    EnglishAddtocartWeight = weightid?.toString();
                    EnglishAddtocarQuantityy = quantityid?.toString();
                    EnglishAddtocarCapacity = capacityid?.toString();
                    AddToCartcontrollerin.addtocart_Apihit(context);
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
                    Utils.snackBar(context, 'Failed', 'Already in cart');
                  }
                } else {
                  Utils.snackBar(context, 'Failed',
                      'Please select the desired detail before adding to cart');
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Container(
                  height: Get.height * .06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Color(0xffff8300),
                      width: 2,
                    ),
                    color: Color(0xffff8300),
                  ),
                  child: AddToCartcontrollerin.loading.value == false
                      ? Center(
                          child: Text(
                            _productpricechangebyattributecontroller
                                        .Productincart.value ==
                                    0
                                ? "Add to Cart"
                                : "Already in Cart",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddToCartSimple(BuildContext context) {
    return Container(
      height: Get.height * .1,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          bool inCart =
              productviewcontroller.userlist.value.productView!.inCart;
          return Obx(
            () => GestureDetector(
              onTap: () {
                if (!inCart) {
                  // Execute only if inCart is false
                  Englishcartproductid = productviewcontroller
                      .userlist.value.productView?.id
                      .toString();
                  // EnglishAddtocartColor = "";
                  EnglishAddtocartprice = productviewcontroller
                      .userlist.value.productView?.price
                      .toString();
                  EnglishAddtocartquantity = quantity.toString();
                  // EnglishAddtocartSize = "";
                  AddToCartcontrollerin.addtocart_Apihit(context);
                  // Update flag
                } else {
                  Utils.snackBar(context, 'Failed', 'Already in cart');
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Container(
                  height: Get.height * .06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Color(0xffff8300),
                      width: 2,
                    ),
                    color: Color(0xffff8300),
                  ),
                  child: AddToCartcontrollerin.loading.value == false
                      ? Center(
                          child: Text(
                            inCart == false ? "Add to Cart" : "Already in Cart",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoCartProduct(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 400),
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
                      Container(
                        child: Center(
                            child: Image.asset(
                          'assets/images/no_product.png',
                          color: Color(0xffff8300),
                          width: 250,
                          height: 200,
                        )),
                      ),
                      Center(
                        child: Text(
                          "Oops! Product Not Found",
                          style: theme.textTheme.headlineMedium?.copyWith(
                              color: Color.fromARGB(120, 0, 0, 0),
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ))
                ])));
  }
}
