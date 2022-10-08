import 'package:demolocaldatabase/app/widget/app_button.dart';
import 'package:demolocaldatabase/app/widget/app_text.dart';
import 'package:demolocaldatabase/app/widget/app_text_field.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:demolocaldatabase/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final int groupValue;

  const RegisterPage({Key? key, required this.groupValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorConstant.appBlue,
            elevation: 0,
            centerTitle: true,
            leading:
                GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back_ios_outlined, color: ColorConstant.appWhite, size: 18)),
            title: AppText(
              text: groupValue == 0 ? 'Business Registration' : 'End User Registration',
              textStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14, color: ColorConstant.appWhite),
            ),
          ),
          body: Consumer<RegisterProvider>(
            builder: (context, registerProvider, _) {
              return ListView(
                shrinkWrap: true,
                children: [
                  if (groupValue == 0) businessTypeRegisterForm(context, registerProvider),
                  if (groupValue == 1) endUserTypeRegisterForm(context, registerProvider),
                ],
              );
            },
          )),
    );
  }

  Container businessTypeRegisterForm(BuildContext context, RegisterProvider registerProvider) {
    return Container(
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
            labelText(context, 'First name'),
            AppTextField(
              hint: 'Please enter first name',
              controller: registerProvider.firstNameController,
            ),
            labelText(context, 'Last name'),
            AppTextField(
              hint: 'Please enter last name',
              controller: registerProvider.lastNameController,
            ),
            labelText(context, 'Email'),
            AppTextField(
              hint: 'Please enter email',
              keyboardType: TextInputType.emailAddress,
              controller: registerProvider.emailController,
            ),
            labelText(context, 'Business type'),
            dropDownButton(context, registerProvider),
            labelText(context, 'Business Est. date'),
            datePicker(
              context,
              registerProvider: registerProvider,
              selectedDate: registerProvider.businessEstDate == null ? 'Please select date' : "${registerProvider.businessEstDate!.toLocal()}".split(' ')[0],
              onTap: () => registerProvider.selectBusinessEstDateFunction(context),
            ),
            labelText(context, 'Business name'),
            AppTextField(
              hint: 'Please enter Business name',
              controller: registerProvider.businessNameController,
            ),
            labelText(context, 'Address'),
            AppTextField(
              hint: 'Please enter address',
              controller: registerProvider.addressController,
            ),
            labelText(context, 'Country'),
            AppTextField(
              hint: 'Please enter country',
              controller: registerProvider.countryController,
            ),
            labelText(context, 'State'),
            AppTextField(
              hint: 'Please enter state',
              controller: registerProvider.stateController,
            ),
            labelText(context, 'City'),
            AppTextField(
              hint: 'Please enter city',
              controller: registerProvider.cityController,
            ),
            labelText(context, 'Landline no'),
            AppTextField(
              hint: 'Please enter landline no',
              controller: registerProvider.landlineNoController,
              keyboardType: TextInputType.phone,
            ),
            labelText(context, 'Mobile no'),
            AppTextField(
              hint: 'Please enter mobile no',
              controller: registerProvider.mobileNoController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            labelText(context, 'User name'),
            AppTextField(
              hint: 'Please enter user name',
              controller: registerProvider.userNameController,
            ),
            labelText(context, 'Password'),
            AppTextField(
              hint: 'Please enter password',
              obscureText: true,
              controller: registerProvider.passwordController,
            ),
            labelText(context, 'Confirm password'),
            AppTextField(
              hint: 'Please enter confirm password',
              obscureText: true,
              controller: registerProvider.confirmPasswordController,
            ),
            registerButton(registerProvider, context)
          ],
        ),
      ),
    );
  }

  Container endUserTypeRegisterForm(BuildContext context, RegisterProvider registerProvider) {
    return Container(
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
            labelText(context, 'First name'),
            AppTextField(
              hint: 'Please enter first name',
              controller: registerProvider.firstNameController,
            ),
            labelText(context, 'Last name'),
            AppTextField(
              hint: 'Please enter last name',
              controller: registerProvider.lastNameController,
            ),
            labelText(context, 'Email'),
            AppTextField(
              hint: 'Please enter email',
              keyboardType: TextInputType.emailAddress,
              controller: registerProvider.emailController,
            ),
            labelText(context, 'Date of birth'),
            datePicker(
              context,
              registerProvider: registerProvider,
              selectedDate: registerProvider.dateOfBirth == null ? 'Please select date of birth' : "${registerProvider.dateOfBirth!.toLocal()}".split(' ')[0],
              onTap: () => registerProvider.selectBirthDateFunction(context),
            ),
            labelText(context, 'Address'),
            AppTextField(
              hint: 'Please enter address',
              controller: registerProvider.addressController,
            ),
            labelText(context, 'Country'),
            AppTextField(
              hint: 'Please enter country',
              controller: registerProvider.countryController,
            ),
            labelText(context, 'State'),
            AppTextField(
              hint: 'Please enter state',
              controller: registerProvider.stateController,
            ),
            labelText(context, 'City'),
            AppTextField(
              hint: 'Please enter city',
              controller: registerProvider.cityController,
            ),
            labelText(context, 'Mobile no'),
            AppTextField(
              hint: 'Please enter mobile no',
              controller: registerProvider.mobileNoController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            labelText(context, 'User name'),
            AppTextField(
              hint: 'Please enter user name',
              controller: registerProvider.userNameController,
            ),
            labelText(context, 'Password'),
            AppTextField(
              hint: 'Please enter password',
              obscureText: true,
              controller: registerProvider.passwordController,
            ),
            labelText(context, 'Confirm password'),
            AppTextField(
              hint: 'Please enter confirm password',
              obscureText: true,
              controller: registerProvider.confirmPasswordController,
            ),
            registerButton(registerProvider, context)
          ],
        ),
      ),
    );
  }

  Align registerButton(RegisterProvider registerProvider, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppElevatedButton(
        text: 'Register',
        onPressed: () {
          if (groupValue == 0) {
            registerProvider.validateBusinessTypeForm(context);
          } else {
            registerProvider.validateEndUserTypeForm(context);
          }
        },
        height: 32,
        width: 90,
        fontSize: 12,
        buttonColor: ColorConstant.appBlue,
        margin: const EdgeInsets.only(top: 20, bottom: 5),
      ),
    );
  }

  GestureDetector datePicker(BuildContext context,
      {required RegisterProvider registerProvider, required String selectedDate, required GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        decoration: ColorConstant.appCardDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                text: selectedDate,
                textStyle: selectedDate.isEmpty
                    ? Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, color: ColorConstant.appBlack)
                    : Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 15, fontWeight: FontWeight.w500, color: ColorConstant.appGrey)),
            Icon(
              Icons.calendar_today,
              color: ColorConstant.appBlack.withOpacity(0.6),
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  SizedBox dropDownButton(BuildContext context, RegisterProvider registerProvider) {
    return SizedBox(
      height: 42,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              border: ColorConstant.appOutlineInputBorder(),
              filled: true,
              fillColor: ColorConstant.appWhite,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              disabledBorder: ColorConstant.appOutlineInputBorder(),
              enabledBorder: ColorConstant.appOutlineInputBorder(),
              focusedBorder: ColorConstant.appOutlineInputBorder(color: ColorConstant.appRed),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: AppText(
                  text: 'Please select business type',
                  textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 15, fontWeight: FontWeight.w500, color: ColorConstant.appGrey),
                ),
                value: registerProvider.currentSelectedBusinessType,
                isExpanded: true,
                onChanged: (newValue) => registerProvider.selectBusinessType(newValue!),
                items: registerProvider.businessTypes.map((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: AppText(
                        text: value,
                        textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14, color: ColorConstant.appBlack),
                      ));
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding labelText(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 20, bottom: 8),
      child: AppText(text: title, textStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 14)),
    );
  }
}
