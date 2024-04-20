import 'package:flutter/material.dart';
import 'package:mohally/theme/theme_helper.dart';

class WomensHomeScreen extends StatefulWidget {
  const WomensHomeScreen({Key? key}) : super(key: key);

  @override
  State<WomensHomeScreen> createState() => _WomensHomeScreenState();
}

class _WomensHomeScreenState extends State<WomensHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                  child: Image.asset(
                'assets/images/no_product.png',
                color: Color(0xffff8300),
                width: 200,
                height: 200,
              )),
            ),
            Center(
              child: Text(
                "We're currently working behind the scenes",
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
