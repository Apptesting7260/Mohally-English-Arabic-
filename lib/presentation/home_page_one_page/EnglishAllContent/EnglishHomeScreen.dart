import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/Add_remove_wishlistController/English_wishlish_addandRemove_controller.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/Home_Banner_Controller/home_banner_controller.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import '../widgets/shippingsection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

var submainCatId;
var productId;
var mainCatId;
var categoryId;
// String? size1;
// String? sizeid;
// String? colorId;
// String? color;
RxString updatedprice = ''.obs;
RxInt quantity = 1.obs;

class EnglishHomeScreen extends StatefulWidget {
  const EnglishHomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EnglishHomeScreenState createState() => EnglishHomeScreenState();
}

class EnglishHomeScreenState extends State<EnglishHomeScreen>
    with AutomaticKeepAliveClientMixin<EnglishHomeScreen> {
  int selectedImageIndex = 0;
  String selectedImageUrl = "";
  // RxInt selectedSizeIndex = (-1).obs;
  // RxInt selectedModelIndex = (-1).obs;
  // RxInt selecteditemIndex = (-1).obs;
  // RxInt selectedCapacityIndex = (-1).obs;
  // RxInt selectedquantityIndex = (-1).obs;
  // RxInt selectedweightIndex = (-1).obs;
  String? color;
  String? Size;
  String? Model;
  String? Item;
  String? Quantity;
  String? Weight;
  String? Capacity;
  RxInt quantity = 1.obs;
  String? sizeid;
  String? modelid;
  String? itemid;
  String? weightid;
  String? quantityid;
  String? capacityid;
  int selectedTabIndex = 0;
  int _currentIndex = 0;
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  CategoriesByNameControllerEnglish _categoryByName =
      CategoriesByNameControllerEnglish();
  CategoriesByNameControllerEnglish _categorybynamecontroller =
      CategoriesByNameControllerEnglish();
  PageController _pageController = PageController();
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  List<bool> tappedList = List.generate(200, (index) => false);
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());
  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  bool isProductAddedToWishlist = false;
  List<bool> isButtonTappedList = List.generate(200, (index) => false);
  bool isButtonTapped = false;
  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  HomeBanner_controller homeBanner_controller = HomeBanner_controller();
  EnglishAdd_remove_wishlistController englishAddRemoveWishlistController =
      EnglishAdd_remove_wishlistController();
  // int selectedIndex = -1;
  List<Widget> carouselItems = [
    //  Image.network(homeBanner_controller.userList.value.homeBanner!.bannerUrl![0].s0.toString()),
    Image.asset("assets/images/banner 1.png"),
    Image.asset("assets/images/banner 1.png")
  ];
  int counter = 1;

  @override
  void initState() {
    super.initState();
    homeBanner_controller.homeBanner_apihit();
    homeView_controller.homeview_apihit();
setState(() {
 sizeid=null;
 modelid=null;
 itemid=null;
 weightid=null;
 quantityid=null;
 capacityid=null;
 colorId=null;     
  productpricechangeDetails = {};
  AselectedcolorIndex.value = (-1);
 AselectedSizeIndex.value =(-1);
 AselectedModelIndex.value =(-1);
 AselecteditemIndex.value =(-1);
 AselectedCapacityIndex.value =(-1);
 AselectedquantityIndex.value =(-1);
 AselectedweightIndex.value =(-1);
    });
    // loadStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);
    return Obx(() {
      if (homeView_controller.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (homeView_controller.rxRequestStatus.value == Status.ERROR) {
        if (homeView_controller.error.value == 'No internet') {
          return InterNetExceptionWidget(onPress: () {});
        } else {
          return GeneralExceptionWidget(onPress: () {});
        }
      } else {
        return Scaffold(
          // backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              height: Get.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //sSizedBox(height: 20.v),
                    Obx(() {
                      if (homeView_controller.rxRequestStatus.value ==
                          Status.LOADING) {
                        return const Scaffold(
                          body: Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        return Container(
                          width: Get.width,
                          child: CarouselSlider(
                            items:
                                //carouselItems,
                                List.generate(
                              homeBanner_controller.userList.value.homeBanner
                                          ?.bannerUrl ==
                                      null
                                  ? 0
                                  : homeBanner_controller.userList.value
                                      .homeBanner!.bannerUrl!.length,
                              (index) => Image.network(
                                homeBanner_controller.userList.value.homeBanner
                                        ?.bannerUrl?[index]
                                        .toString() ??
                                    "",
                              ),
                            ),
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 0.85,
                              enlargeCenterPage: true,
                            ),
                          ),
                        );
                      }
                    }),
                    // _buildBannerSection(context),
                    SizedBox(height: 5.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: Get.height * .08,
                          width: Get.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(136, 235, 215, 215),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/return.png",
                              ),
                              // SizedBox(
                              //   width: Get.width * .01,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Free shipping',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Jost'),
                                  ),
                                  Text(
                                    'Time Limited Offer',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        fontFamily: 'Jost'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: Get.width * .05,
                        // ),
                        Container(
                          height: Get.height * .08,
                          width: Get.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(135, 236, 213, 213),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/ship.png",
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Free Returns',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Jost'),
                                  ),
                                  Text(
                                    'Within 90 days',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        fontFamily: 'Jost'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 29.v),
                    Padding(
                      // padding: EdgeInsets.only(right: 15, left: 15),
                      padding: EdgeInsets.only(
                          right: Get.width * 0.042, left: Get.width * 0.042),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: theme.textTheme.titleMedium,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 2.v),
                            child: GestureDetector(
                              // onTap: () {
                              //   Get.to(CategoryScreen(
                              //     showAppBar: true,
                              //     FromHomeToCat: true,
                              //     selectedTabIndex: 0,
                              //   ));
                              // },
                              onTap: () {
                                selectedTabIndex = 0;
                                print(selectedTabIndex);

                                categoryId = homeView_controller
                                    .userList.value.categoryData?[0].id!
                                    .toString();
                                _categoryByName.CategoryByNameApiHit(
                                    categoryId);
                                Get.to(CategoryScreen(
                                    showAppBar: true,
                                    FromHomeToCat: true,
                                    selectedTabIndex: selectedTabIndex));
                              },
                              child: Text(
                                "See All",
                                style: CustomTextStyles.bodyMediumPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // _buildCategorySection(context),
                    SizedBox(height: 19.v),

                    homeView_controller.userList.value.categoryData == null ||
                            homeView_controller
                                    .userList.value.categoryData?.length ==
                                0
                        ? Center(
                            child: Padding(
                            // padding: const EdgeInsets.only(top: 150),
                            padding: EdgeInsets.only(top: Get.height * 0.2),
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
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                ),
                              ],
                            ),
                          ))
                        : Padding(
                            // padding: const EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(
                                right: Get.width * 0.055,
                                left: Get.width * 0.055),

                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: Get.height * .15,
                                crossAxisCount: 4,
                                mainAxisSpacing: 17.h,
                                crossAxisSpacing: 15.h,
                              ),
                              physics: BouncingScrollPhysics(),
                              itemCount: homeView_controller
                                      .userList.value.categoryData?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedTabIndex = index;
                                        print(selectedTabIndex);

                                        categoryId = homeView_controller
                                            .userList
                                            .value
                                            .categoryData?[index]
                                            .id!
                                            .toString();
                                        _categorybynamecontroller
                                            .CategoryByNameApiHit(categoryId);

                                        Get.to(CategoryScreen(
                                            showAppBar: true,
                                            FromHomeToCat: true,
                                            selectedTabIndex:
                                                selectedTabIndex));
                                        print(
                                            "RRRRRRRRRRRRRRR$selectedTabIndex");
                                      },
                                      child: CircleAvatar(
                                        radius: Get.width * 0.08,
                                        backgroundImage: NetworkImage(
                                          "${homeView_controller.userList.value.categoryData?[index].imageUrl}",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.v),
                                    Text(
                                      "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                      style: TextStyle(
                                        color: Color(0xFF272727),
                                        fontSize: 12,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),

                    SizedBox(height: 20.v),
                    _buildHomePageSection(context),
                    SizedBox(height: 10.v),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  /// Section Widget

  Widget _buildShippingSection(BuildContext context) {
    return SizedBox(
      height: 60.v,
      child: ListView.separated(
        padding: EdgeInsets.only(right: 20.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 15.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return ShippingsectionItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCategorySection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: theme.textTheme.titleMedium,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: GestureDetector(
              onTap: () {
                Get.to(CategoryScreen(
                  showAppBar: true,
                  FromHomeToCat: true,
                  selectedTabIndex: 0,
                ));
              },
              child: Text(
                "See All",
                style: CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHomePageSection(BuildContext context) {
    //  super.build(context);
    return Padding(
      // padding: const EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(right: Get.width * 0.027),

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
                        productviewcontroller.Single_ProductApiHit(
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
                // padding: const EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: Get.width * 0.027),
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
                // padding: const EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: Get.width * 0.027),

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
                // padding: const EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: Get.width * 0.027),

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
                              // }
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
    (colorId != null && quantityid != null && modelid != null) || 
    (colorId != null && capacityid != null && modelid != null) || 
    (itemid != null && weightid != null && modelid != null) || 
    (itemid != null && quantityid != null && modelid != null) || 
    (itemid != null && capacityid != null && modelid != null) || 
    (weightid != null && quantityid != null && modelid != null) || 
    (weightid != null && capacityid != null && modelid != null) || 
    (quantityid != null && capacityid != null && modelid != null)) {
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
    (colorId != null && quantityid != null && modelid != null) || 
    (colorId != null && capacityid != null && modelid != null) || 
    (itemid != null && weightid != null && modelid != null) || 
    (itemid != null && quantityid != null && modelid != null) || 
    (itemid != null && capacityid != null && modelid != null) || 
    (weightid != null && quantityid != null && modelid != null) || 
    (weightid != null && capacityid != null && modelid != null) || 
    (quantityid != null && capacityid != null && modelid != null)) {
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
    (colorId != null && quantityid != null && modelid != null) || 
    (colorId != null && capacityid != null && modelid != null) || 
    (itemid != null && weightid != null && modelid != null) || 
    (itemid != null && quantityid != null && modelid != null) || 
    (itemid != null && capacityid != null && modelid != null) || 
    (weightid != null && quantityid != null && modelid != null) || 
    (weightid != null && capacityid != null && modelid != null) || 
    (quantityid != null && capacityid != null && modelid != null)) {
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



}
