// // custom_theme.dart

// import 'package:flutter/material.dart';

// class CustomTheme extends StatefulWidget {
//   final Widget child;

//   const CustomTheme({Key? key, required this.child}) : super(key: key);

//   @override
//   _CustomThemeState createState() => _CustomThemeState();

//   static _CustomThemeState of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<_CustomThemeInherited>()!.data;
//   }
// }

// class _CustomThemeState extends State<CustomTheme> {

//   late ThemeData _themeData;

//   void updateTheme(Locale locale) {
//     if (locale.languageCode == 'ar') {
//       _loadArabicFonts(); // Load Arabic fonts
//       // Add other Almarai specific styling
//     } else {
//       _loadEnglishFonts(); // Load English fonts
//       // Add other English specific styling
//     }

//     setState(() {});
//   }

//   void _loadArabicFonts() {
//     _themeData = ThemeData(
//       fontFamily: 'Almarai',
//       // Add other Arabic font styling
//     );
//   }

//   void _loadEnglishFonts() {
//     _themeData = ThemeData(
//       fontFamily: 'Inter',
//       // Add other English font styling
//     );
//   }
//  @override
//   void initState() {
//     super.initState();

//     // Initialize _themeData with a default theme
//     _themeData = ThemeData(
//       // Add your default theme properties here
//       fontFamily: 'Inter',
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return _CustomThemeInherited(
//       data: this,
//       child: Theme(
//         data: _themeData,
//         child: widget.child,
//       ),
//     );
//   }
// }

// class _CustomThemeInherited extends InheritedWidget {
//   final _CustomThemeState data;

//   _CustomThemeInherited({
//     Key? key,
//     required Widget child,
//     required this.data,
//   }) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) {
//     return false;
//   }
// }
