// ignore_for_file: unused_import
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_mensclothing.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_data_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_onMenscategoryTap.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/core/utils/size_utils.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/FilterationScreen/FilterScreen.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/CategoryProducts.dart';
import 'package:mohally/presentation/category_page/MainCategories/widgets/AllProductView.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/presentation/search_screen/widgets/categorysearchScreen.dart';
import 'package:mohally/theme/app_decoration.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishCategoriesByNameController.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishCategorySearch.dart';
import 'package:mohally/view_models/controller/Home_controller_English/HomeControllerEnglish.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:mohally/widgets/custom_search_view.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

///commented from here because it give issue in scroll controller. I declare it below
//int selectedTabIndex = 0;

class CategoryScreen extends StatefulWidget {
  // final int initialPage;
  final bool showAppBar;
  int selectedTabIndex;
  final bool FromHomeToCat;

  CategoryScreen(
      {Key? key,
      this.showAppBar = false,
      this.selectedTabIndex = 0,
      this.FromHomeToCat = false})
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // EnglishCategorySearchController _searchcontroller =
  //     EnglishCategorySearchController();
  CategoriesByNameControllerEnglish _categoryByName =
      CategoriesByNameControllerEnglish();

  HomeView_controller_English homeView_controller =
      HomeView_controller_English();
  File imgFile = File("");

  final imgPicker = ImagePicker();

  /// scroll controller added
  ScrollController scrollController = ScrollController();
  int selectedTabIndex = 0;

  ///

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

  // int selectedIndex = 0;

  @override
  void initState() {
    selectedTabIndex =
        widget.FromHomeToCat ? widget.selectedTabIndex : selectedTabIndex;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      pagecontroller = PageController(initialPage: selectedTabIndex);
      _categoryByName.CategoryByNameApiHit(categoryId);
      homeView_controller.homeview_apihit();
    });
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  PageController pagecontroller = PageController();

  @override
  void dispose() {
    pagecontroller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  // int pagesCount = homeView_controller.userList.value.categoryData!.length;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Obx(() {
      switch (homeView_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        case Status.ERROR:
          if (homeView_controller.error.value == 'No internet') {
            return InterNetExceptionWidget(onPress: () {});
          } else {
            return GeneralExceptionWidget(onPress: () {});
          }
        case Status.COMPLETED:

          /// scroll controller for automatic scroll
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            double offset = (widget.FromHomeToCat
                    ? widget.selectedTabIndex
                    : selectedTabIndex) *
                Get.height *
                0.08;
            scrollController.animateTo(offset,
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
          });

          ///

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: widget.showAppBar
                ? CustomAppBar(
                    leadingWidth: 40,
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
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
                        SizedBox(
                          width: Get.width * .67,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/images/filter.png',
                              height: Get.height * .09,
                              width: Get.width * .09,
                            )),
                      ],
                    ),
                  )
                : _buildAppBar(context),
            body: SafeArea(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          // SizedBox(
                          //     width: Get.width * .9,
                          //     child: TextFormField(
                          //       controller: searchController,
                          //       // focusNode: widget.focusNode ?? FocusNode(),
                          //       // autofocus: widget.autofocus!,
                          //       style: CustomTextStyles.bodyLargeOnError_1,
                          //       decoration: InputDecoration(
                          //         hintText: "Search",
                          //         hintStyle:
                          //             CustomTextStyles.bodyLargeOnError_1,
                          //         prefixIcon: Padding(
                          //           padding: EdgeInsets.all(
                          //             15.h,
                          //           ),
                          //           child: Icon(
                          //             Icons.search,
                          //             color: Colors.grey.shade600,
                          //           ),
                          //         ),
                          //         prefixIconConstraints: BoxConstraints(
                          //           maxHeight: 50.v,
                          //         ),
                          //         suffixIcon: Container(
                          //           padding: EdgeInsets.all(15.h),
                          //           margin: EdgeInsets.only(
                          //             left: 30.h,
                          //           ),
                          //           decoration: BoxDecoration(
                          //             color: theme.colorScheme.primary,
                          //             borderRadius: BorderRadius.horizontal(
                          //               right: Radius.circular(
                          //                 55.h,
                          //               ),
                          //             ),
                          //           ),
                          //           child: CustomImageView(
                          //             imagePath:
                          //                 ImageConstant.imgSearchWhiteA70002,
                          //             height: 30.adaptSize,
                          //             width: 20.adaptSize,
                          //           ),
                          //         ),
                          //         suffixIconConstraints: BoxConstraints(
                          //           maxHeight: 60.v,
                          //         ),
                          //         isDense: true,
                          //         contentPadding: EdgeInsets.only(
                          //           left: 16.h,
                          //           top: 17.v,
                          //           bottom: 17.v,
                          //         ),
                          //         fillColor: appTheme.gray100,
                          //         filled: true,
                          //         border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(30.h),
                          //           borderSide: BorderSide(
                          //             color: appTheme.gray300,
                          //             width: 1,
                          //           ),
                          //         ),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(30.h),
                          //           borderSide: BorderSide(
                          //             color: appTheme.gray300,
                          //             width: 1,
                          //           ),
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(30.h),
                          //           borderSide: BorderSide(
                          //             color: appTheme.gray300,
                          //             width: 1,
                          //           ),
                          //         ),
                          //       ),

                          //       onFieldSubmitted: (value) {
                          //         Get.to(SearchScreen(searchQuery: value));
                          //       },
                          //     )),
                          CustomSearchView(
                            hintText: "Search",
                            enableTap: true,
                            readOnly: true,
                          ),
                          Positioned(
                              top: 20,
                              left: 240,
                              child: GestureDetector(
                                  onTap: () {
                                    _buildOncameraclick(context);
                                  },
                                  child: Image.asset(
                                      'assets/images/greycamera.png'))),
                        ],
                      ),
                    ),
                  ),
                  Gap(15),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Shop By Category",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      height:
                          widget.FromHomeToCat ? Get.height * .8 : height * .72,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            Container(
                              // color: const Color.fromARGB(36, 158, 158, 158),
                              // width: 120,
                              width: Get.width * 0.34,
                              child: Column(
                                children: [
                                  Container(
                                    height: widget.FromHomeToCat
                                        ? Get.height * .75
                                        : Get.height * .65,
                                    child: ListView.builder(
                                      controller: scrollController,
                                      itemCount: homeView_controller
                                          .userList.value.categoryData!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              //selectedTabIndex = index;
                                              widget.selectedTabIndex = index;
                                              categoryId = homeView_controller
                                                  .userList
                                                  .value
                                                  .categoryData?[index]
                                                  .id!
                                                  .toString();

                                              _categoryByName
                                                  .CategoryByNameApiHit(
                                                      categoryId);
                                              pagecontroller.animateToPage(
                                                  //selectedTabIndex,
                                                  widget.selectedTabIndex,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease);
                                            });
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  // height: 60,
                                                  // width: 120,
                                                  height: Get.height * 0.08,
                                                  width: Get.width * 0.34,
                                                  color:
                                                      // selectedTabIndex ==
                                                      //         index
                                                      widget.selectedTabIndex ==
                                                              index
                                                          ? Colors.white
                                                          : Color.fromARGB(36,
                                                              158, 158, 158),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        // height: 60,
                                                        height:
                                                            Get.height * 0.08,
                                                        width: 4,
                                                        color:
                                                            // selectedTabIndex ==
                                                            //         index
                                                            widget.selectedTabIndex ==
                                                                    index
                                                                ? Color(
                                                                    0xffFF8300)
                                                                : null,
                                                      ),
                                                      Container(
                                                        // width: 100,
                                                        width: Get.width * 0.28,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5),
                                                          child: Text(
                                                            "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                                            style: TextStyle(
                                                              color:
                                                                  // selectedTabIndex ==
                                                                  //         index
                                                                  widget.selectedTabIndex ==
                                                                          index
                                                                      ? Colors
                                                                          .orange
                                                                      : Color(
                                                                          0xFF272727),
                                                              fontSize:
                                                                  index == 0
                                                                      ? 15
                                                                      : 12,
                                                              fontFamily:
                                                                  'Jost',
                                                              fontWeight: index ==
                                                                      0
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .w500,
                                                            ),
                                                            maxLines: 3,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(
                                  // bottom: 50,
                                  bottom: Get.height * 0.067),
                              child: Container(
                                child:
                                    // PageView(
                                    //   physics: NeverScrollableScrollPhysics(),
                                    //   controller: pagecontroller,
                                    //   onPageChanged: (index) {
                                    //     categoryId = homeView_controller
                                    //         .userList.value.categoryData?[index].id!
                                    //         .toString();

                                    //     // setState(() {
                                    //     //   widget.FromHomeToCat
                                    //     //       ? selectedTabIndex
                                    //     //       : selectedTabIndex = index;
                                    //     //   _categoryByName.CategoryByNameApiHit(
                                    //     //       categoryId);
                                    //     // });
                                    //     setState(() {
                                    //       widget.FromHomeToCat
                                    //           ? selectedTabIndex
                                    //           : selectedTabIndex = index;
                                    //       _categoryByName.CategoryByNameApiHit(
                                    //           categoryId);
                                    //       // Rebuild the PageView
                                    //       pagecontroller = PageController(
                                    //           initialPage: selectedTabIndex);
                                    //     });
                                    //   },
                                    //   children: [
                                    //     Container(
                                    //       child: Center(
                                    //           child: FeaturedCategoryScreen()),
                                    //     ),
                                    //   ],
                                    // ),
                                    PageView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: pagecontroller,
                                  itemCount: homeView_controller
                                      .userList.value.categoryData!.length,
                                  onPageChanged: (index) {
                                    // categoryId = homeView_controller
                                    //     .userList.value.categoryData?[index].id!
                                    //     .toString();

                                    setState(() {
                                      // widget.FromHomeToCat
                                      //     ? selectedTabIndex
                                      //     : selectedTabIndex = index;
                                      widget.FromHomeToCat
                                          ? widget.selectedTabIndex
                                          : selectedTabIndex = index;
                                      _categoryByName.CategoryByNameApiHit(
                                          categoryId);
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Center(
                                        child: CategoryproductsScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ))
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
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40,
      title: Row(
        children: [
          AppbarSubtitle(
            text: "Categories",
            margin: EdgeInsets.only(left: 16),
          ),
          SizedBox(
            width: Get.width * .55,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(FilterScreen());
                },
                child: Image.asset(
                  'assets/images/filter.png',
                  height: Get.height * .09,
                  width: Get.width * .09,
                ),
              )),
        ],
      ),
    );
  }

  Future _buildOncameraclick(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 17.v),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL30,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMaskGroup24x24,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 20.h),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: 17.v),
                  Divider(thickness: 0.5, color: Colors.grey),
                  SizedBox(height: 15.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/blackcamera.png",
                        height: 18.adaptSize,
                        width: 18.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 3.v,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xFFFF8300),
                                    title: Text(
                                      "Choose",
                                      style: TextStyle(
                                          fontFamily: 'Jost',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    content: Row(
                                      children: [
                                        GestureDetector(
                                          child: Text(
                                            "Camera",
                                            style: TextStyle(
                                                fontFamily: 'Jost',
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          onTap: () {
                                            openCameraa(ImageSource.camera);
                                          },
                                        ),
                                        SizedBox(width: 80),
                                        GestureDetector(
                                          child: Text("Gallery",
                                              style: TextStyle(
                                                  fontFamily: 'Jost',
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          onTap: () {
                                            openCameraa(ImageSource.gallery);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "Take photo",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 19.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/blackvideo.png",
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "Select from album",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: "assets/images/clock.png",
                        height: 18.adaptSize,
                        width: 18.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 3.v,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(SearchScreen());
                          },
                          child: Text(
                            "Search history",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.v),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: CustomTextStyles.titleMediumPrimaryMedium,
                    ),
                  ),
                ],
              ));
        });
  }
}
