import 'package:demolocaldatabase/app/utills/app_logs.dart';
import 'package:demolocaldatabase/app/widget/app_button.dart';
import 'package:demolocaldatabase/app/widget/app_text.dart';
import 'package:demolocaldatabase/app/widget/app_text_field.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:demolocaldatabase/providers/login_provider.dart';
import 'package:demolocaldatabase/providers/register_provider.dart';
import 'package:demolocaldatabase/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, _) {
          return Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 25),
                  decoration: BoxDecoration(
                    color: ColorConstant.appGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(14),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: const BoxDecoration(color: ColorConstant.appLightGrey),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 15, bottom: 8),
                          child: AppText(text: 'User Name', textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14)),
                        ),
                        AppTextField(
                          hint: 'Please enter username',
                          keyboardType: TextInputType.emailAddress,
                          controller: loginProvider.emailController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 20, bottom: 8),
                          child: AppText(text: 'Password', textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14)),
                        ),
                        AppTextField(
                          hint: 'Please enter password',
                          obscureText: true,
                          controller: loginProvider.passwordController,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<LoginProvider>(
                              builder: (context, logInProvider, child) {
                                return AppElevatedButton(
                                  text: 'Login',
                                  onPressed: () => logInProvider.validateForm(context),
                                  height: 32,
                                  width: 90,
                                  fontSize: 12,
                                  buttonColor: ColorConstant.appBlue,
                                  margin: const EdgeInsets.only(top: 20, bottom: 5, right: 5),
                                );
                              },
                            ),
                            const AppElevatedButton(
                              text: 'Close',
                              height: 32,
                              width: 90,
                              fontSize: 12,
                              buttonColor: ColorConstant.appBlue,
                              margin: EdgeInsets.only(top: 20, bottom: 5, right: 5),
                            ),
                            Consumer<RegisterProvider>(
                              builder: (context, registerProvider, _) {
                                return AppElevatedButton(
                                  text: 'Sign up',
                                  onPressed: () => registerProvider.goToTypeSelectionPage(context),
                                  height: 32,
                                  width: 90,
                                  fontSize: 12,
                                  buttonColor: ColorConstant.appBlue,
                                  margin: const EdgeInsets.only(top: 20, bottom: 5, right: 5),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
