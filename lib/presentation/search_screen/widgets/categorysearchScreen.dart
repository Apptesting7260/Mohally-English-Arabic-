import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/presentation/category_page/ProductByCategoryScreen/ProductByCategoryScreen.dart';
import 'package:mohally/presentation/home_page_one_page/EnglishAllContent/EnglishHomeScreen.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';
import 'package:mohally/view_models/controller/EnglishSearchController/EnglishCategorySearch.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

class CategorySearch extends StatefulWidget {
  CategorySearch({Key? key})
      : super(
          key: key,
        );

  @override
  State<CategorySearch> createState() => _CategorySearchState();
}

class _CategorySearchState extends State<CategorySearch> {
  ProductsByCatIdListControllerEnglish _productbycatlistcontroller =
      ProductsByCatIdListControllerEnglish();
  TextEditingController searchController = TextEditingController();
  EnglishCategorySearchController _searchcontroller =
      EnglishCategorySearchController();

  FocusNode _searchFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    // _loadSearchHistory();
    _searchcontroller.SearchCategory("");
    // _searchFocusNode = FocusNode();
  }

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
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  width: Get.width * .05,
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
          title: SizedBox(
            width: Get.width * .9,
            child: TextFormField(
              style: CustomTextStyles.bodyLargeOnError_1,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: CustomTextStyles.bodyLargeOnError_1,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 50.v,
                ),
                suffixIcon: Container(
                  padding: EdgeInsets.all(15.h),
                  margin: EdgeInsets.only(
                    left: 30.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(
                        55.h,
                      ),
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgSearchWhiteA70002,
                    height: 30.adaptSize,
                    width: 20.adaptSize,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 60.v,
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(
                  left: 16.h,
                  top: 17.v,
                  bottom: 17.v,
                ),
                fillColor: appTheme.gray100,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(
                    color: appTheme.gray300,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(
                    color: appTheme.gray300,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                  borderSide: BorderSide(
                    color: appTheme.gray300,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) {
                _searchcontroller.SearchCategory(value);
              },
            ),
          )),
      body: SafeArea(
        child: Obx(() {
          if (_searchcontroller.loading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_searchcontroller.error.value.isNotEmpty) {
            return Center(
              child: Text(_searchcontroller.error.value),
            );
          } else if (_searchcontroller.products.value.searchMainCat!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nosearch.png',
                  height: Get.height * .1,
                  width: Get.width * .3,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    'Ooops! We couldn\'t find any products that match your search criteria.',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Almarai',
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: ListView.builder(
                itemCount:
                    _searchcontroller.products.value.searchMainCat!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(_searchcontroller
                            .products.value.searchMainCat![index].aCategoryName
                            .toString()),
                        leading: GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38.0),
                            child: Image.network(
                              "${_searchcontroller.products.value.searchMainCat![index].imageUrl.toString()}",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            submainCatId = _searchcontroller
                                .products.value.searchMainCat![index].id
                                .toString();

                            _productbycatlistcontroller.ProductByCatId_apiHit(
                                submainCatId);
                            Get.to(ProductsByCategoryScreen());
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      )
                    ],
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }

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
                  fontFamily: 'Almarai',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8f959e),
                ),
              ),
            ),
          )),
    );
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
        text: "Search",
        margin: EdgeInsets.only(left: 16),
      ),
    );
  }
}
