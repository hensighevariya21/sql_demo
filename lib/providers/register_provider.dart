import 'package:demolocaldatabase/app/utills/app_logs.dart';
import 'package:demolocaldatabase/app/utills/app_validation.dart';
import 'package:demolocaldatabase/app/widget/app_date_picker.dart';
import 'package:demolocaldatabase/app/widget/app_toast.dart';
import 'package:demolocaldatabase/login/login_page.dart';
import 'package:demolocaldatabase/model/register_model.dart';
import 'package:demolocaldatabase/model/user_register_model.dart';
import 'package:demolocaldatabase/register/register_choosen_page.dart';
import 'package:demolocaldatabase/register/register_page.dart';
import 'package:demolocaldatabase/services/db_helper.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  DateTime? businessEstDate;
  DateTime? dateOfBirth;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController landlineNoController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  int groupValue = -1;
  String? currentSelectedBusinessType;
  final businessTypes = ["Individual", "Partnership", "Private limited", "Public limited"];

  Future<void> selectBusinessEstDateFunction(BuildContext context) async {
    businessEstDate = await AppDatePicker.selectDate(context, businessEstDate);
    notifyListeners();
  }

  Future<void> selectBirthDateFunction(BuildContext context) async {
    dateOfBirth = await AppDatePicker.selectDate(context, dateOfBirth);
    notifyListeners();
  }

  void selectBusinessType(String newValue) {
    currentSelectedBusinessType = newValue;
    notifyListeners();
  }

  void goToTypeSelectionPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterChoosenPage()));
  }

  selectRegisterType(dynamic value, BuildContext context) {
    groupValue = value;
    notifyListeners();
    Future.delayed(
      const Duration(microseconds: 100),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(groupValue: groupValue))),
    );
  }

  Future<void> validateEndUserTypeForm(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (firstNameController.text.isEmpty) {
      "First name can't empty".showToast(isError: true);
    } else if (lastNameController.text.isEmpty) {
      "Last name can't empty".showToast(isError: true);
    } else if (emailController.text.isEmpty) {
      "Email can't empty".showToast(isError: true);
    } else if (!RegExp(AppValidation.emailPattern).hasMatch(emailController.text.trim())) {
      "Enter valid email".showToast(isError: true);
    } else if (dateOfBirth == null) {
      "Please select birth of date".showToast(isError: true);
    } else if (dateOfBirth != null && (DateTime.now().difference(dateOfBirth!) < const Duration(days: 6570))) {
      "User should be at least 18 years old".showToast(isError: true);
    } else if (addressController.text.isEmpty) {
      "Address can't empty".showToast(isError: true);
    } else if (addressController.text.length < 25) {
      "Address must contains 25 characters".showToast(isError: true);
    } else if (countryController.text.isEmpty) {
      "Country can't empty".showToast(isError: true);
    } else if (stateController.text.isEmpty) {
      "State can't empty".showToast(isError: true);
    } else if (cityController.text.isEmpty) {
      "City can't empty".showToast(isError: true);
    } else if (mobileNoController.text.isEmpty) {
      "Mobile no can't empty".showToast(isError: true);
    } else if (!RegExp(AppValidation.mobilePattern).hasMatch(mobileNoController.text.trim())) {
      "Mobile no must contains at least 10 characters".showToast(isError: true);
    } else if (userNameController.text.isEmpty) {
      "User name can't empty".showToast(isError: true);
    } else if (passwordController.text.isEmpty) {
      "Password can't empty".showToast(isError: true);
    } else if (confirmPasswordController.text.isEmpty) {
      "Confirm password can't empty".showToast(isError: true);
    } else if (passwordController.text != confirmPasswordController.text) {
      "Confirm password not match".showToast(isError: true);
    } else {
      UserRegisterModel userRegisterModel = UserRegisterModel(
          userFirstName:firstNameController.text,
          userLastName:lastNameController.text,
          userEmail:emailController.text,
          userDob:dateOfBirth!.toIso8601String(),
          userAddress:addressController.text,
          userCountry:countryController.text,
          userState:stateController.text,
          userCity:cityController.text,
          userMobileNo:mobileNoController.text,
          userUserName:userNameController.text,
          userPassword:passwordController.text,
      );
      logs('Register model --> ${userRegisterModel.toJson()}');
      DBHelper.instance.registerEndUsers(userRegisterModel);
      disposeValues();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  Future<void> validateBusinessTypeForm(BuildContext context) async {
    if (firstNameController.text.isEmpty) {
      "First name can't empty".showToast(isError: true);
    } else if (lastNameController.text.isEmpty) {
      "Last name can't empty".showToast(isError: true);
    } else if (emailController.text.isEmpty) {
      "Email can't empty".showToast(isError: true);
    } else if (!RegExp(AppValidation.emailPattern).hasMatch(emailController.text.trim())) {
      "Enter valid email".showToast(isError: true);
    } else if (currentSelectedBusinessType == null) {
      "Please select business type".showToast(isError: true);
    } else if (businessEstDate == null) {
      "Please select business Est. date".showToast(isError: true);
    } else if (businessNameController.text.isEmpty) {
      "Business name can't empty".showToast(isError: true);
    } else if (addressController.text.isEmpty) {
      "Address can't empty".showToast(isError: true);
    } else if (addressController.text.length < 25) {
      "Address must contains 25 characters".showToast(isError: true);
    } else if (countryController.text.isEmpty) {
      "Country can't empty".showToast(isError: true);
    } else if (stateController.text.isEmpty) {
      "State can't empty".showToast(isError: true);
    } else if (cityController.text.isEmpty) {
      "City can't empty".showToast(isError: true);
    } else if (landlineNoController.text.isEmpty) {
      "Landline no can't empty".showToast(isError: true);
    } else if (mobileNoController.text.isEmpty) {
      "Mobile no can't empty".showToast(isError: true);
    } else if (!RegExp(AppValidation.mobilePattern).hasMatch(mobileNoController.text.trim())) {
      "Mobile no must contains at least 10 characters".showToast(isError: true);
    } else if (userNameController.text.isEmpty) {
      "User name can't empty".showToast(isError: true);
    } else if (passwordController.text.isEmpty) {
      "Password can't empty".showToast(isError: true);
    } else if (confirmPasswordController.text.isEmpty) {
      "Confirm password can't empty".showToast(isError: true);
    } else if (passwordController.text != confirmPasswordController.text) {
      "Confirm password not match".showToast(isError: true);
    } else {
      BusinessRegisterModel registerModel = BusinessRegisterModel(
        businessFirstName: firstNameController.text,
        businessLastName: lastNameController.text,
        businessEmail: emailController.text,
        businessType: currentSelectedBusinessType,
        businessEstDate: businessEstDate!.toIso8601String().substring(0, 10),
        businessName: businessNameController.text,
        businessAddress: addressController.text,
        businessCountry: countryController.text,
        businessState: stateController.text,
        businessCity: cityController.text,
        businessLandlineNo: landlineNoController.text,
        businessMobileNo: mobileNoController.text,
        businessUserName: userNameController.text,
        businessPassword: passwordController.text,
        businessConfirmPassword: confirmPasswordController.text,
      );
      DBHelper.instance.addBusinessTypeUserTable(registerModel);
      FocusScope.of(context).requestFocus(FocusNode());
      disposeValues();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  disposeValues() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    currentSelectedBusinessType = null;
    businessEstDate = null;
    dateOfBirth = null;
    businessNameController.clear();
    addressController.clear();
    countryController.clear();
    stateController.clear();
    cityController.clear();
    landlineNoController.clear();
    mobileNoController.clear();
    userNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    groupValue = -1;
  }
}
