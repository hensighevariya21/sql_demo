import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;

  const AppTextField({
    Key? key,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.name,
    this.onChanged,
    @required this.hint, this.inputFormatters,this.readOnly = false, this.enabled = true, this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        cursorColor: ColorConstant.appBlack,
        cursorWidth: 1,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style:
        Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14,color: ColorConstant.appBlack),
        decoration: InputDecoration(
          hintText: hint!,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize: 15, fontWeight: FontWeight.w500,color: ColorConstant.appGrey),
          filled: true,
          fillColor: ColorConstant.appWhite,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: ColorConstant.appOutlineInputBorder(),
          disabledBorder: ColorConstant.appOutlineInputBorder(),
          enabledBorder: ColorConstant.appOutlineInputBorder(),
          focusedBorder: ColorConstant.appOutlineInputBorder(
              color: ColorConstant.appRed),
        ),
      ),
    );
  }
}
