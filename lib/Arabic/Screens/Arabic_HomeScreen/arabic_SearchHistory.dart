import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_SearchScreen.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicSearchHistorySearchScreen extends StatefulWidget {
  const ArabicSearchHistorySearchScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ArabicSearchHistorySearchScreen> createState() =>
      _ArabicSearchHistorySearchScreenState();
}

class _ArabicSearchHistorySearchScreenState
    extends State<ArabicSearchHistorySearchScreen> {
  List<String> recentSearches = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.clear();
    _loadRecentSearches(); // Load recent searches from shared preferences
  }

  Future<void> _loadRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs.getStringList('arabicrecentSearches') ?? [];
    });
  }

  Future<void> _saveRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('arabicrecentSearches', recentSearches);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('يبحث'),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.055),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Stack(children: [
                  TextFormField(
                    onFieldSubmitted: (value) {
                      setState(() {
                        recentSearches.add(value);
                        _saveRecentSearches();
                      });
                      Get.to(ArabicSearchScreen(searchQuery: value));
                    },
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'فئة البحث',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 50.v,
                      ),
                      suffixIcon: Container(
                        padding: EdgeInsets.all(15.h),
                        margin: EdgeInsets.only(
                          right: 30.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 131, 0, 1),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(
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
                      fillColor: Color.fromRGBO(244, 244, 244, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.h),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.h),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.h),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      right: 270,
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
                      'بحثت مؤخرا',
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
                //         text: 'الرجال البلوز',
                //         height: Get.height * 0.045,
                //         width: Get.width * 0.35),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     _container(
                //         text: 'صداري الرجال',
                //         height: Get.height * 0.045,
                //         width: Get.width * 0.35),
                //   ],
                // ),

                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text(
                  'شعبية الآن',
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
                        text: 'ساعات نسائية ضد الماء',
                        height: Get.height * 0.045,
                        width: Get.width * 0.5),
                    SizedBox(
                      width: 10,
                    ),
                    _containerWithImage(
                        text: 'لرجال يشاهدون',
                        height: Get.height * 0.045,
                        width: Get.width * 0.35)
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                _containerWithImage(
                    text: 'احذية نسائية',
                    height: Get.height * 0.045,
                    width: Get.width * 0.35)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _container({double? height, double? width, required String text}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 16),
      )),
    );
  }

  Widget _buildRecentSearchChip(String query) {
    return InkWell(
      onTap: () {
        searchController.text = query;
        Get.to(ArabicSearchScreen(searchQuery: query));
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
}
