import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_Add_whishlistProduct.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_ProductPrceChnageByAttribute.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_remove_wishlist_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_addtocartController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_singleproductviewController.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_viewwishlistController.dart';
import 'package:mohally/Arabic/Screens/ArabicSingleView/ArabicSingleProductView.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/ArabicHomeScreen.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/ArabicHomeController.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore_for_file: must_be_immutable
class WishlistPage_arabic extends StatefulWidget {
  final bool showAppBar;

  const WishlistPage_arabic({Key? key, this.showAppBar = false})
      : super(
          key: key,
        );

  @override
  State<WishlistPage_arabic> createState() => _WishlistPage_arabicState();
}

class _WishlistPage_arabicState extends State<WishlistPage_arabic> {
  RxInt quantity = 1.obs;
  ArabicProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ArabicProductPriceChngeByAttribute();
  PageController _pageController = PageController();

  int _currentIndex = 0;
  arabic_addtocart_controller AddToCartcontrollerin =
      arabic_addtocart_controller();
  int selectedImageIndex = 0;

  String selectedImageUrl = "";

  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  RxInt selectedSizeIndex = (-1).obs;
  ArabicSingleProductViewController productviewcontroller =
      ArabicSingleProductViewController();

  List<bool> isButtonTappedList = List.generate(12, (index) => false);
  ArabicHomeView_controller homeView_controller = ArabicHomeView_controller();
  ArabicViewwishlist viewWishlistcontroller = ArabicViewwishlist();
  Add_remove_wishlistController add_remove_wishlistController =
      Add_remove_wishlistController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    viewWishlistcontroller.ViewWishlish_apihit();
    homeView_controller.homeview_apihit();
    setState(() {
      sizeid = null;
      modelid = null;
      itemid = null;
      weightid = null;
      quantityid = null;
      capacityid = null;
      colorId = null;
      arabicpriceproductDetails = {};
      AselectedcolorIndex.value = (-1);
      AselectedSizeIndex.value = (-1);
      AselectedModelIndex.value = (-1);
      AselecteditemIndex.value = (-1);
      AselectedCapacityIndex.value = (-1);
      AselectedquantityIndex.value = (-1);
      AselectedweightIndex.value = (-1);
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(child: Obx(() {
      if (viewWishlistcontroller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (homeView_controller.rxRequestStatus.value == Status.ERROR) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error2.png',
            ),
            Center(
              child: Text(
                "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      } else if (viewWishlistcontroller.rxRequestStatus.value == Status.ERROR) {
        return Column(
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
              textAlign: TextAlign.center,
            ),
          ],
        );
      } else {
        return Scaffold(
          appBar: widget.showAppBar
              ? CustomAppBar(
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
                    text: "قائمة الرغبات",
                    // margin: EdgeInsets.only(left: 10),
                  ),
                )
              : null,
          body: SmartRefresher(
            enablePullDown: true,
            onRefresh: () async {
              viewWishlistcontroller.ViewWishlish_apihit();
              await Future.delayed(
                  Duration(seconds: 1)); // Adjust the duration as needed
              _refreshController.refreshCompleted();
            },
            enablePullUp: false,
            controller: _refreshController,
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  decoration: AppDecoration.fillWhiteA,
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 20.h,),
                    child: Column(
                      children: [
                        SizedBox(height: 25.v),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "قائمة الرغبات",
                              style: theme.textTheme.headlineMedium
                                  ?.copyWith(fontFamily: "Almarai"),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.v),
                        _buildEdit(context),
                        SizedBox(height: 27.v),
                        _buildWishlistGrid(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }));
  }

  /// Section Widget
  Widget _buildEditButton(BuildContext context) {
    return CustomElevatedButton(
      height: 35.v,
      width: 65.h,
      text: "يحرر",
      margin: EdgeInsets.only(bottom: 2.v),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 5.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgEdit,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillGray,
      buttonTextStyle: CustomTextStyles.bodyMediumGray9000115
          ?.copyWith(fontFamily: "Almarai"),
    );
  }

  /// Section Widget
  Widget _buildEdit(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${viewWishlistcontroller.userList.value.wishlistViewList!.length.toString()} عنصر',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontFamily: "Almarai"),
                ),
              ),
              SizedBox(height: 6.v),
              Text(
                'في قائمة الرغبات',
                style: CustomTextStyles.bodyLargeGray50001_3
                    ?.copyWith(fontFamily: "Almarai"),
              ),
            ],
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildWishlistGrid(BuildContext context) {
    return viewWishlistcontroller.userList.value.wishlistViewList == null ||
            viewWishlistcontroller.userList.value.wishlistViewList!.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/wishlist.png',
                  width: 100,
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Center(
                  child: Text(
                    "قائمة رغباتك فارغة!",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      fontFamily: 'Almarai',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "استكشف المزيد وقم بوضع قائمة مختصرة لبعض العناصر",
                      style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Color.fromARGB(73, 0, 0, 0),
                          fontFamily: 'Almarai'),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Container(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: Get.height * .4,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.h,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: viewWishlistcontroller
                    .userList.value.wishlistViewList!.length,
                itemBuilder: (context, index) {
                  final wishlistProduct = viewWishlistcontroller
                      .userList.value.wishlistViewList![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        // padding: EdgeInsets.only(left: 20),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: CustomImageView(
                                fit: BoxFit.cover,
                                imagePath: wishlistProduct.imageUrl.toString(),
                                onTap: () {
                                  arabicMainCatId =
                                      wishlistProduct.categoryId.toString();

                                  arabicProductId =
                                      wishlistProduct.id!.toString();
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
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                padding: EdgeInsets.all(5.h),
                                decoration: IconButtonStyleHelper.fillWhiteA,
                                alignment: Alignment.topRight,
                                child: CustomImageView(
                                  imagePath: isButtonTappedList[index]
                                      ? ImageConstant.imgSearch
                                      : ImageConstant.imgGroup239531,
                                  onTap: () {
                                    //
                                    Arabic_Add_remove_productid =
                                        wishlistProduct.id!.toString();
                                    ArabicAdd_remove_wishlistController()
                                        .AddRemoveWishlish_apihit();

                                    setState(() {
                                      // Add_remove_productidd;
                                      //  isButtonTapped = !isButtonTapped;
                                      isButtonTappedList[index] =
                                          !isButtonTappedList[index];
                                    });
                                  },
                                ),
                              ),
                            ),
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
                              fontFamily: 'Almarai',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 131.h,
                        child: Text(
                          wishlistProduct.aTitle.toString(),
                          maxLines: 1,
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
                                    wishlistProduct.price.toString(),
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
                              height: 30.adaptSize,
                              width: 30.adaptSize,
                              padding: EdgeInsets.all(6.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGroup239533,
                                onTap: () async {
                                  arabicMainCatId =
                                      wishlistProduct.categoryId.toString();
                                  arabicProductId =
                                      wishlistProduct.id?.toString();

                                  productviewcontroller.Single_ProductApiHit(
                                      arabicMainCatId, arabicProductId);

                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return _buildAddtocart(context,
                                            arabicMainCatId, arabicProductId);
                                      });
                                },
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
                              height: Get.height * .18,
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
                                              height: Get.height * .14,
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
                                                              height: 100,
                                                              width: 70,
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
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10))),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    height: 80,
                                                                    width: 70,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CustomImageView(
                                                                        fit: BoxFit
                                                                            .cover,
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

  Widget _buildRowSize(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("مقاس", style: theme.textTheme.titleMedium),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 2.v),
            //   child: Text("دليل المقاسات",
            //       style: theme.textTheme.titleMedium
            //           ?.copyWith(color: Colors.grey)),
            // ),
          ],
        ),
      ),
    );
  }
}
