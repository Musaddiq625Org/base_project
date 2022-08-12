import 'package:base_project/src/constants/app_constants.dart';
import 'package:base_project/src/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Widget widget;
  final bool extendBody;
  final Widget? appBar;
  final Widget? drawerWidget;
  final Widget? bottomNavigationBar;
  final bool removeSafeAreaPadding;
  final double appBarHeight;
  final Color bgColor;
  final String? bgImage;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const MainScaffold({
    Key? key,
    required this.widget,
    this.extendBody = false,
    this.drawerWidget,
    this.bottomNavigationBar,
    this.removeSafeAreaPadding = false,
    this.appBarHeight = AppConstants.appBarHeightSixty,
    this.bgColor = ColorConstants.white,
    this.resizeToAvoidBottomInset = false,
    this.bgImage,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: !removeSafeAreaPadding,
      left: !removeSafeAreaPadding,
      bottom: !removeSafeAreaPadding,
      top: !removeSafeAreaPadding,
      child: Container(
        decoration: bgImage != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImage!),
                  fit: BoxFit.cover,
                ),
              )
            : const BoxDecoration(),
        child: Scaffold(

          key: key,
          // extendBody: extendBody,
          backgroundColor:
              bgImage == null ? bgColor : ColorConstants.transparent,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          drawer: drawerWidget,
          body: widget,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          appBar: appBar != null
              ? PreferredSize(
                  preferredSize: const Size(
                    double.infinity,
                    kToolbarHeight,
                  ),
                  child: appBar!,
                )
              : null,
        ),
      ),
    );
  }
}
