import 'dart:convert';

UserRegisterModel userModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  UserRegisterModel({
    this.userEmail,
    this.userFirstName,
    this.userLastName,
    this.userDob,
    this.userAddress,
    this.userCountry,
    this.userState,
    this.userCity,
    this.userMobileNo,
    this.userUserName,
    this.userPassword,
  });

  String? userFirstName;
  String? userLastName;
  String? userEmail;
  String? userDob;
  String? userAddress;
  String? userCountry;
  String? userState;
  String? userCity;
  String? userMobileNo;
  String? userUserName;
  String? userPassword;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
        userFirstName: json["userFirstName"],
        userLastName: json["userLastName"],
        userEmail: json["userEmail"],
        userDob: json["userDob"],
        userAddress: json["userAddress"],
        userCountry: json["userCountry"],
        userState: json["userState"],
        userCity: json["userCity"],
        userMobileNo: json["userMobileNo"],
        userUserName: json["userUserName"],
        userPassword: json["userPassword"],
      );

  Map<String, dynamic> toJson() => {
        "userFirstName": userFirstName,
        "userLastName": userLastName,
        "userEmail": userEmail,
        "userDob": userDob,
        "userAddress": userAddress,
        "userCountry": userCountry,
        "userState": userState,
        "userCity": userCity,
        "userMobileNo": userMobileNo,
        "userUserName": userUserName,
        "userPassword": userPassword,
      };
}
