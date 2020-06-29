import 'package:flutter/material.dart';
import '../../../template/colors.dart';

class Box extends StatelessWidget {
  final String title, value;
  Box({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greyLight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IranYekan',
              fontWeight: FontWeight.bold,
              fontSize: 44,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'IranYekan',
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
