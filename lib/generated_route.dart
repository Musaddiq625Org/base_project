import 'package:base_project/src/constants/route_constants.dart';
import 'package:base_project/src/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  _materialRoute(Widget widget) =>
      MaterialPageRoute(builder: (context) => widget);
  switch (settings.name) {
    case RouteConstants.splashScreen:
      return _materialRoute(const SplashScreen());

    default:
      return _materialRoute(const SplashScreen());
  }
}
