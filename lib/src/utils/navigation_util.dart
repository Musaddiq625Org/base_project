import 'package:base_project/src/app_cubit/app_cubit.dart';
import 'package:base_project/src/utils/logger_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationUtil {
  static Future<dynamic> push(
    BuildContext context,
    String routeName, {
    dynamic args,
  }) {
    LoggerUtil.logs('push to $routeName');
    return Navigator.pushNamed(
      context,
      routeName,
      arguments: args,
    );
  }

  static Future<dynamic> pushReplace(
    BuildContext context,
    String routeName, {
    required String previousScreen,
    dynamic args,
  }) {
    LoggerUtil.logs('previousScreen: $previousScreen');
    LoggerUtil.logs('goNamed(replace) to $routeName');

    return Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: args,
    );
  }

  static void pop(
    BuildContext context, {
    dynamic args,
    required String previousScreen,
  }) {
    LoggerUtil.logs('pop from $previousScreen');
    return Navigator.pop(context);
  }

  static Future<dynamic> popAllAndPush(
    BuildContext context,
    String routeName, {
    required String previousScreen,
    dynamic args,
  }) {
    LoggerUtil.logs('previousScreen: $previousScreen');
    LoggerUtil.logs('popAllAndPush to $routeName');
    return Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (Route route) => false,
      arguments: args,
    );
  }
}
