
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_CategoryBynameController.dart';
import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/ArabicSubCategory/ArabicSubCategoryScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_SearchScreen.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/ArabicHomeScreen.dart';
import 'package:mohally/Arabic/Screens/widgets/arabic_customSearchView.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/Home_controller.dart/ArabicHomeController.dart';
import 'package:mohally/widgets/Internet_exception_widget/internet_exception_widget.dart';
import 'package:mohally/widgets/app_bar/appbar_title.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

int arabicselectedTabIndex = 0;

class CategoryScreen_arabic extends StatefulWidget {
  final bool showAppBar;
  final int arabicselectedTabIndex;
  final bool FromHomeToCat;

  const CategoryScreen_arabic(
      {Key? key,
      this.showAppBar = false,
      this.arabicselectedTabIndex = 0,
      this.FromHomeToCat = false})
      : super(key: key);
  @override
  State<CategoryScreen_arabic> createState() => _CategoryScreen_arabicState();
}

class _CategoryScreen_arabicState extends State<CategoryScreen_arabic> {
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

  @override
  void initState() {
    arabicselectedTabIndex = widget.FromHomeToCat
        ? widget.arabicselectedTabIndex
        : arabicselectedTabIndex;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      pagecontroller = PageController(initialPage: arabicselectedTabIndex);
      _categoryByName.CategoryByNameApiHit(arabiccategoryId);
      homeView_controller.homeview_apihit();
    });
    super.initState();
  }

  PageController pagecontroller = PageController();
  ArabiccategorybyNameController _categoryByName =
      ArabiccategorybyNameController();
  ArabicHomeView_controller homeView_controller = ArabicHomeView_controller();
  TextEditingController searchController = TextEditingController();

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
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: widget.showAppBar
                  ? AppBar(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 10),
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
                    )
                  : _buildAppBar(context),
              body: SafeArea(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Stack(children: [
                        CustomSearchView_arabic(
                          hintText: 'يبحث',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                          readOnly: true,
                          enableTap: true,
                        ),
                        Positioned(
                            top: 20,
                            right: 270,
                            child: GestureDetector(
                                onTap: () {
                                  _buildOncameraclick(context);
                                },
                                child: Image.asset(
                                    'assets/images/greycamera.png'))),
                      ]),
                    ),
                    SizedBox(
                      height: Get.height * .04,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "تسوق حسب الاقسام",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontFamily: 'Almarai'),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .04,
                    ),
                    Obx(
                      () => Container(
                        // color: Colors.greenAccent,
                        width: double.infinity,
                        height: widget.FromHomeToCat
                            ? Get.height * .7
                            : height * .69,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Container(
                                // color: const Color.fromARGB(36, 158, 158, 158),
                                width: Get.width * .3,
                                child: Column(
                                  children: [
                                    Container(
                                      // color: Color.fromARGB(255, 95, 35, 82),
                                      height: widget.FromHomeToCat
                                          ? Get.height * .7
                                          : Get.height * .67,
                                      child: ListView.builder(
                                        itemCount: homeView_controller.userList
                                            .value.categoryData!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                arabicselectedTabIndex = index;
                                                arabiccategoryId =
                                                    homeView_controller
                                                        .userList
                                                        .value
                                                        .categoryData?[index]
                                                        .id!
                                                        .toString();

                                                _categoryByName
                                                    .CategoryByNameApiHit(
                                                        arabiccategoryId);
                                                pagecontroller.animateToPage(
                                                    arabicselectedTabIndex,
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease);
                                              });
                                            },
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: Get.height * .08,
                                                    width: Get.width * .3,
                                                    color:
                                                        arabicselectedTabIndex ==
                                                                index
                                                            ? Colors.white
                                                            : Color.fromARGB(36,
                                                                158, 158, 158),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height:
                                                              Get.height * .08,
                                                          width:
                                                              Get.width * .02,
                                                          color:
                                                              arabicselectedTabIndex ==
                                                                      index
                                                                  ? Color(
                                                                      0xffFF8300)
                                                                  : null,
                                                        ),
                                                        Container(
                                                          width: 100,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 5),
                                                            child: Text(
                                                              "${homeView_controller.userList.value.categoryData?[index].categoryName.toString()}",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF272727),
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Almarai',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              maxLines: 3,
                                                              textAlign:
                                                                  TextAlign
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
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Container(
                                  child: PageView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: pagecontroller,
                                    itemCount: homeView_controller
                                        .userList.value.categoryData!.length,
                                    onPageChanged: (index) {
                                      setState(() {
                                        widget.FromHomeToCat
                                            ? arabicselectedTabIndex
                                            : arabicselectedTabIndex = index;
                                        _categoryByName.CategoryByNameApiHit(
                                            arabiccategoryId);
                                      });
                                    },
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Center(
                                          child: SubCategoryScreen(),
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
            ),
          );
      }
    });
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "فئات",
        margin: EdgeInsets.only(top: 10, right: 20),
      ),
    );
  }

  Widget buildGridView(String category) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 70,
                width: 70,
                child: Image.asset(
                  "assets/images/img_mask_group_60x56.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 2.v),
            Center(
                child: Text(
              "للنساءملابس\n منحنى",
              style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'Almarai'),
            ))
          ],
        );
      },
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
                                  return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: AlertDialog(
                                      backgroundColor: Color(0xFFFF8300),
                                      title: Text(
                                        "يختار",
                                        style: TextStyle(
                                            fontFamily: 'Almarai',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      content: Row(
                                        children: [
                                          GestureDetector(
                                            child: Text(
                                              "آلة تصوير",
                                              style: TextStyle(
                                                  fontFamily: 'Almarai',
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            onTap: () {
                                              openCameraa(ImageSource.camera);
                                            },
                                          ),
                                          SizedBox(width: 80),
                                          GestureDetector(
                                            child: Text("صالة عرض",
                                                style: TextStyle(
                                                    fontFamily: 'Almarai',
                                                    color: Colors.white,
                                                    fontSize: 16)),
                                            onTap: () {
                                              openCameraa(ImageSource.gallery);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "تصوير",
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontFamily: 'Almarai'),
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
                          "اختر من الألبوم",
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontFamily: 'Almarai'),
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
                            Get.to(ArabicSearchScreen());
                          },
                          child: Text(
                            "سجل البحث",
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontFamily: 'Almarai'),
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
                      "يلغي",
                      style: TextStyle(
                        color: Color(0xFFFF8300),
                        fontSize: 16,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
