import 'package:base_project/src/constants/color_constants.dart';
import 'package:base_project/src/constants/string_constants.dart';
import 'package:base_project/src/utils/logger_util.dart';
import 'package:base_project/src/utils/navigation_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static Future show(BuildContext context, {String? text}) async {
    const _forceFullyBackEnable = kDebugMode;
    await showDialog(
      context: context,
      barrierDismissible: _forceFullyBackEnable,
      builder: (_) => WillPopScope(
        onWillPop: () async => _forceFullyBackEnable,
        child: GestureDetector(
          onTap: () {
            if (_forceFullyBackEnable) {
              NavigationUtil.pop(context, previousScreen: '');
            }
          },
          child: Scaffold(
            backgroundColor: ColorConstants.lightGrey.withOpacity(.7),
            body: Center(
              child: SizedBox(
                width: 180,
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_forceFullyBackEnable)
                      Text(text ?? StringConstants.loading),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstants.black,
                      ),
                      backgroundColor: ColorConstants.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext context, {String? text}) {
    LoggerUtil.logs('popping from: $text');
    Navigator.of(context).pop();
  }
}
