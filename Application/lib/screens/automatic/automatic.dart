import 'package:flutter/material.dart';
import 'animated_wave.dart';
import '../../template/appbar.dart';
import '../../template/colors.dart';

class Automatic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyDark,
      appBar: MyAppBar('آبیاری خودکار'),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedWave(),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'برای تغییر، آستانه را به بالا یا پایین بکشید',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontFamily: 'IranYekan',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'درصورتی که رطوبت خاک از این آستانه کمتر باشد،\nآبیاری به شکل خودکار انجام خواهد شد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                  fontFamily: 'IranYekan',
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
