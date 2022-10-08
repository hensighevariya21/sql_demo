import 'package:demolocaldatabase/app/widget/app_text.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final double? height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final double fontSize;
  final double borderRadius;
  final String? text;
  final Color fontColor;
  final Color buttonColor;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const AppElevatedButton({
    Key? key,
    this.height,
    this.width = double.infinity,
    this.margin,
    this.fontSize = 15,
    this.borderRadius = 5,
    this.text,
    this.fontColor = ColorConstant.appWhite,
    this.buttonColor = ColorConstant.appGreen,
    this.onPressed,
    this.fontWeight,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)))),
        child: AppText(
          text: text,
          textAlign: TextAlign.center,
          textStyle: Theme.of(context).textTheme.headline2!.copyWith(
              color: ColorConstant.appWhite,
              fontSize: fontSize,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
