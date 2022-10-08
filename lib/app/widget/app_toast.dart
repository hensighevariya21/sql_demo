import 'package:bot_toast/bot_toast.dart';
import 'package:demolocaldatabase/app/widget/app_text.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:flutter/material.dart';

extension AppToast on String {
  showSnackbar(BuildContext context, {
    bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
        isError ? ColorConstant.appRed.withOpacity(0.6) : ColorConstant.appBlack.withOpacity(0.7),
        content: AppText(
          text: this,
          textStyle: Theme
              .of(context)
              .textTheme
              .headline1!
              .copyWith(
            fontSize: 14,
            color: ColorConstant.appWhite,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  showToast({bool isError = false}) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3),
      toastBuilder: (function) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 15,
            color: isError ? ColorConstant.appRed : ColorConstant.appGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              title: Container(
                margin: const EdgeInsets.only(top: 5),
                child: AppText(
                  text: this,
                  overflow: TextOverflow.ellipsis,
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: ColorConstant.appWhite,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
