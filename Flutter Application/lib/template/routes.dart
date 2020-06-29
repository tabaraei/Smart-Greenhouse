import 'package:flutter/material.dart';
import '../screens/home/home.dart';
import '../screens/manual/manual.dart';
import '../screens/automatic/automatic.dart';

const HomeRoute = '/';
const ManualRoute = '/manual';
const AutomaticRoute = '/automatic';

navigate(settings) {
  Widget screen;
  switch (settings.name) {
    case HomeRoute:
      screen = Home();
      break;
    case ManualRoute:
      screen = Manual();
      break;
    case AutomaticRoute:
      screen = Automatic();
      break;
    default:
      return null;
  }

  return MaterialPageRoute(builder: (BuildContext context) => screen);
}
