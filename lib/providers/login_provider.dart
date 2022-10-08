import 'package:demolocaldatabase/app/utills/app_logs.dart';
import 'package:demolocaldatabase/app/widget/app_toast.dart';
import 'package:demolocaldatabase/services/db_helper.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateForm(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (emailController.text.trim().isEmpty) {
      "Email can't empty".showToast(isError: true);
    } else if (passwordController.text.trim().isEmpty) {
      "Password can't empty".showToast(isError: true);
    } else {
      validateUser();
    }
  }

  Future<void> validateUser() async {
    Map<String, dynamic> loggedInUserMap = {};
    List<Map<String, dynamic>> businessUsers = await DBHelper.instance.getEndUsers();
    loggedInUserMap = businessUsers.firstWhere((element) => element['businessUserName'] == emailController.text.trim(), orElse: () => {});
    if (loggedInUserMap.isEmpty) {
      List<Map<String, dynamic>> endUsers = await DBHelper.instance.getEndUsers();
      loggedInUserMap = endUsers.firstWhere((element) => element['userUserName'] == emailController.text.trim(), orElse: () => {});
    }
    logs('message --> $loggedInUserMap');
    if (loggedInUserMap.isNotEmpty) {
      if (loggedInUserMap[DBHelper.registerBusinessPassword] == passwordController.text.trim() || loggedInUserMap[DBHelper.userPassword] == passwordController.text.trim()) {
        'You logged successfully'.showToast();
        emailController.clear();
        passwordController.clear();
      } else {
        'Invalid Username Or Password'.showToast(isError: true);
      }
    }
  }
}
