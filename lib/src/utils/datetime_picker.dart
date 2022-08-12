import 'package:base_project/src/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DateTimePicker {
  BuildContext context;

  final int? overrideMinYear;
  final int? overrideMaxYear;

  DateTimePicker(this.context, {this.overrideMinYear, this.overrideMaxYear});

  final minYear = DateTime.now().year - 16;
  final maxYear = DateTime.now().year + 100;

  Future<void> showCupertinoModal({
    DateTime? initialDateTime,
    required Function(DateTime?) onUpdatePressed,
    required Function() onCancelPressed,
  }) {
    DateTime? dateTime;
    void onDateTimeChanged(DateTime dt) {
      dateTime = dt;
    }

    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context_) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.35,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text(StringConstants.update),
                    onPressed: () {
                      onUpdatePressed(dateTime);
                      Navigator.of(context_).pop();
                    },
                  ),
                  CupertinoButton(
                    onPressed: onCancelPressed,
                    child: Text(StringConstants.cancel),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).copyWith().size.height * 0.25,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: onDateTimeChanged,
                  dateOrder: DatePickerDateOrder.dmy,
                  initialDateTime: initialDateTime ?? DateTime(minYear),
                  // minimumDate: DateTime(minYear),
                  minimumYear:
                      overrideMinYear != null ? overrideMaxYear! : minYear - 80,
                  maximumDate: overrideMaxYear != null
                      ? DateTime.now()
                      : DateTime(minYear, 12, 31),
                  maximumYear:
                      overrideMaxYear != null ? overrideMaxYear! : minYear,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
