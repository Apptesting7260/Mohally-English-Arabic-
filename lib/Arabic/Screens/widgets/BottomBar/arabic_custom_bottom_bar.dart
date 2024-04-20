import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class CustomBottomBar_arabic extends StatefulWidget {
  int bottomSelectedIndex;
  final Function bottomTapped;
  CustomBottomBar_arabic(
      {this.onChanged,
      required this.bottomSelectedIndex,
      required this.bottomTapped});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBar_arabicState createState() => CustomBottomBar_arabicState();
}

class CustomBottomBar_arabicState extends State<CustomBottomBar_arabic> {
  // int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome2,
      title: "بيت",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavCategory,
      activeIcon: ImageConstant.imgNavCategory2,
      title: "فئة",
      type: BottomBarEnum.Category,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavWishlist,
      activeIcon: ImageConstant.imgNavWishlist2,
      title: "قائمة الرغبات",
      type: BottomBarEnum.Wishlist,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavCart,
      activeIcon: ImageConstant.imgNavCart2,
      title: "عربة التسوق",
      type: BottomBarEnum.Cart,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile2,
      title: "حساب تعريفي",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 80.v,
        decoration: BoxDecoration(
          color: appTheme.whiteA70002,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.h),
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.lime9000c,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(
                0,
                -8,
              ),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: widget.bottomSelectedIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: widget.bottomSelectedIndex == index
                        ? theme.colorScheme.primary
                        : appTheme.gray50001,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: appTheme.gray50001,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    color: theme.colorScheme.primary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: CustomTextStyles
                          .labelMediumLeagueSpartanPrimarySemiBold
                          .copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          // onTap: (index) => widget.bottomTapped(index),
          onTap: (index) {
            widget.bottomSelectedIndex = index;
            widget.bottomTapped(index);
            widget.onChanged?.call(bottomMenuList[index].type);
            setState(() {});
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Category,
  Wishlist,
  Cart,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
