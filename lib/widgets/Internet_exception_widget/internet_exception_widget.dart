import 'package:flutter/material.dart';
import 'package:mohally/theme/theme_helper.dart';

class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InterNetExceptionWidget({Key? key, required this.onPress})
      : super(key: key);

  @override
  State<InterNetExceptionWidget> createState() =>
      _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * .15,
          ),
          Image.asset(
            'assets/images/error2.png',
          ),
          Text(
            "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
            style: theme.textTheme.headlineMedium
                ?.copyWith(color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
          ),
          // SizedBox(
          //   height: height * .15,
          // ),
          // InkWell(
          //   onTap: widget.onPress,
          //   child: Container(
          //     height: 44,
          //     width: 160,
          //     decoration: BoxDecoration(
          //         color: Color(0xffFE8300),
          //         borderRadius: BorderRadius.circular(50)),
          //     child: Center(
          //         child: Text(
          //       'Retry',
          //       style: Theme.of(context)
          //           .textTheme
          //           .titleMedium!
          //           .copyWith(color: Colors.white),
          //     )),
          //   ),
          // )
        ],
      ),
    );
  }
}
