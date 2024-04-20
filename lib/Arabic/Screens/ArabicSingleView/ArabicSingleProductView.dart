import 'package:mohally/Arabic/Arabic_controllers/arabic_ProductPrceChnageByAttribute.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_addtocartController.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/ArabicHomeScreen.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Screens/ReviewScreen/arabic_review.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/ArabicHomeController.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

RxInt arabicquantity = 1.obs;
// RxString updatedprice = ''.obs;

class ArabicMensSingleViewScreen extends StatefulWidget {
  const ArabicMensSingleViewScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ArabicMensSingleViewScreen> createState() =>
      _ArabicMensSingleViewScreenState();
}

class _ArabicMensSingleViewScreenState
    extends State<ArabicMensSingleViewScreen> {
  arabic_addtocart_controller AddToCartcontrollerin =
      arabic_addtocart_controller();
  ArabicProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ArabicProductPriceChngeByAttribute();
  bool SeeAllImage = false;
  // int _currentIndex = 0;
  // PageController _pageController = PageController();
  RxInt Productincart = 0.obs;

  RxString selectedcolored = "".obs;
  RxInt AselectedImageIndex = 0.obs;
  RxString AselectedImageUrl = ''.obs;
  RxString Aselectedcolored = "".obs;

  int selectedImageIndex = 0;
  String selectedImageUrl = '';
  List<bool> tappedList = List.generate(200, (index) => false);

  List<bool> isButtonTappedList = List.generate(100, (index) => false);
  int _currentIndex = 0;
  PageController _pageController = PageController();

  bool LikeisActive = false;
  int counter = 1;
  bool PrizeAdjustmentisExpanded = false;
  bool ShoppingSecurityisExpanded = false;
  int selectedIndex = 0;
  ArabicSingleProductViewController productviewcontroller =
      ArabicSingleProductViewController();
  int selectedTabIndex = 0;
  ArabicHomeView_controller homeView_controller = ArabicHomeView_controller();
  List<String> recomemded_text = [
    'مُستَحسَن',
    'ملابس رجالية',
    'الصحة و الجمال',
    'الصحة و الجمال',
    "الصحة و الجمال"
  ];
  void initState() {
    super.initState();
    productviewcontroller.Single_ProductApiHit(
        arabicMainCatId, arabicProductId);
    homeView_controller.homeview_apihit();
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
          // backgroundColor: Colors.white,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error2.png',
              ),
              Text(
                "عفوا! تواجه خوادمنا مشكلة في الاتصال.\nيرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0),
                    fontSize: 12,
                    fontFamily: 'Almarai'),
              ),
            ],
          )),
        );
      } else {
        return SafeArea(
          child: Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: productviewcontroller.userlist.value.productView == null
                  // productviewcontroller.Bottom_userlist.value
                  //         .productView?.length ==
                  //     0
                  ? Center(
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
                          "الصفحة غير موجودة",
                          style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              fontFamily: 'Almarai'),
                        ),
                      ],
                    ))
                  : SizedBox(
                      width: double.maxFinite,
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStackSixtyNine(context),
                          SizedBox(height: 26.v),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                                "${productviewcontroller.userlist.value.productView?.title.toString()}",
                                // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Almarai')),
                          ),
                          SizedBox(height: 12.v),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 10),
                            child: Text(
                                "${productviewcontroller.userlist.value.productView?.description.toString()}",
                                // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Almarai')),
                          ),
                          // Text(
                          //                       "${productviewcontroller.userlist.value.productView?.productDetails.toString()}",
                          //                     // "سترة NOBERO للرجال من القطن للسفر بتصميم سادة وغطاء للرأس رياضي شتوي",
                          //                     maxLines: 2,
                          //                     overflow: TextOverflow.ellipsis,
                          //                     style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Almarai')
                          //                   ),
                          SizedBox(height: 13.v),
                          Container(
                            height: Get.height * .03,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: Row(
                                    children: [
                                      CustomRatingBar(
                                        itemSize: 18,
                                        ignoreGestures: true,
                                        initialRating: homeView_controller
                                            .userList
                                            .value
                                            .recommendedProduct?[index]
                                            .averageRating
                                            ?.toDouble(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.h),
                                        child: Text(
                                          "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
                                          // "4.8",
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
                                                  fontFamily: 'Almarai',
                                                  fontSize: 16),
                                        ),
                                      ),
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
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${productviewcontroller.userlist.value.productView!.price.toString()}',
                                                  style: CustomTextStyles
                                                      .titleLargePrimary,
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                // TextSpan(
                                                //   text:
                                                //       "${productviewcontroller.userlist.value.productView!.productDetails!.details?[index].productPrice.toString()}",
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
                                                    54, 206, 117, 147)),
                                            child: Center(
                                              child: Text(
                                                "-20% خصم",
                                                style: TextStyle(
                                                    color: Color(0xffff8300),
                                                    fontSize: 9,
                                                    fontFamily: 'Almarai'),
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

                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.color !=
                                  null)
                            _buildColors(context),

                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.size !=
                                  null)
                            _buildsize(context),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.capacity !=
                                  null)
                            _buildcapacity(context),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.model !=
                                  null)
                            _buildmodel(context),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.item !=
                                  null)
                            _builditem(context),

                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.quantityy !=
                                  null)
                            _buildquantity(context),

                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.weight !=
                                  null)
                            _buildweight(context),

                          if (productviewcontroller
                                  .userlist.value.productView?.productType ==
                              "variable")
                            Padding(
                              padding: EdgeInsets.only(right: 20),
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
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xffff8300),
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
                              padding: EdgeInsets.only(right: 20),
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
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xffff8300),
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

                          // _buildListRectangle(context),

                          // if (productviewcontroller
                          //         .userlist.value.productView?.productType ==
                          //     "variable")
                          //   Padding(
                          //     padding: EdgeInsets.only(right: 20),
                          //     child: Column(
                          //       children: [
                          //         SizedBox(
                          //           height: Get.height * .02,
                          //         ),
                          //         Row(
                          //           children: [
                          //             Text("Qty",
                          //                 style: theme.textTheme.titleMedium),
                          //             SizedBox(
                          //               width: Get.width * .03,
                          //             ),
                          //             Container(
                          //               width: Get.width * .3,
                          //               height: Get.height * .05,
                          //               decoration: AppDecoration.fillPrimary
                          //                   .copyWith(
                          //                       color: Color(0xffff8300),
                          //                       borderRadius: BorderRadiusStyle
                          //                           .circleBorder30,
                          //                       border: Border.all(
                          //                           color: Color(0xffff8300))),
                          //               child: Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceAround,
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.center,
                          //                 children: [
                          //                   GestureDetector(
                          //                     onTap: () {
                          //                       if (colorId != null &&
                          //                           sizeid != null) {
                          //                         int totalQuantity = int.tryParse(
                          //                                 _productpricechangebyattributecontroller
                          //                                     .totalQuantity
                          //                                     .value) ??
                          //                             0;
                          //                         if (arabicquantity <
                          //                             totalQuantity)
                          //                           setState(() {
                          //                             arabicquantity++;
                          //                           });
                          //                         print(arabicquantity);
                          //                       } else {
                          //                         Utils.snackBar(
                          //                             context,
                          //                             'Failed',
                          //                             'Please Select Color ');
                          //                       }
                          //                     },
                          //                     child: Icon(
                          //                       Icons.add,
                          //                       color: Colors.white,
                          //                       size: 15,
                          //                     ),
                          //                   ),
                          //                   Center(
                          //                     child: Text(
                          //                       arabicquantity.toString(),
                          //                       style: theme
                          //                           .textTheme.bodyMedium
                          //                           ?.copyWith(
                          //                               color: Colors.white,
                          //                               fontSize: 20),
                          //                     ),
                          //                   ),
                          //                   GestureDetector(
                          //                     onTap: () {
                          //                       if (colorId != null &&
                          //                           sizeid != null) {
                          //                         // int totalQuantity = int.tryParse(
                          //                         //         _productpricechangebyattributecontroller
                          //                         //             .totalQuantity
                          //                         //             .value) ??
                          //                         //     0;
                          //                         if (arabicquantity > 1)
                          //                           setState(() {
                          //                             arabicquantity--;
                          //                           });
                          //                         print(arabicquantity);
                          //                       } else {
                          //                         Utils.snackBar(
                          //                             context,
                          //                             'Failed',
                          //                             'Please Select Color ');
                          //                       }
                          //                     },
                          //                     child: Icon(
                          //                       Icons.remove,
                          //                       color: Colors.white,
                          //                       size: 15,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: Get.height * .02,
                          //         ),
                          //       ],
                          //     ),
                          //   ),

                          SizedBox(height: 30.v),
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
                                    'شحن',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Almarai',
                                        color: Colors.black),
                                  )
                                ],
                              )),
                          SizedBox(height: 12.v),
                          _buildRowDescription(context),
                          SizedBox(height: 35.v),
                          _buildRowReturnOne(context),
                          SizedBox(height: 29.v),
                          _buildShoppingSecurity(context),
                          // if (productviewcontroller.userlist.value
                          //         .productReview!.productReviewDetails !=
                          //     [])
                          //   _buildReview(context),
                          SizedBox(height: 29.v),
                          Padding(
                            padding: EdgeInsets.only(right: 20.h),
                            child: Text("تفاصيل المنتجات",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Almarai',
                                    color: Colors.black)),
                          ),
                          SizedBox(height: 14.v),
                          // Obx(() {
                          // var materialTags = productviewcontroller.userlist
                          //     .value.productView?.productCatgories?.tags;
                          // var materialsubTags = productviewcontroller.userlist
                          //     .value.productView?.productCatgories?.subtags;
                          //   return
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
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
                                    (materialTags?[index].value as List)
                                        .join(', ');
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "${materialTags?[index].key}:  ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Almarai',
                                                color: Colors.grey),
                                          ),
                                          TextSpan(
                                            text: "$tagValue",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Almarai',
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
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 30.v),

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
          ),
        );
      }
    });
  }

  Widget _buildAdditionalInformation(String text) {
    return Column(
      children: [
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.only(right: 27.h),
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

  /// Section Widget
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

  // /// Section Widget
  Widget _buildStackSixtyNine(BuildContext context) {
    return Container(
      height: 505.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      //AppDecoration.fillGray10003,
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
                        height: 502.v,
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
                        height: 505.v,
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
                  height: 505.v,
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
                        GestureDetector(
                          onTap: () {
                            // Get.to(SearchHistoryArabic());
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
                SizedBox(height: 10.v),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                          child: Text("شحن مجاني لك",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Almarai')),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.v,
                            bottom: 2.v,
                          ),
                          child: Text("عرض لفترة محدودة",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: 'Almarai')),
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

  // /// Section Widget
  // Widget _buildStackSixtyNine(BuildContext context) {
  //   return Container(
  //     height: 514.v,
  //     // height: Get.height * 0.59,
  //     width: double.maxFinite,
  //     decoration: AppDecoration.fillGray10003,
  //     // color: Colors.red,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         if (productviewcontroller.userlist.value.productView!.productType ==
  //             "variable")
  //           Aselectedcolored.value.isNotEmpty
  //               ? PageView.builder(
  //                   controller: _pageController,
  //                   scrollDirection: Axis.horizontal,
  //                   itemCount: productviewcontroller
  //                           .userlist
  //                           .value
  //                           .productView!
  //                           .productDetails
  //                           ?.details
  //                           ?.color?[0]
  //                           .gallery
  //                           ?.length ??
  //                       0,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     List<String>? colorGallery = productviewcontroller
  //                         .userlist
  //                         .value
  //                         .productView!
  //                         .productDetails
  //                         ?.details
  //                         ?.color?[AselectedcolorIndex.value]
  //                         .gallery;
  //                     String imageUrl = colorGallery?[index] ?? '';
  //                     return CustomImageView(
  //                       fit: BoxFit.fill,
  //                       imagePath:
  //                           // "https://urlsdemo.net/mohally/admin-assets/product-image/171215021071440.webp",
  //                           "$imageUrl",
  //                       // "${productviewcontroller.userlist.value.productView!.productDetails?.details?.color?[index].gallery ?? ''}",
  //                       height: 500.v,
  //                       width: Get.width,
  //                       alignment: Alignment.center,
  //                     );
  //                   },
  //                   onPageChanged: (index) {
  //                     setState(() {
  //                       _currentIndex = index;
  //                     });
  //                   },
  //                 )
  //               :
  // PageView.builder(
  //                   controller: _pageController,
  //                   scrollDirection: Axis.horizontal,
  //                   itemCount: 1,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return CustomImageView(
  //                       fit: BoxFit.fill,
  //                       imagePath:
  //                           "${productviewcontroller.userlist.value.productView?.imageUrl}",
  //                       height: 500.v,
  //                       width: Get.width,
  //                       alignment: Alignment.center,
  //                     );
  //                   },
  //                   onPageChanged: (index) {
  //                     setState(() {
  //                       _currentIndex = index;
  //                     });
  //                   },
  //                 )
  //         else
  //           PageView.builder(
  //             controller: _pageController,
  //             scrollDirection: Axis.horizontal,
  //             itemCount: productviewcontroller
  //                     .userlist.value.productView?.galleryUrl?.length ??
  //                 0,
  //             itemBuilder: (BuildContext context, int index) {
  //               return CustomImageView(
  //                 fit: BoxFit.fill,
  //                 imagePath:
  //                     // selectedImageUrl.isNotEmpty
  //                     //     ? selectedImageUrl

  //                     "${productviewcontroller.userlist.value.productView?.galleryUrl?[index] ?? ''}",
  //                 height: 500.v,
  //                 width: Get.width,
  //                 alignment: Alignment.center,
  //               );
  //             },
  //             onPageChanged: (index) {
  //               setState(() {
  //                 _currentIndex = index;
  //               });
  //             },
  //           ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Padding(
  //                   padding:
  //                       const EdgeInsets.only(top: 10, right: 10, left: 10),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Container(
  //                           width: Get.width * .09,
  //                           height: Get.height * .05,
  //                           decoration: BoxDecoration(
  //                               shape: BoxShape.circle, color: Colors.white),
  //                           child: GestureDetector(
  //                               onTap: () {
  //                                 Get.back();
  //                               },
  //                               child: Icon(
  //                                 Icons.arrow_back,
  //                               ))),
  //                       InkWell(
  //                         onTap: () {
  //                           // Get.to(SearchScreen());
  //                         },
  //                         child: Container(
  //                             margin: EdgeInsets.only(
  //                               left: 20.h,
  //                             ),
  //                             width: Get.width * .09,
  //                             height: Get.height * .05,
  //                             decoration: BoxDecoration(
  //                                 shape: BoxShape.circle, color: Colors.white),
  //                             child: Image.asset(
  //                               'assets/images/search.png',
  //                             )),
  //                       ),
  //                     ],
  //                   )),
  //               SizedBox(height: 371.v),
  // if (productviewcontroller
  //         .userlist.value.productView!.productType ==
  //     "variable")
  //   Aselectedcolored.value.isNotEmpty
  //       ? _buildButtonOneHundredTen(
  //           context,
  //           productviewcontroller
  //                   .userlist
  //                   .value
  //                   .productView!
  //                   .productDetails
  //                   ?.details
  //                   ?.color?[0]
  //                   .gallery
  //                   ?.length ??
  //               0,
  //           _currentIndex, // Pass the current index
  //         )
  //       : _buildButtonOneHundredTen(
  //           context,
  //           1,
  //           _currentIndex, // Pass the current index
  //         )
  // else
  //   _buildButtonOneHundredTen(
  //     context,

  //     productviewcontroller
  //             .userlist.value.productView?.galleryUrl?.length ??
  //         0,
  //     _currentIndex, // Pass the current index
  //   ),
  //               SizedBox(height: 10.v),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 7),
  //                 child: Container(
  //                   width: double.maxFinite,
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 20.h,
  //                     vertical: 10.v,
  //                   ),
  //                   decoration: AppDecoration.fillPrimary,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       CustomImageView(
  //                         imagePath: ImageConstant.imgMaskGroup1,
  //                         height: 16.adaptSize,
  //                         width: 16.adaptSize,
  //                         margin: EdgeInsets.only(top: 1.v),
  //                       ),
  //                       Padding(
  //                         padding: EdgeInsets.only(
  //                           left: 6.h,
  //                           top: 3.v,
  //                         ),
  //                         child: Text("شحن مجاني لك",
  //                             style: TextStyle(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.w600,
  //                                 color: Colors.white,
  //                                 fontFamily: 'Almarai')),
  //                       ),
  //                       Spacer(),
  //                       Padding(
  //                         padding: EdgeInsets.only(
  //                           top: 1.v,
  //                           bottom: 2.v,
  //                         ),
  //                         child: Text("عرض لفترة محدودة",
  //                             style: TextStyle(
  //                                 fontSize: 12,
  //                                 fontWeight: FontWeight.w600,
  //                                 color: Colors.white,
  //                                 fontFamily: 'Almarai')),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildListRectangle(BuildContext context) {
    //
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60.v,
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            left: 20.h,
            right: 15.h,
          ),
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
                  selectedImageUrl = imageUrl;
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

  //   );
  // }

  /// Section Widget
  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "مقاس",
              style:
                  theme.textTheme.titleMedium?.copyWith(fontFamily: 'Almarai'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(
                "دليل المقاسات",
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontFamily: 'Almarai', color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
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

                              arabicpid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              arabicproductColor = colorId.toString();
                              arabicproductSize = sizeid.toString();
                              arabicproductCapacity = capacityid.toString();
                              arabicproductItem = itemid.toString();
                              arabicproductModel = modelid.toString();
                              arabicproductQuantity = quantityid.toString();
                              arabicproductweight = weightid.toString();
                              print(arabicpid);
                              print(arabicproductColor);
                              print(arabicproductSize);

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                              updatedprice.value =
                                  _productpricechangebyattributecontroller
                                      .userlist.value.data!.price
                                      .toString();
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
          size1 = productviewcontroller.userlist.value.productView
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

                              arabicpid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              arabicproductColor = colorId.toString();
                              arabicproductSize = sizeid.toString();
                              arabicproductCapacity = capacityid.toString();
                              arabicproductItem = itemid.toString();
                              arabicproductModel = modelid.toString();
                              arabicproductQuantity = quantityid.toString();
                              arabicproductweight = weightid.toString();
                              print(arabicpid);
                              print(arabicproductColor);
                              print(arabicproductSize);

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                              updatedprice.value =
                                  _productpricechangebyattributecontroller
                                      .userlist.value.data!.price
                                      .toString();
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
          size1 = productviewcontroller.userlist.value.productView
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

                              arabicpid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              arabicproductColor = colorId.toString();
                              arabicproductSize = sizeid.toString();
                              arabicproductCapacity = capacityid.toString();
                              arabicproductItem = itemid.toString();
                              arabicproductModel = modelid.toString();
                              arabicproductQuantity = quantityid.toString();
                              arabicproductweight = weightid.toString();
                              print(arabicpid);
                              print(arabicproductColor);
                              print(arabicproductSize);

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                              updatedprice.value =
                                  _productpricechangebyattributecontroller
                                      .userlist.value.data!.price
                                      .toString();
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
          size1 = productviewcontroller.userlist.value.productView
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

                              arabicpid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              arabicproductColor = colorId.toString();
                              arabicproductSize = sizeid.toString();
                              arabicproductCapacity = capacityid.toString();
                              arabicproductItem = itemid.toString();
                              arabicproductModel = modelid.toString();
                              arabicproductQuantity = quantityid.toString();
                              arabicproductweight = weightid.toString();
                              print(arabicpid);
                              print(arabicproductColor);
                              print(arabicproductSize);

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                              updatedprice.value =
                                  _productpricechangebyattributecontroller
                                      .userlist.value.data!.price
                                      .toString();
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
          size1 = productviewcontroller.userlist.value.productView
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

                              arabicpid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              arabicproductColor = colorId.toString();
                              arabicproductSize = sizeid.toString();
                              arabicproductCapacity = capacityid.toString();
                              arabicproductItem = itemid.toString();
                              arabicproductModel = modelid.toString();
                              arabicproductQuantity = quantityid.toString();
                              arabicproductweight = weightid.toString();
                              print(arabicpid);
                              print(arabicproductColor);
                              print(arabicproductSize);

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                              updatedprice.value =
                                  _productpricechangebyattributecontroller
                                      .userlist.value.data!.price
                                      .toString();
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
          size1 = productviewcontroller.userlist.value.productView
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

                              arabicpid = productviewcontroller
                                  .userlist.value.productView?.id
                                  .toString();
                              arabicproductColor = colorId.toString();
                              arabicproductSize = sizeid.toString();
                              arabicproductCapacity = capacityid.toString();
                              arabicproductItem = itemid.toString();
                              arabicproductModel = modelid.toString();
                              arabicproductQuantity = quantityid.toString();
                              arabicproductweight = weightid.toString();
                              print(arabicpid);
                              print(arabicproductColor);
                              print(arabicproductSize);

                              _productpricechangebyattributecontroller
                                  .ProductPriceChangeByAttribute(context);
                              updatedprice.value =
                                  _productpricechangebyattributecontroller
                                      .userlist.value.data!.price
                                      .toString();
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
                    Arabiccartproductid = productviewcontroller
                        .userlist.value.productView?.id
                        .toString();
                    ArabicAddtocartColor = colorId?.toString();
                    ArabicAddtocartprice = pid != ''
                        ? _productpricechangebyattributecontroller
                            .productPrice.value
                        : productviewcontroller
                            .userlist.value.productView?.price
                            .toString();
                    ArabicAddtocartquantity = quantity.toString();
                    ArabicAddtocartSize = sizeid?.toString();
                    ArabicAddtocartModelId = modelid?.toString();
                    ArabicAddtocartItemlId = itemid?.toString();
                    ArabicAddtocartWeightlId = weightid?.toString();
                    ArabicAddtocartQuantitylId = quantityid?.toString();
                    ArabicAddtocartCapacitylId = capacityid?.toString();
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
                                ? "أضف إلى السلة"
                                : "بالفعل في سلة التسوق",
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
                print("ontappppppppp");
                if (!inCart) {
                  // Execute only if inCart is false
                  Arabiccartproductid = productviewcontroller
                      .userlist.value.productView?.id
                      .toString();
                  // ArabicAddtocartColor = "";
                  ArabicAddtocartprice = productviewcontroller
                      .userlist.value.productView?.price
                      .toString();
                  ArabicAddtocartquantity = "1";
                  // ArabicAddtocartSize = "";
                  AddToCartcontrollerin.addtocart_Apihit(context);
                  // Update flag
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
                            inCart == false
                                ? "أضف إلى السلة"
                                : "بالفعل في سلة التسوق",
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

  // Widget _buildListWidget(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //     child: Align(
  //       alignment: Alignment.centerRight,
  //       child: SizedBox(
  //         height: 35.v,
  //         child: ListView.separated(
  //           physics: NeverScrollableScrollPhysics(),
  //           padding: EdgeInsets.only(left: 20.h),
  //           scrollDirection: Axis.horizontal,
  //           separatorBuilder: (
  //             context,
  //             index,
  //           ) {
  //             return SizedBox(
  //               width: 10.h,
  //             );
  //           },
  //           itemCount: productviewcontroller.userlist.value.productView
  //                   ?.productDetails?.details!.length ??
  //               0,
  //           itemBuilder: (context, index) {
  //             if (index < 0 ||
  //                 index >=
  //                     (productviewcontroller.userlist.value.productView!
  //                             .productDetails?.details!.length ??
  //                         0)) {
  //               // Check if index is out of bounds
  //               return Container(); // Return an empty container or any other widget as needed
  //             }

  //             bool isSelected = index == selectedIndex;
  //             return SizedBox(
  //               width: 70.h,
  //               child: GestureDetector(
  //                 onTap: () {
  //                   setState(() {
  //                     selectedIndex = index;
  //                   });
  //                 },
  //                 child: Align(
  //                   alignment: Alignment.centerRight,
  //                   child: Container(
  //                     width: 70.0, // Adjust this width as needed
  //                     padding: EdgeInsets.symmetric(
  //                       horizontal: 17.0, // Adjust this padding as needed
  //                       vertical: 8.0, // Adjust this padding as needed
  //                     ),
  //                     decoration: BoxDecoration(
  //                       color:
  //                           isSelected ? Color(0xffff8300) : Colors.grey[10003],
  //                       border: Border.all(
  //                           color:
  //                               isSelected ? Color(0xffff8300) : Colors.black),
  //                       borderRadius: BorderRadius.circular(20.0),
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         '${productviewcontroller.userlist.value.productView?.productDetails?.details?[index].Size.toString()}',
  //                         style: TextStyle(
  //                           color: isSelected ? Colors.white : Colors.black,
  //                           fontSize: 10.0,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget
//   Widget _buildListWidget(BuildContext context) {
// //List<ProductDetails>? productDetails = productviewcontroller.userlist.value.productView?.productDetails;

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: SizedBox(
//           height: 40.v,
//           child: ListView.separated(
  //  physics: ScrollPhysics(),
//             padding: EdgeInsets.only(left: 20.h),
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (
//               context,
//               index,
//             ) {
//               return SizedBox(
//                 width: 10.h,
//               );
//             },
//             itemCount: productviewcontroller
//                     .userlist.value.productView?.productDetails?.length ??
//                 0,
//             itemBuilder: (context, index) {
//               if (index < 0 ||
//                   index >=
//                       (productviewcontroller.userlist.value.productView
//                               ?.productDetails?.length ??
//                           0)) {
//                 // Check if index is out of bounds
//                 return Container(); // Return an empty container or any other widget as needed
//               }

//               bool isSelected = index == selectedIndex;

//               // Access the sizeCapacity from your data model
//               String sizeCapacity = productviewcontroller.userlist.value
//                   .productView?.productDetails![index].sizecapicity;

//               return SizedBox(
//                 width: 70.h,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedIndex = index;
//                     });
//                   },
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Container(
//                       width: 70.0, // Adjust this width as needed
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 17.0, // Adjust this padding as needed
//                         vertical: 8.0, // Adjust this padding as needed
//                       ),
//                       decoration: BoxDecoration(
//                         color:
//                             isSelected ? Color(0xffff8300) : Colors.grey[10003],
//                         border: Border.all(
//                             color:
//                                 isSelected ? Color(0xffff8300) : Colors.black),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: Text(
//                           sizeCapacity,
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

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
                              "قياسي: مجاني لجميع الطلبات",
                              style: TextStyle(
                                color: Color(0xffff8300),
                                fontFamily: 'Almarai',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  "توصيل",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Almarai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "15-23 نوفمبر, 73.9% ≥ 8 أيام",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Almarai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: Get.height*.01,),

                            Text(
                              "احصل على رصيد بقيمة 5.00 جنيه إسترليني للتسليم المتأخر",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Almarai',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // SizedBox(height: Get.height*.01,),
                            Row(
                              children: [
                                Text(
                                  'شركة البريد السريع: ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Almarai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  ' Royal Mail, Yodel, etc',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Almarai',
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
        InkWell(
          onTap: () {
            setState(() {
              PrizeAdjustmentisExpanded = !PrizeAdjustmentisExpanded;
            });
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                    padding: EdgeInsets.only(right: 7.h),
                    child: Text(
                      "عودة مجانية",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Almarai',
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: Get.width * .02),
                  Container(
                    height: 4.adaptSize,
                    width: 4.adaptSize,
                    margin: EdgeInsets.only(left: 8.h, top: 10.v, bottom: 8.h),
                    decoration: BoxDecoration(
                      color: appTheme.gray90001,
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "تعديل السعر",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Almarai',
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
              )),
        ),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("خيارات الدفع الآمنة"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("الخدمات اللوجستية الآمنة"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("تأمين الخصوصية"),
        if (PrizeAdjustmentisExpanded)
          _buildAdditionalInformation("حماية المشتريات"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("مراجعات العناصر",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Almarai',
                    color: Colors.black)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() => ReviewsScreen_arabic());
              },
              child: Text("اظهار الكل",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Almarai',
                      color: Color(0xffff8300))),
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => ReviewsScreen_arabic());
                },
                child: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Color(0xffff8300),
                ))
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListRectangle1(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
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
        itemCount: productviewcontroller
                .userlist.value.productView?.galleryUrl?.length ??
            0,
        itemBuilder: (context, index) {
          String imageUrl = productviewcontroller
                  .userlist.value.productView?.galleryUrl?[index] ??
              '';
          return SizedBox(
            height: 80.adaptSize,
            width: 80.adaptSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: "$imageUrl",
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  radius: BorderRadius.circular(
                    8.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          );
          //Listrectangle1ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFollow(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 36.v,
        text: "Follow ",
        margin: EdgeInsets.only(right: 5.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildShopAllItems(BuildContext context) {
    return Expanded(
      child: CustomOutlinedButton(
        height: 36.v,
        text: "Shop all items",
        margin: EdgeInsets.only(left: 5.h),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        buttonTextStyle: CustomTextStyles.titleSmallPrimary,
      ),
    );
  }

  /// Section Widget
  Widget _buildRowFollow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray10003,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse88944x44,
            height: 44.adaptSize,
            width: 44.adaptSize,
            radius: BorderRadius.circular(
              22.h,
            ),
            margin: EdgeInsets.only(bottom: 52.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 2.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ZLNZ ",
                    style: CustomTextStyles.titleMediumMedium16,
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(right: 23.h),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "1.2K+ ",
                                style: CustomTextStyles.titleMediumMedium,
                              ),
                              TextSpan(
                                text: "Followers ",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "100K+ ",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                                TextSpan(
                                  text: "Sold",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "144 ",
                                  style: CustomTextStyles.titleMediumMedium,
                                ),
                                TextSpan(
                                  text: "Items",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFollow(context),
                      _buildShopAllItems(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
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

      // ListView.separated(
      //  physics: ScrollPhysics(),
      //   padding: EdgeInsets.only(
      //     left: 20.h,
      //     right: 20.h,
      //   ),
      //   scrollDirection: Axis.vertical,
      //   separatorBuilder: (
      //     context,
      //     index,
      //   ) {
      //     return SizedBox(
      //       width: Get.width * .04,
      //     );
      //   },
      //   itemCount: productviewcontroller
      //           .userlist.value.productView?.galleryUrl?.length ??
      //       0,
      //   itemBuilder: (context, index) {
      //     return SizedBox(
      //       height: 80.adaptSize,
      //       width: 80.adaptSize,
      //       child: CustomImageView(
      //         imagePath:
      //             "${productviewcontroller.userlist.value.productView?.imageUrl.toString()}",
      //         height: 80.adaptSize,
      //         width: 80.adaptSize,
      //         radius: BorderRadius.circular(
      //           8.h,
      //         ),
      //         alignment: Alignment.center,
      //       ),
      //     );

      //     // Listrectangle1ItemWidget();
      //   },
      // ),
    );
  }

  /// Section Widget

  Widget _buildListRecommended(BuildContext context) {
    return Container(
      height: Get.height * .05,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
                      fontFamily: 'Almarai',
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
  // Widget _buildGridTenOff(BuildContext context) {
  //   return Expanded(
  //     child: Align(
  //       alignment: Alignment.center,
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 20.h),
  //         child: GridView.builder(
  //           shrinkWrap: true,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisExtent: 265.v,
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 15.h,
  //             crossAxisSpacing: 15.h,
  //           ),
  //           physics: BouncingScrollPhysics(),
  //           itemCount: 12,
  //           itemBuilder: (context, index) {
  //             return GridtenoffItemWidget();
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Common widget
  Widget _buildShoppingSecurity(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              ShoppingSecurityisExpanded = !ShoppingSecurityisExpanded;
            });
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                    padding: EdgeInsets.only(right: 7.h),
                    child: Text(
                      "أمن التسوق",
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
              )),
        ),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("خيارات الدفع الآمنة"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("الخدمات اللوجستية الآمنة"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("تأمين الخصوصية"),
        if (ShoppingSecurityisExpanded)
          _buildAdditionalInformation("حماية المشتريات"),
      ],
    );
  }

  /// Common widget
  Widget _buildReview(BuildContext context) {
    return Container(
      height: Get.height * .5,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: productviewcontroller
                .userlist.value.productReview?.productReviewDetails?.length ??
            0,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * .04,
              ),
              _buildRowItemsReviewsAnd(context),
              SizedBox(height: 8.v),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    Text(
                      "${productviewcontroller.userlist.value.productReview?.productAverageReview?.toString()}",
                      style: CustomTextStyles.titleMediumInter,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 60.adaptSize,
                      width: 60.adaptSize,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      // AppDecoration.fillBlueGray.copyWith(
                      //   borderRadius: BorderRadiusStyle.circleBorder20,
                      // ),
                      child: CustomImageView(
                        imagePath:
                            "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].userImage.toString()}",
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
                    padding: EdgeInsets.only(right: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].userName.toString()}",
                            style: TextStyle(
                                fontFamily: 'Almarai',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        SizedBox(height: 8.v),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.h,
                                bottom: 2.v,
                              ),
                              child: Text(
                                  "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].reviewDate.toString()}",
                                  style: TextStyle(
                                      fontFamily: 'Almarai',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgClock,
                                height: 15.adaptSize,
                                width: 15.adaptSize,
                              ),
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
                padding: EdgeInsets.only(right: 20.h),
                child: CustomRatingBar(
                  initialRating: productviewcontroller.userlist.value
                      .productReview?.productReviewDetails?[index].ratting
                      ?.toDouble(), // Convert int? to double?
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
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: 13.v),
              // Obx(() {
              //   if (productviewcontroller.userlist.value
              //           .productReview?.productReviewDetails?[index].galleryUrl
              //           .toString() ==
              //       null) {
              //     return Text("");
              //   } else {
              //     return CustomImageView(
              //       imagePath:
              //           "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
              //       height: 80.adaptSize,
              //       width: 80.adaptSize,
              //       radius: BorderRadius.circular(
              //         8.h,
              //       ),
              //       alignment: Alignment.center,
              //     );
              //   }
              // }),
              // _buildListRectangle1(context),
              // Container(
              //   height: Get.height * .1,
              //   child: ListView.separated(
              //  physics: ScrollPhysics(),
              //     padding: EdgeInsets.only(
              //       left: 20.h,
              //       right: 20.h,
              //     ),
              //     scrollDirection: Axis.horizontal,
              //     separatorBuilder: (
              //       context,
              //       index,
              //     ) {
              //       return SizedBox(
              //         width: Get.width * .04,
              //       );
              //     },
              //     itemCount: productviewcontroller.userlist.value
              //             .productReview?.productReviewDetails?.length ??
              //         0,
              //     itemBuilder: (context, index) {
              //       return SizedBox(
              //         height: 80.adaptSize,
              //         width: 80.adaptSize,
              // child: CustomImageView(
              //   imagePath:
              //       "${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].galleryUrl.toString()}",
              //   height: 80.adaptSize,
              //   width: 80.adaptSize,
              //   radius: BorderRadius.circular(
              //     8.h,
              //   ),
              //   alignment: Alignment.center,
              // ),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 20.v),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text('يشارك',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Almarai',
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
                          "مفيد(${productviewcontroller.userlist.value.productReview?.productReviewDetails?[index].helpful.toString()})",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Almarai',
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
                        color: LikeisActive ? Color(0xffff8300) : Colors.black,
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

  Widget buildAvatarColumn() {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            "assets/images/img_ellipse_1.png",
          ),
        ),
        SizedBox(height: Get.height * 0.01),
        Text(
          "إلكترونيات",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: 'Almarai',
          ),
        ),
      ],
    );
  }

  Widget _buildHomePageSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
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
              homeView_controller.userList.value.recommendedProduct?.length ??
                  0,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width, padding: EdgeInsets.only(left: 20),
                  // height: 160.adaptSize,
                  // width: 160.adaptSize,
                  // height: Get.height*.2,
                  // width: Get.width*.3,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: CustomImageView(
                          fit: BoxFit.cover,
                          imagePath:
                              "${homeView_controller.userList.value.recommendedProduct?[index].imageUrl.toString()}",
                          onTap: () {
                            arabicMainCatId = homeView_controller.userList.value
                                .recommendedProduct![index].mainCategoryId!
                                .toString();
                            arabicProductId = homeView_controller
                                .userList.value.recommendedProduct![index].id!
                                .toString();
                            productviewcontroller.Single_ProductApiHit(
                                arabicMainCatId, arabicProductId);
                            Get.to(ArabicMensSingleViewScreen());
                          },
                          height: 190.adaptSize,
                          width: 190.adaptSize,
                          radius: BorderRadius.circular(
                            10.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            right: 10.h,
                          ),
                          child: CustomIconButton(
                            onTap: () {
                              //
                              Arabic_Add_remove_productid = homeView_controller
                                  .userList.value.recommendedProduct![index].id!
                                  .toString();
                              ArabicAdd_remove_wishlistController()
                                  .AddRemoveWishlish_apihit();

                              setState(() {
                                // Add_remove_productidd;
                                //  isButtonTapped = !isButtonTapped;
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
                Container(
                  height: 16.v,
                  width: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(71, 228, 193, 204),
                  ),
                  child: Center(
                    child: Text(
                      'خصم 10',
                      style: TextStyle(
                          fontSize: 8,
                          color: Color(0xffff8300),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                ),
                // CustomElevatedButton(
                //   height: 16.v,
                //   width: 48.h,
                //   text: "10% Off",
                //   buttonTextStyle:
                //       theme.textTheme.labelSmall!.copyWith(color: Colors.white).copyWith(backgroundلون: Color.fromARGB(214, 252, 204, 220)),
                // ),
                SizedBox(height: 5.v),
                SizedBox(
                  width: 131.h,
                  child: Text(
                    "${homeView_controller.userList.value.recommendedProduct?[index].title.toString()}",
                    // "ساعة كوارتز حجر الراين الفاخرة السيدات روما...",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge!
                        .copyWith(
                          height: 1.33,
                        )
                        .copyWith(fontFamily: 'Almarai'),
                  ),
                ),
                SizedBox(height: 3.v),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                              Text(
                                "${homeView_controller.userList.value.recommendedProduct?[index].averageRating.toString()}",
                                // "4.8",
                                style: theme.textTheme.labelMedium
                                    ?.copyWith(fontFamily: 'Almarai'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.v),
                        Row(
                          children: [
                            Text(
                              "2k+ مُباع  ",
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontFamily: 'Almarai'),
                            ),
                            Text(
                              "${homeView_controller.userList.value.recommendedProduct?[index].price.toString()}",
                              //"\$99 ",
                              style: CustomTextStyles.titleMediumPrimary_2
                                  .copyWith(fontFamily: 'Almarai'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 58.h,
                        top: 3.v,
                      ),
                      child: CustomIconButton(
                        onTap: () async {
                          arabicMainCatId = homeView_controller.userList.value
                              .recommendedProduct![index].mainCategoryId!
                              .toString();
                          arabicProductId = homeView_controller
                              .userList.value.recommendedProduct![index].id!
                              .toString();
                          productviewcontroller.Single_ProductApiHit(
                              arabicMainCatId, arabicProductId);

                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return _buildAddtocart(
                                    context, arabicMainCatId, arabicProductId);
                              });
                        },
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(6.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgGroup239533,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddtocart(
    BuildContext context,
    String? arabicMainCatId,
    String? arabicProductId,
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
                              "أضف إلى السلة",
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
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
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
                          "أضف إلى السلة",
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
                            AselectedcolorIndex.value = (-1);
                            AselectedSizeIndex.value = (-1);
                            AselectedModelIndex.value = (-1);
                            AselecteditemIndex.value = (-1);
                            AselectedCapacityIndex.value = (-1);
                            AselectedquantityIndex.value = (-1);
                            AselectedweightIndex.value = (-1);
                            sizeid = null;
                            modelid = null;
                            itemid = null;
                            weightid = null;
                            quantityid = null;
                            capacityid = null;
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
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                List<String>? colorGallery =
                                                    productviewcontroller
                                                        .userlist
                                                        .value
                                                        .productView!
                                                        .productDetails
                                                        ?.details
                                                        ?.color?[
                                                            AselectedcolorIndex
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
                                              itemBuilder:
                                                  (BuildContext context,
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
                            height: Get.height * .03,
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
                          // SizedBox(
                          //   height: Get.height * .03,
                          // ),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.color !=
                                  null)
                            Container(
                              // height: Get.height * .16,
                              height: Get.height * .22,
                              child: ListView.builder(
                                  itemCount: 1,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                              const EdgeInsets.only(right: 20),
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "الألوان: ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: AselectedcolorIndex
                                                                  .value !=
                                                              -1
                                                          ? selectedcolored
                                                              .value
                                                          : " ",
                                                      style: theme
                                                          .textTheme.titleMedium
                                                          ?.copyWith(
                                                              fontSize: 15,
                                                              color: Color
                                                                  .fromARGB(
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
                                              height: Get.height * .18,
                                              child: ListView.separated(
                                                // padding: EdgeInsets.only(left: 20.h),
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                            AselectedcolorIndex
                                                                .value = index;
                                                            selectedImageUrl =
                                                                imageUrl;
                                                            selectedImageIndex =
                                                                index;
                                                            print(
                                                                "${selectedcolored.value},${AselectedcolorIndex.value}");
                                                          });

                                                          colorId =
                                                              productviewcontroller
                                                                  .userlist
                                                                  .value
                                                                  .productView
                                                                  ?.productDetails
                                                                  ?.details
                                                                  ?.color?[
                                                                      index]
                                                                  .id
                                                                  .toString();

                                                          arabicpid =
                                                              productviewcontroller
                                                                  .userlist
                                                                  .value
                                                                  .productView
                                                                  ?.id
                                                                  .toString();
                                                          arabicproductColor =
                                                              colorId
                                                                  .toString();
                                                          arabicproductSize =
                                                              sizeid.toString();
                                                          arabicproductCapacity =
                                                              capacityid
                                                                  .toString();
                                                          arabicproductItem =
                                                              itemid.toString();
                                                          arabicproductModel =
                                                              modelid
                                                                  .toString();
                                                          arabicproductQuantity =
                                                              quantityid
                                                                  .toString();
                                                          arabicproductweight =
                                                              weightid
                                                                  .toString();
                                                          print(arabicpid);
                                                          print(
                                                              arabicproductColor);
                                                          print(
                                                              arabicproductSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                          updatedprice.value =
                                                              _productpricechangebyattributecontroller
                                                                  .userlist
                                                                  .value
                                                                  .data!
                                                                  .price
                                                                  .toString();

                                                          // print(selectedSizeIndex);
                                                        },
                                                        child: Obx(
                                                          () => Container(
                                                              height:
                                                                  Get.height *
                                                                      .15,
                                                              width: Get.width *
                                                                  .2,
                                                              decoration: BoxDecoration(
                                                                  border: AselectedcolorIndex
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
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                              Radius.circular(10))),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    // height:
                                                                    //     Get.height *
                                                                    //         .1,
                                                                    // width:
                                                                    //     Get.width *
                                                                    //         .1,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CustomImageView(
                                                                        fit: BoxFit
                                                                            .fitWidth,
                                                                        imagePath:
                                                                            "$imageUrl",
                                                                        height:
                                                                            80.adaptSize,
                                                                        width: 70
                                                                            .adaptSize,
                                                                        radius:
                                                                            BorderRadius.circular(
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
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
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
                                      SizedBox(height: 10.v),
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

                                                      arabicpid =
                                                          productviewcontroller
                                                              .userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      arabicproductColor =
                                                          colorId.toString();
                                                      arabicproductSize =
                                                          sizeid.toString();
                                                      arabicproductCapacity =
                                                          capacityid.toString();
                                                      arabicproductItem =
                                                          itemid.toString();
                                                      arabicproductModel =
                                                          modelid.toString();
                                                      arabicproductQuantity =
                                                          quantityid.toString();
                                                      arabicproductweight =
                                                          weightid.toString();
                                                      print(arabicpid);
                                                      print(arabicproductColor);
                                                      print(arabicproductSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
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
                              ),
                            ),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
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
                                                      AselectedSizeIndex.value =
                                                          index;
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

                                                      arabicpid =
                                                          productviewcontroller
                                                              .userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      arabicproductColor =
                                                          colorId.toString();
                                                      arabicproductSize =
                                                          sizeid.toString();
                                                      arabicproductCapacity =
                                                          capacityid.toString();
                                                      arabicproductItem =
                                                          itemid.toString();
                                                      arabicproductModel =
                                                          modelid.toString();
                                                      arabicproductQuantity =
                                                          quantityid.toString();
                                                      arabicproductweight =
                                                          weightid.toString();
                                                      print(arabicpid);
                                                      print(arabicproductColor);
                                                      print(arabicproductSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
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
                              ),
                            ),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.model !=
                                  null)
                            Container(
                                height: Get.height * .14,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Model",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 20)),
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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                        AselectedSizeIndex
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

                                                        arabicpid =
                                                            productviewcontroller
                                                                .userlist
                                                                .value
                                                                .productView
                                                                ?.id
                                                                .toString();
                                                        arabicproductColor =
                                                            colorId.toString();
                                                        arabicproductSize =
                                                            sizeid.toString();
                                                        arabicproductCapacity =
                                                            capacityid
                                                                .toString();
                                                        arabicproductItem =
                                                            itemid.toString();
                                                        arabicproductModel =
                                                            modelid.toString();
                                                        arabicproductQuantity =
                                                            quantityid
                                                                .toString();
                                                        arabicproductweight =
                                                            weightid.toString();
                                                        print(arabicpid);
                                                        print(
                                                            arabicproductColor);
                                                        print(
                                                            arabicproductSize);

                                                        _productpricechangebyattributecontroller
                                                            .ProductPriceChangeByAttribute(
                                                                context);
                                                        updatedprice.value =
                                                            _productpricechangebyattributecontroller
                                                                .userlist
                                                                .value
                                                                .data!
                                                                .price
                                                                .toString();
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
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    border: AselectedSizeIndex.value ==
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
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: Center(
                                                              child: Text(
                                                                '$Aselectedsizename',
                                                                style:
                                                                    TextStyle(
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
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
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
                                                      AselectedSizeIndex.value =
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

                                                      arabicpid =
                                                          productviewcontroller
                                                              .userlist
                                                              .value
                                                              .productView
                                                              ?.id
                                                              .toString();
                                                      arabicproductColor =
                                                          colorId.toString();
                                                      arabicproductSize =
                                                          sizeid.toString();
                                                      arabicproductCapacity =
                                                          capacityid.toString();
                                                      arabicproductItem =
                                                          itemid.toString();
                                                      arabicproductModel =
                                                          modelid.toString();
                                                      arabicproductQuantity =
                                                          quantityid.toString();
                                                      arabicproductweight =
                                                          weightid.toString();
                                                      print(arabicpid);
                                                      print(arabicproductColor);
                                                      print(arabicproductSize);

                                                      _productpricechangebyattributecontroller
                                                          .ProductPriceChangeByAttribute(
                                                              context);
                                                      updatedprice.value =
                                                          _productpricechangebyattributecontroller
                                                              .userlist
                                                              .value
                                                              .data!
                                                              .price
                                                              .toString();
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
                              ),
                            ),
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.quantityy !=
                                  null)
                            Container(
                                height: Get.height * .14,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Quantity",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 20)),
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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                              ?.quantityy?[
                                                                  index]
                                                              .value ??
                                                          "";

                                                  return SizedBox(
                                                    width: 70.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        AselectedSizeIndex
                                                            .value = index;
                                                        quantityid =
                                                            productviewcontroller
                                                                .userlist
                                                                .value
                                                                .productView
                                                                ?.productDetails
                                                                ?.details
                                                                ?.quantityy?[
                                                                    index]
                                                                .id
                                                                .toString();

                                                        arabicpid =
                                                            productviewcontroller
                                                                .userlist
                                                                .value
                                                                .productView
                                                                ?.id
                                                                .toString();
                                                        arabicproductColor =
                                                            colorId.toString();
                                                        arabicproductSize =
                                                            sizeid.toString();
                                                        arabicproductCapacity =
                                                            capacityid
                                                                .toString();
                                                        arabicproductItem =
                                                            itemid.toString();
                                                        arabicproductModel =
                                                            modelid.toString();
                                                        arabicproductQuantity =
                                                            quantityid
                                                                .toString();
                                                        arabicproductweight =
                                                            weightid.toString();
                                                        print(arabicpid);
                                                        print(
                                                            arabicproductColor);
                                                        print(
                                                            arabicproductSize);

                                                        _productpricechangebyattributecontroller
                                                            .ProductPriceChangeByAttribute(
                                                                context);
                                                        updatedprice.value =
                                                            _productpricechangebyattributecontroller
                                                                .userlist
                                                                .value
                                                                .data!
                                                                .price
                                                                .toString();
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
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    border: AselectedSizeIndex.value ==
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
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: Center(
                                                              child: Text(
                                                                '$Aselectedsizename',
                                                                style:
                                                                    TextStyle(
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
                          if (productviewcontroller.userlist.value.productView
                                      ?.productType ==
                                  "variable" &&
                              productviewcontroller.userlist.value.productView
                                      ?.productDetails?.details!.weight !=
                                  null)
                            Container(
                                height: Get.height * .14,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Weight",
                                                    style: theme
                                                        .textTheme.titleMedium
                                                        ?.copyWith(
                                                            fontSize: 20)),
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
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                        AselectedSizeIndex
                                                            .value = index;
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

                                                        arabicpid =
                                                            productviewcontroller
                                                                .userlist
                                                                .value
                                                                .productView
                                                                ?.id
                                                                .toString();
                                                        arabicproductColor =
                                                            colorId.toString();
                                                        arabicproductSize =
                                                            sizeid.toString();
                                                        arabicproductCapacity =
                                                            capacityid
                                                                .toString();
                                                        arabicproductItem =
                                                            itemid.toString();
                                                        arabicproductModel =
                                                            modelid.toString();
                                                        arabicproductQuantity =
                                                            quantityid
                                                                .toString();
                                                        arabicproductweight =
                                                            weightid.toString();
                                                        print(arabicpid);
                                                        print(
                                                            arabicproductColor);
                                                        print(
                                                            arabicproductSize);

                                                        _productpricechangebyattributecontroller
                                                            .ProductPriceChangeByAttribute(
                                                                context);
                                                        updatedprice.value =
                                                            _productpricechangebyattributecontroller
                                                                .userlist
                                                                .value
                                                                .data!
                                                                .price
                                                                .toString();
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
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    border: AselectedSizeIndex.value ==
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
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: Center(
                                                              child: Text(
                                                                '$Aselectedsizename',
                                                                style:
                                                                    TextStyle(
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
                              "variable")
                            Padding(
                              padding: EdgeInsets.only(right: 20),
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
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xffff8300),
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
                              padding: EdgeInsets.only(right: 20),
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
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xffff8300),
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

                          SizedBox(
                            height: Get.height * .05,
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
                                          if (_productpricechangebyattributecontroller
                                                  .Productincart.value ==
                                              0) {
                                            Arabiccartproductid =
                                                productviewcontroller.userlist
                                                    .value.productView?.id
                                                    .toString();
                                            ArabicAddtocartColor =
                                                colorId?.toString();
                                            ArabicAddtocartprice = arabicpid !=
                                                    ''
                                                ? _productpricechangebyattributecontroller
                                                    .productPrice.value
                                                : productviewcontroller.userlist
                                                    .value.productView?.price
                                                    .toString();
                                            ArabicAddtocartquantity =
                                                quantity.toString();
                                            ArabicAddtocartSize =
                                                sizeid?.toString();
                                            ArabicAddtocartModelId =
                                                modelid?.toString();
                                            ArabicAddtocartItemlId =
                                                itemid?.toString();
                                            ArabicAddtocartWeightlId =
                                                weightid?.toString();
                                            ArabicAddtocartQuantitylId =
                                                quantityid?.toString();
                                            ArabicAddtocartCapacitylId =
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
                                                        ? "أضف إلى السلة"
                                                        : "بالفعل في سلة التسوق",
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
                                          Arabiccartproductid =
                                              productviewcontroller.userlist
                                                  .value.productView?.id
                                                  .toString();
                                          // ArabicAddtocartColor = "";
                                          ArabicAddtocartprice =
                                              productviewcontroller.userlist
                                                  .value.productView?.price
                                                  .toString();
                                          ArabicAddtocartquantity = "1";
                                          // EnglishAddtocartSize = "";
                                          AddToCartcontrollerin
                                              .addtocart_Apihit(context);
                                          color = null;
                                          size1 = null;
                                          selectedcolored.value = "";
                                          AselectedcolorIndex.value = -1;
                                          colorId = null;
                                          AselectedSizeIndex.value = -1;
                                          sizeid = null;
                                          AselectedcolorIndex.value = -1;
                                          AselectedSizeIndex.value = -1;
                                          quantity.value = 1;
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
                                                        ? "أضف إلى السلة"
                                                        : "بالفعل في سلة التسوق",
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
        ),
      );
    }
  }

  _buildColors(BuildContext context) {
    return Container(
      height: Get.height * .18,
      child: ListView.builder(
          itemCount: 1,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            color = productviewcontroller.userlist.value.productView
                ?.productDetails?.details?.color?[index].value
                .toString();

            return Column(
              children: [
                // SizedBox(height: 11.v),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "الألوان : ",
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
                      height: Get.height * .13,
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

                                  arabicpid = productviewcontroller
                                      .userlist.value.productView?.id
                                      .toString();
                                  arabicproductColor = colorId.toString();
                                  arabicproductSize = sizeid.toString();
                                  arabicproductCapacity = capacityid.toString();
                                  arabicproductItem = itemid.toString();
                                  arabicproductModel = modelid.toString();
                                  arabicproductQuantity = quantityid.toString();
                                  arabicproductweight = weightid.toString();
                                  print(arabicpid);
                                  print(arabicproductColor);
                                  print(arabicproductSize);

                                  _productpricechangebyattributecontroller
                                      .ProductPriceChangeByAttribute(context);
                                  updatedprice.value =
                                      _productpricechangebyattributecontroller
                                          .userlist.value.data!.price
                                          .toString();
                                },
                                child: Obx(
                                  () => Container(
                                      height: 100,
                                      width: 70,
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
                                            height: 80,
                                            width: 70,
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
}
