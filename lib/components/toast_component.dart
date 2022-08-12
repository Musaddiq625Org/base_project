import 'package:base_project/src/constants/color_constants.dart';
import 'package:base_project/components/text_component.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastComponent {
  final BuildContext context;
  static late FToast _fToast;

  ToastComponent(this.context) {
    _fToast = FToast().init(context);
  }

  void removeQueuedToasts() {
    _fToast.removeQueuedCustomToasts();
  }

  void showToast(
    BuildContext context,
    String message, {
    bool makeToastPositionBottom = false,
    bool extendDurationTime = false,
  }) {
    final Widget toast = Padding(
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: makeToastPositionBottom ? 34 : 12,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.lightBlue,
        ),
        // width: MediaQuery.of(context).size.width * .9,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.info,
                  color: ColorConstants.white,
                ),
                SizedBox(width: 12),
              ],
            ),
            Flexible(
              child: TextComponent(
                message,
                maxLines: 3,
                style: const TextStyle(
                  color: ColorConstants.white,
                ),
                overFlow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: makeToastPositionBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      toastDuration: Duration(seconds: extendDurationTime ? 5 : 3),
    );
  }
}
