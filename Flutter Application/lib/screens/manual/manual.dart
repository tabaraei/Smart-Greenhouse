import 'package:flutter/material.dart';
import 'animated_button.dart';
import '../../template/appbar.dart';
import '../../template/colors.dart';

class Manual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyDark,
      appBar: MyAppBar('آبیاری دستی'),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'برای شروع آبیاری دستی کلیک کنید',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'IranYekan',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'سپس با کلیک مجدد عملیات آبیاری را متوقف نمائید',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                  fontFamily: 'IranYekan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
