import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? textStyle;

  const AppText({
    Key? key,
    this.text,
    this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: textAlign,
      maxLines: maxLines,
      style: textStyle,
    );
  }
}

