import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Welcome",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Choose language ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.chooseLanguageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign-up",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Verification Code",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.verificationCodeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home Page One - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homePageOneContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.searchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Single page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.singlePageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Reviews",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.reviewsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Review",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addReviewScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Shipping Addresses",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.shippingAddressesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Address",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addressScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add New Card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addNewCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Order Confirmed!",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.orderConfirmedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "My Orders Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myOrdersThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "My Orders - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myOrdersTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifications",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifications One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Spin the Wheel One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.spinTheWheelOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Membership",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.membershipScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Shop Profile I Item",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.shopProfileIItemScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Shop Profile I categories One",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.shopProfileICategoriesOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Shop Profile I categories",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.shopProfileICategoriesScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home Page - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homePageTabContainerScreen),
                        ),
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

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
