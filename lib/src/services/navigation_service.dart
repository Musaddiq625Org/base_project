import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey getKey() {
    return navigatorKey;
  }

  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  // Future<void> popAllAndPush(BuildContext context, String routeName,
  //     {args}) async {
  //   navigatorKey.currentState?.pushNamedAndRemoveUntil(
  //       routeName, navigatorKey.currentContext!, (Route route) => false,
  //       arguments: args);
  // }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
