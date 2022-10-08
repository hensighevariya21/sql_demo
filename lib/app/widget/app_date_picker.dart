import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:flutter/material.dart';

class AppDatePicker {
  static Future<DateTime?>? selectDate(BuildContext context, DateTime? selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950, 1),
      lastDate: DateTime.now(),
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorConstant.appBlue,
              onSurface: ColorConstant.appGrey,
            ),
            dialogBackgroundColor: ColorConstant.appWhite,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate = picked;
      return picked;
    }
    return null;
  }
}
