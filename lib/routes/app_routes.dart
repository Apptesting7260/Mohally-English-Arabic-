import 'package:flutter/material.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/presentation/welcome_screen/welcome_screen.dart';
import 'package:mohally/presentation/choose_language_screen/choose_language_screen.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/presentation/home_page_one_container_screen/home_page_one_container_screen.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
import 'package:mohally/presentation/add_review_screen/add_review_screen.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/address_screen/address_screen.dart';
import 'package:mohally/presentation/payment_screen/payment_screen.dart';
import 'package:mohally/presentation/add_new_card_screen/add_new_card_screen.dart';
import 'package:mohally/presentation/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:mohally/presentation/my_orders_three_screen/my_orders_three_screen.dart';
import 'package:mohally/presentation/my_orders_tab_container_screen/my_orders_tab_container_screen.dart';
import 'package:mohally/presentation/notifications_one_screen/notifications_one_screen.dart';
import 'package:mohally/presentation/spin_the_wheel_one_screen/spin_the_wheel_one_screen.dart';
import 'package:mohally/presentation/membership_screen/membership_screen.dart';
import 'package:mohally/presentation/shop_profile_i_item_screen/shop_profile_i_item_screen.dart';
import 'package:mohally/presentation/shop_profile_i_categories_one_screen/shop_profile_i_categories_one_screen.dart';
import 'package:mohally/presentation/shop_profile_i_categories_screen/shop_profile_i_categories_screen.dart';
import 'package:mohally/presentation/home_page_tab_container_screen/home_page_tab_container_screen.dart';
import 'package:mohally/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String chooseLanguageScreen = '/choose_language_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String verificationCodeScreen = '/verification_code_screen';

  static const String homePageOnePage = '/home_page_one_page';

  static const String homePageOneTabContainerPage =
      '/home_page_one_tab_container_page';

  static const String arabichomePageOneTabContainerPage =
      '/arabic_home_page_one_tab_container_page';

  static const String homePageOneContainerScreen =
      '/home_page_one_container_screen';

  static const String searchScreen = '/search_screen';

  static const String wishlistPage = '/wishlist_page';

  static const String categoryPage = '/category_page';

  static const String cartPage = '/cart_page';

  static const String singlePageScreen = '/single_page_screen';

  static const String reviewsScreen = '/reviews_screen';

  static const String addReviewScreen = '/add_review_screen';

  static const String shippingAddressesScreen = '/shipping_addresses_screen';

  static const String addressScreen = '/address_screen';

  static const String paymentScreen = '/payment_screen';

  static const String addNewCardScreen = '/add_new_card_screen';

  static const String orderConfirmedScreen = '/order_confirmed_screen';

  static const String myProfilePage = '/my_profile_page';

  static const String myOrdersThreeScreen = '/my_orders_three_screen';

  static const String myOrdersPage = '/my_orders_page';

  static const String myOrdersTabContainerScreen =
      '/my_orders_tab_container_screen';

  static const String myOrdersOnePage = '/my_orders_one_page';

  static const String myOrdersTwoPage = '/my_orders_two_page';

  static const String notificationsScreen = '/notifications_screen';

  static const String notificationsOneScreen = '/notifications_one_screen';

  static const String spinTheWheelOneScreen = '/spin_the_wheel_one_screen';

  static const String membershipScreen = '/membership_screen';

  static const String shopProfileIItemScreen = '/shop_profile_i_item_screen';

  static const String shopProfileICategoriesOneScreen =
      '/shop_profile_i_categories_one_screen';

  static const String shopProfileICategoriesScreen =
      '/shop_profile_i_categories_screen';

  static const String homePage = '/home_page';

  static const String homePageTabContainerScreen =
      '/home_page_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    chooseLanguageScreen: (context) => ChooseLanguageScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    verificationCodeScreen: (context) => VerificationCodeScreen(
          emailText: "",
          controller: TextEditingController(),
          pinPutFocusNode: FocusNode(),
        ),
    homePageOneContainerScreen: (context) => HomePageOneContainerScreen(),
    searchScreen: (context) => SearchScreen(),
    singlePageScreen: (context) => SingleProductView(),
    reviewsScreen: (context) => ReviewsScreen(),
    addReviewScreen: (context) => AddReviewScreen(),
    shippingAddressesScreen: (context) => ShippingAddress(),
    addressScreen: (context) => AddressScreen(),
    paymentScreen: (context) => PaymentScreen(),
    addNewCardScreen: (context) => AddNewCardScreen(),
    orderConfirmedScreen: (context) => OrderConfirmedScreen(),
    myOrdersThreeScreen: (context) => MyOrdersThreeScreen(),
    myOrdersTabContainerScreen: (context) => MyOrdersTabContainerScreen(),
    notificationsScreen: (context) => NotificationsOneScreen(),
    notificationsOneScreen: (context) => NotificationsOneScreen(),
    spinTheWheelOneScreen: (context) => SpinTheWheelOneScreen(),
    membershipScreen: (context) => MembershipScreen(),
    shopProfileIItemScreen: (context) => ShopProfileIItemScreen(),
    shopProfileICategoriesOneScreen: (context) =>
        ShopProfileICategoriesOneScreen(),
    shopProfileICategoriesScreen: (context) => ShopProfileICategoriesScreen(),
    homePageTabContainerScreen: (context) => HomePageTabContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
