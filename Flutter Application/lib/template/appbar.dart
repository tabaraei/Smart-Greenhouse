import 'package:flutter/material.dart';
import 'colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        margin: EdgeInsets.only(top: 5),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'IranYekan',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: greyLight,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
