import 'package:demolocaldatabase/app/widget/app_text.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:demolocaldatabase/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterChoosenPage extends StatelessWidget {
  const RegisterChoosenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.appBlue,
          elevation: 0,
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios_outlined, color: ColorConstant.appWhite, size: 18),
          title: AppText(
            text: 'Select type',
            textStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, color: ColorConstant.appWhite),
          ),
        ),
        body: Consumer<RegisterProvider>(
          builder: (context, registerProvider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: 'Please select type : ', textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, color: ColorConstant.appBlue)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 0,
                      groupValue: registerProvider.groupValue,
                      activeColor: ColorConstant.appBlue,
                      onChanged: (value) => registerProvider.selectRegisterType(value!, context),
                    ),
                    AppText(text: 'Business', textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, color: ColorConstant.appBlue)),
                    Radio(
                      value: 1,
                      groupValue: registerProvider.groupValue,
                      activeColor: ColorConstant.appBlue,
                      onChanged: (value) => registerProvider.selectRegisterType(value!, context),
                    ),
                    AppText(text: 'End user', textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, color: ColorConstant.appBlue)),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
