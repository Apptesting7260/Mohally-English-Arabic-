import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryScreen extends StatefulWidget {
  const SearchHistoryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SearchHistoryScreen> createState() => _SearchHistoryScreenState();
}

class _SearchHistoryScreenState extends State<SearchHistoryScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> recentSearches = [];
  @override
  void initState() {
    super.initState();
    searchController.clear();
    _loadRecentSearches(); // Load recent searches from shared preferences
  }

  Future<void> _loadRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs.getStringList('recentSearches') ?? [];
    });
  }

  Future<void> _saveRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recentSearches', recentSearches);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 60,
          leading: CustomIconButton(
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
          title: AppbarSubtitle(
            text: "Search",
            margin: EdgeInsets.only(left: 16),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              Stack(children: [
                SizedBox(
                    width: Get.width * .9,
                    child: TextFormField(
                      controller: searchController,
                      // focusNode: widget.focusNode ?? FocusNode(),
                      // autofocus: widget.autofocus!,
                      style: CustomTextStyles.bodyLargeOnError_1,
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

                      onFieldSubmitted: (value) {
                        setState(() {
                          recentSearches.add(value);
                          _saveRecentSearches();
                        });
                        Get.to(SearchScreen(searchQuery: value));
                      },
                    )),
                Positioned(
                    top: 20,
                    left: 270,
                    child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/images/greycamera.png'))),
              ]),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'recently searched',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          recentSearches.clear();
                        });
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.orange,
                      ))
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Wrap(
                children: recentSearches
                    .map((query) => _buildRecentSearchChip(query))
                    .toList(),
              ),
              // Row(
              //   children: [
              //     _container(
              //         text:'mens jumpers',
              //         height: Get.height * 0.045,
              //         width: Get.width * 0.35),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     _container(
              //         text: 'sweatshirt men',
              //         height: Get.height * 0.045,
              //         width: Get.width * 0.35),
              //   ],
              // ),
              // SizedBox(
              //   height: Get.height * 0.015,
              // ),
              // _container(
              //     text: 'men hoodies winter',
              //     height: Get.height * 0.045,
              //     ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                'Popular Right Now',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                children: [
                  _containerWithImage(
                      text: 'Men watch',
                      height: Get.height * 0.045,
                      width: Get.width * 0.3),
                  SizedBox(
                    width: 10,
                  ),
                  _containerWithImage(
                      text: 'Women watches waterproof',
                      height: Get.height * 0.045,
                      width: Get.width * 0.50)
                ],
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              _containerWithImage(
                  text: 'Womens Shoes',
                  height: Get.height * 0.045,
                  width: Get.width * 0.35)
            ],
          ),
        ),
      ),
    );
  }

  Widget _container({double? height, required String text}) {
    return Container(
      height: height,
      margin: EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(244, 244, 244, 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _containerWithImage(
      {double? height, double? width, required String text}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset('assets/images/Vector.png')
        ],
      ),
    );
  }

  Widget _buildRecentSearchChip(String query) {
    return InkWell(
      onTap: () {
        searchController.text = query;
        Get.to(SearchScreen(searchQuery: query));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: IntrinsicWidth(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(244, 244, 244, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    query,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        recentSearches.remove(query);
                      });
                    },
                    child: Icon(
                      Icons.close,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
