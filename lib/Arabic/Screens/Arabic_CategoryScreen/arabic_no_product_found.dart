import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';

class NoProductFound02 extends StatefulWidget {
  const NoProductFound02({Key? key}) : super(key: key);

  @override
  State<NoProductFound02> createState() => _NoProductFound02State();
}

class _NoProductFound02State extends State<NoProductFound02> {
  late Future<void> _refreshFuture;

  @override
  void initState() {
    super.initState();
    _refreshFuture = refreshData();
  }

  // Function to handle refreshing
  Future<void> refreshData() async {
    try {
      // Put your refresh logic here, for example, fetching new data
      // For now, let's just simulate fetching data by delaying for 1 second
      await Future.delayed(Duration(seconds: 1));
      // You can also reset any state variables or UI elements here
    } catch (e) {
      // Show error dialog if fetching data fails
      showErrorDialog(e.toString());
    }
  }

  // Function to show error dialog
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(context),
        // Wrap body with RefreshIndicator
        body: RefreshIndicator(
          // Set onRefresh callback to the function we defined earlier
          onRefresh: () {
            setState(() {
              _refreshFuture = refreshData();
            });
            return _refreshFuture;
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/no_product.png',
                      color: Color(0xffff8300),
                      width: Get.width * .7,
                    ),
                  ),
                  Center(
                    child: Text(
                      "غير معثور عليه",
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      // title: AppbarSubtitle(
      //   text: "Order Confirmed",
      //   margin: EdgeInsets.only(left: 16.h),
      // ),
    );
  }
}
