import 'package:flutter/material.dart';
import '../../template/colors.dart';
import '../../template/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(25)),
      child: Drawer(
        child: Container(
          color: drawerBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DrawerItem(
                image: 'assets/images/greenhouse.png',
                title: 'گلخانه هوشمند',
                onPressed: () => Navigator.pop(context),
              ),
              Divider(color: grey),
              DrawerItem(
                  image: 'assets/images/manual.png',
                  title: 'آبیاری دستی',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ManualRoute);
                  }),
              Divider(color: grey),
              DrawerItem(
                  image: 'assets/images/automatic.png',
                  title: 'آبیاری خودکار',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AutomaticRoute);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String image, title;
  final Function onPressed;
  DrawerItem({this.image, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        color: white,
        width: 40,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'IranYekan',
          fontSize: 20,
          color: white,
        ),
      ),
      onTap: onPressed,
    );
  }
}
