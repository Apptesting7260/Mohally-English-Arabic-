import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/category_page/category_screen.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/view_models/controller/Cart/EnglishAddtocartController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishCategorySearch.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishsearchController.dart';
import 'package:mohally/view_models/controller/ProductPriceChngeByAtrributeController/productpricechangebyattributecontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

class SearchScreen extends StatefulWidget {
  final String? searchQuery;
  SearchScreen({Key? key, this.searchQuery})
      : super(
          key: key,
        );

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  PageController _pageController = PageController();
  final AddToCartcontrollerin = Get.put(AddToCartcontroller());

  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  int selectedImageIndex = 0;
  String selectedImageUrl = "";
  RxInt selectedSizeIndex = (-1).obs;
  RxInt selectedModelIndex = (-1).obs;
  RxInt selecteditemIndex = (-1).obs;
  RxInt selectedCapacityIndex = (-1).obs;
  RxInt selectedquantityIndex = (-1).obs;
  RxInt selectedweightIndex = (-1).obs;
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
  ProductPriceChngeByAttribute _productpricechangebyattributecontroller =
      ProductPriceChngeByAttribute();
  RxString selectedcolored = "".obs;
  RxInt selectedcolorIndex = (-1).obs;
  ProductsByCatIdListControllerEnglish _productbycatlistcontroller =
      ProductsByCatIdListControllerEnglish();
  EnglishCategorySearchController _categorysearchcontroller =
      EnglishCategorySearchController();
  TextEditingController searchController = TextEditingController();
  EnglishSearchController _searchcontroller = EnglishSearchController();
  EnglishSingleProductViewController _singleproductviewController =
      EnglishSingleProductViewController();
  FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.searchQuery != null) {
      searchController.text = widget.searchQuery!; // Set search query text
      _searchcontroller.searchProducts(widget.searchQuery!); // Perform search
    }
    if (widget.searchQuery != null) {
      searchController.text = widget.searchQuery!; // Set search query text
      _categorysearchcontroller.SearchCategory(
          widget.searchQuery!); // Perform search
    }
  }

  List<bool> isButtonTappedList = List.generate(200, (index) => false);

  void _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      searchHistory = prefs.getStringList('searchHistory')?.toSet() ?? {};
    });
  }

  void _saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('searchHistory', searchHistory.toList());
  }

  Set<String> searchHistory = {};
  File imgFile = File("");

  final imgPicker = ImagePicker();
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  // TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                width: Get.width * .06,
                height: Get.height * .02,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(90, 158, 158, 158)),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                  ),
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (_searchcontroller.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_searchcontroller.error.value.isNotEmpty) {
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
          } else if (_searchcontroller.products.value.products!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nosearch.png',
                  height: Get.height * .1,
                  width: Get.width * .3,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Text(
                      'Ooops! We couldn\'t find any products that match your search criteria.',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jost',
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: Get.height * .13,
                        crossAxisCount: 4,
                        // mainAxisSpacing: 17.h,
                        // crossAxisSpacing: 15.h,
                      ),
                      physics: BouncingScrollPhysics(),
                      itemCount: _categorysearchcontroller
                          .products.value.searchMainCat!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                submainCatId = _categorysearchcontroller
                                    .products.value.searchMainCat?[index].id!
                                    .toString();
                                _productbycatlistcontroller
                                    .ProductByCatId_apiHit(submainCatId);

                                Get.to(CategoryScreen(
                                    showAppBar: true,
                                    FromHomeToCat: true,
                                    selectedTabIndex: selectedTabIndex));
                              },
                              child: CircleAvatar(
                                radius: Get.width * 0.08,
                                backgroundImage: NetworkImage(
                                  "${_categorysearchcontroller.products.value.searchMainCat![index].imageUrl.toString()}",
                                ),
                              ),
                            ),
                            SizedBox(height: 5.v),
                            Text(
                              "${_categorysearchcontroller.products.value.searchMainCat![index].aCategoryName.toString().toString()}",
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
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: Get.height * .4,
                        crossAxisCount: 2,
                        // mainAxisSpacing: 2,
                        crossAxisSpacing: 10.h,
                      ),
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          _searchcontroller.products.value.products!.length,
                      itemBuilder: (context, index) {
                        final product =
                            _searchcontroller.products.value.products![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.only(left: 10),
                              //    width: 170.adaptSize,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  CustomImageView(
                                    onTap: () {
                                      mainCatId = _searchcontroller
                                          .products
                                          .value
                                          .products![index]
                                          .mainCategoryId!
                                          .toString();
                                      productId = _searchcontroller
                                          .products.value.products![index].id!
                                          .toString();
                                      productviewcontroller
                                          .Single_ProductApiHit(
                                              context, productId, mainCatId);
                                      Get.to(SingleProductView());
                                    },
                                    fit: BoxFit.cover,
                                    imagePath: "${product.imageUrl}",
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
                                        // onTap: () {
                                        //   Add_remove_productidd = homeView_controller
                                        //       .userList.value.recommendedProduct![index].id!
                                        //       .toString();
                                        //   EnglishAdd_remove_wishlistController()
                                        //       .AddRemoveWishlish_apihit();

                                        //   setState(() {
                                        //     isButtonTappedList[index] =
                                        //         !isButtonTappedList[index];
                                        //   });
                                        // },
                                        height: 20.adaptSize,
                                        width: 20.adaptSize,
                                        padding: EdgeInsets.all(5.h),
                                        decoration:
                                            IconButtonStyleHelper.fillWhiteA,
                                        alignment: Alignment.topRight,
                                        child: CustomImageView(
                                          imagePath: isButtonTappedList[index]
                                              ? ImageConstant
                                                  .imgGroup239531 // Change this to your tapped image
                                              : ImageConstant
                                                  .imgSearch, // Default image
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                  "${product.title.toString()}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${product.averageRating.toString()}",
                                              // "4.8",
                                              style:
                                                  theme.textTheme.labelMedium,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 3.h),
                                              child: CustomRatingBar(
                                                ignoreGestures: true,
                                                initialRating: product
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
                                                  "${product.price.toString()}",
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
                                        height: 30.adaptSize,
                                        width: 30.adaptSize,
                                        padding: EdgeInsets.all(6.h),
                                        child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgGroup239533,
                                          onTap: () {
                                            mainCatId = _searchcontroller
                                                .products
                                                .value
                                                .products![index]
                                                .mainCategoryId!
                                                .toString();
                                            productId = _searchcontroller
                                                .products
                                                .value
                                                .products![index]
                                                .id!
                                                .toString();
                                            productviewcontroller
                                                .Single_ProductApiHit(context,
                                                    productId, mainCatId);

                                            showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return _buildAddtocart(
                                                      context,
                                                      productId,
                                                      mainCatId);
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
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  //     ),
  //   ),
  // );
  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        searchHistory.add(query);
        searchController.clear(); // Clear the search field
      });
      _saveSearchHistory(); // Save the search history
      _searchFocusNode.unfocus(); // Remove focus from the search field
    }
  }

  /// Section Widget
  Widget _buildRecentSearchedRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "recent searched",
                  style: CustomTextStyles.titleMedium16,
                ),
              ),
              CustomImageView(
                onTap: () {
                  setState(() {
                    searchHistory.clear(); // Remove the search history entry
                  });
                },
                imagePath: ImageConstant.imgDelete1,
                height: 18.adaptSize,
                width: 18.adaptSize,
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.04),
          Wrap(
            runAlignment: WrapAlignment.center,
            runSpacing: 8.0,
            children: searchHistory.map((query) {
              return _buildSearchHistoryContainer(query);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHistoryContainer(String query) {
    return Expanded(
      child: Container(
          height: Get.height * .05,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromARGB(28, 158, 158, 158),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                query,
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8f959e),
                ),
              ),
            ),
          )),
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
                          colorId = null;
                          selectedSizeIndex.value = -1;
                          sizeid = null;
                          selectedcolorIndex.value = -1;
                          selectedModelIndex.value = -1;
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

                                                        if (color != null &&
                                                            size1 != null) {
                                                          print(sizeid);
                                                          pid =
                                                              productviewcontroller
                                                                  .userlist
                                                                  .value
                                                                  .productView
                                                                  ?.id
                                                                  .toString();
                                                          productColor = colorId
                                                              .toString();
                                                          // quantity = counter;
                                                          productSize =
                                                              sizeid.toString();
                                                          print(pid);
                                                          print(productColor);
                                                          print(productSize);

                                                          _productpricechangebyattributecontroller
                                                              .ProductPriceChangeByAttribute(
                                                                  context);
                                                        }

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
                                                    selectedSizeIndex.value =
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

                                                    // if (sizeid != null &&
                                                    //     colorId != null) {
                                                    //   print(sizeid);
                                                    //   pid =
                                                    //       productviewcontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .productView
                                                    //           ?.id
                                                    //           .toString();
                                                    //   productColor =
                                                    //       colorId.toString();
                                                    //   // quantity = counter;
                                                    //   productSize =
                                                    //       sizeid.toString();
                                                    //   print(pid);
                                                    //   print(productColor);
                                                    //   print(productSize);

                                                    //   _productpricechangebyattributecontroller
                                                    //       .ProductPriceChangeByAttribute(
                                                    //           context);
                                                    // }
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
                                                                border: selectedSizeIndex
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
                                                    selectedCapacityIndex
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

                                                    // if (sizeid != null &&
                                                    //     colorId != null) {
                                                    //   print(sizeid);
                                                    //   pid =
                                                    //       productviewcontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .productView
                                                    //           ?.id
                                                    //           .toString();
                                                    //   productColor =
                                                    //       colorId.toString();
                                                    //   // quantity = counter;
                                                    //   productSize =
                                                    //       sizeid.toString();
                                                    //   print(pid);
                                                    //   print(productColor);
                                                    //   print(productSize);

                                                    //   _productpricechangebyattributecontroller
                                                    //       .ProductPriceChangeByAttribute(
                                                    //           context);
                                                    //   updatedprice.value =
                                                    //       _productpricechangebyattributecontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .data!
                                                    //           .price
                                                    //           .toString();
                                                    // }
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
                                                                border: selectedCapacityIndex
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
                                                    selectedquantityIndex
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

                                                    // if (sizeid != null &&
                                                    //     colorId != null) {
                                                    //   print(sizeid);
                                                    //   pid =
                                                    //       productviewcontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .productView
                                                    //           ?.id
                                                    //           .toString();
                                                    //   productColor =
                                                    //       colorId.toString();
                                                    //   // quantity = counter;
                                                    //   productSize =
                                                    //       sizeid.toString();
                                                    //   print(pid);
                                                    //   print(productColor);
                                                    //   print(productSize);

                                                    //   _productpricechangebyattributecontroller
                                                    //       .ProductPriceChangeByAttribute(
                                                    //           context);
                                                    //   updatedprice.value =
                                                    //       _productpricechangebyattributecontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .data!
                                                    //           .price
                                                    //           .toString();
                                                    // }
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
                                                                border: selectedquantityIndex
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
                                                    selectedweightIndex.value =
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

                                                    // if (sizeid != null &&
                                                    //     colorId != null) {
                                                    //   print(sizeid);
                                                    //   pid =
                                                    //       productviewcontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .productView
                                                    //           ?.id
                                                    //           .toString();
                                                    //   productColor =
                                                    //       colorId.toString();
                                                    //   // quantity = counter;
                                                    //   productSize =
                                                    //       sizeid.toString();
                                                    //   print(pid);
                                                    //   print(productColor);
                                                    //   print(productSize);

                                                    //   _productpricechangebyattributecontroller
                                                    //       .ProductPriceChangeByAttribute(
                                                    //           context);
                                                    //   updatedprice.value =
                                                    //       _productpricechangebyattributecontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .data!
                                                    //           .price
                                                    //           .toString();
                                                    // }
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
                                                                border: selectedweightIndex
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
                                                      selectedModelIndex.value =
                                                          index;
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

                                                      // if (sizeid != null &&
                                                      //     colorId != null) {
                                                      //   print(sizeid);
                                                      //   pid =
                                                      //       productviewcontroller
                                                      //           .userlist
                                                      //           .value
                                                      //           .productView
                                                      //           ?.id
                                                      //           .toString();
                                                      //   productColor =
                                                      //       colorId.toString();
                                                      //   // quantity = counter;
                                                      //   productSize =
                                                      //       sizeid.toString();
                                                      //   print(pid);
                                                      //   print(productColor);
                                                      //   print(productSize);

                                                      //   _productpricechangebyattributecontroller
                                                      //       .ProductPriceChangeByAttribute(
                                                      //           context);
                                                      //   updatedprice.value =
                                                      //       _productpricechangebyattributecontroller
                                                      //           .userlist
                                                      //           .value
                                                      //           .data!
                                                      //           .price
                                                      //           .toString();
                                                      // }
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
                                                                  border: selectedModelIndex
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
                                                    selecteditemIndex.value =
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

                                                    // if (sizeid != null &&
                                                    //     colorId != null) {
                                                    //   print(sizeid);
                                                    //   pid =
                                                    //       productviewcontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .productView
                                                    //           ?.id
                                                    //           .toString();
                                                    //   productColor =
                                                    //       colorId.toString();
                                                    //   // quantity = counter;
                                                    //   productSize =
                                                    //       sizeid.toString();
                                                    //   print(pid);
                                                    //   print(productColor);
                                                    //   print(productSize);

                                                    //   _productpricechangebyattributecontroller
                                                    //       .ProductPriceChangeByAttribute(
                                                    //           context);
                                                    //   updatedprice.value =
                                                    //       _productpricechangebyattributecontroller
                                                    //           .userlist
                                                    //           .value
                                                    //           .data!
                                                    //           .price
                                                    //           .toString();
                                                    // }
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
                                                                border: selecteditemIndex
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
                        // if (productviewcontroller
                        //             .userlist.value.productView?.productType ==
                        //         "variable" &&
                        //     size1 != null &&
                        //     color != null)
                        //   Padding(
                        //     padding: EdgeInsets.only(left: 20),
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
                        //                       color: Colors.white,
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
                        //                         // int totalQuantity = int.tryParse(
                        //                         //         _productpricechangebyattributecontroller
                        //                         //             .totalQuantity
                        //                         //             .value) ??
                        //                         //     0;
                        //                         if (quantity > 1)
                        //                           setState(() {
                        //                             quantity--;
                        //                           });
                        //                         print(quantity);
                        //                       } else {
                        //                         Utils.snackBar(
                        //                             context,
                        //                             'Failed',
                        //                             'Please Select Color ');
                        //                       }
                        //                     },
                        //                     child: Icon(
                        //                       Icons.remove,
                        //                       color: Colors.black,
                        //                       size: 15,
                        //                     ),
                        //                   ),
                        //                   Center(
                        //                     child: Text(
                        //                       quantity.toString(),
                        //                       style: theme.textTheme.bodyMedium
                        //                           ?.copyWith(
                        //                               color: Color(0xffff8300),
                        //                               fontSize: 20),
                        //                     ),
                        //                   ),
                        //                   GestureDetector(
                        //                     onTap: () {
                        //                       if (colorId != null &&
                        //                           sizeid != null) {
                        //                         int totalQuantity = int.tryParse(
                        //                                 _productpricechangebyattributecontroller
                        //                                     .totalQuantity
                        //                                     .value) ??
                        //                             0;
                        //                         if (quantity < totalQuantity)
                        //                           setState(() {
                        //                             quantity++;
                        //                           });
                        //                         print(quantity);
                        //                       } else {
                        //                         Utils.snackBar(
                        //                             context,
                        //                             'Failed',
                        //                             'Please Select Color ');
                        //                       }
                        //                     },
                        //                     child: Icon(
                        //                       Icons.add,
                        //                       color: Colors.black,
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
                                      if (color != null && size1 != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please select the desired detail before adding to cart');
                                          }
                                        } else if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please select the desired detail before adding to cart');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller.userlist
                                                    .value.productView?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();

                                            EnglishAddtocartprice = pid != ''
                                                ? _productpricechangebyattributecontroller
                                                    .productPrice.value
                                                : productviewcontroller.userlist
                                                    .value.productView?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            EnglishAddtocartModelId =
                                                modelid.toString();
                                            EnglishAddtocartItem =
                                                itemid.toString();
                                            EnglishAddtocartWeight =
                                                weightid.toString();
                                            EnglishAddtocarQuantityy =
                                                quantityid.toString();
                                            EnglishAddtocarCapacity =
                                                capacityid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            selectedcolored.value = "";
                                            selectedcolorIndex.value = -1;
                                            colorId = null;
                                            selectedSizeIndex.value = -1;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                            quantity.value = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (size1 != null) {
                                        if (sizeid == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Size');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller.userlist
                                                    .value.productView?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice = pid != ''
                                                ? _productpricechangebyattributecontroller
                                                    .productPrice.value
                                                : productviewcontroller.userlist
                                                    .value.productView?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            EnglishAddtocartModelId =
                                                modelid.toString();
                                            EnglishAddtocartItem =
                                                itemid.toString();
                                            EnglishAddtocartWeight =
                                                weightid.toString();
                                            EnglishAddtocarQuantityy =
                                                quantityid.toString();
                                            EnglishAddtocarCapacity =
                                                capacityid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            selectedcolored.value = "";
                                            selectedcolorIndex.value = -1;
                                            colorId = null;
                                            selectedSizeIndex.value = -1;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                            quantity.value = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
                                      } else if (color != null) {
                                        if (colorId == null) {
                                          if (!inCart) {
                                            Utils.snackBar(context, 'Failed',
                                                'Please Select Color');
                                          }
                                        } else {
                                          if (!inCart) {
                                            Englishcartproductid =
                                                productviewcontroller.userlist
                                                    .value.productView?.id
                                                    .toString();
                                            EnglishAddtocartColor =
                                                colorId.toString();
                                            EnglishAddtocartprice = pid != ''
                                                ? _productpricechangebyattributecontroller
                                                    .productPrice.value
                                                : productviewcontroller.userlist
                                                    .value.productView?.price
                                                    .toString();
                                            EnglishAddtocartquantity =
                                                quantity.toString();
                                            EnglishAddtocartSize =
                                                sizeid.toString();
                                            EnglishAddtocartModelId =
                                                modelid.toString();
                                            EnglishAddtocartItem =
                                                itemid.toString();
                                            EnglishAddtocartWeight =
                                                weightid.toString();
                                            EnglishAddtocarQuantityy =
                                                quantityid.toString();
                                            EnglishAddtocarCapacity =
                                                capacityid.toString();
                                            AddToCartcontrollerin
                                                .addtocart_Apihit(context);
                                            color = null;
                                            size1 = null;
                                            selectedcolored.value = "";
                                            selectedcolorIndex.value = -1;
                                            colorId = null;
                                            selectedSizeIndex.value = -1;
                                            sizeid = null;
                                            selectedcolorIndex.value = -1;
                                            selectedSizeIndex.value = -1;
                                            quantity.value = 1;
                                            print(
                                                "${colorId},${sizeid},${quantity},");
                                          } else {
                                            Utils.snackBar(context, 'Failed',
                                                'Product is already in the cart');
                                          }
                                        }
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
                                        color = null;
                                        size1 = null;
                                        selectedcolored.value = "";
                                        selectedcolorIndex.value = -1;
                                        colorId = null;
                                        selectedSizeIndex.value = -1;
                                        sizeid = null;
                                        selectedcolorIndex.value = -1;
                                        selectedSizeIndex.value = -1;
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
}
