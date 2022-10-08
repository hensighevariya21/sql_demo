import 'dart:convert';

BusinessRegisterModel registerModelFromJson(String str) => BusinessRegisterModel.fromJson(json.decode(str));

String registerModelToJson(BusinessRegisterModel data) => json.encode(data.toJson());

class BusinessRegisterModel {
  BusinessRegisterModel({
    this.businessEmail,
    this.businessFirstName,
    this.businessLastName,
    this.businessType,
    this.businessEstDate,
    this.businessName,
    this.businessAddress,
    this.businessCountry,
    this.businessState,
    this.businessCity,
    this.businessLandlineNo,
    this.businessMobileNo,
    this.businessUserName,
    this.businessPassword,
    this.businessConfirmPassword,
  });

  String? businessFirstName;
  String? businessLastName;
  String? businessEmail;
  String? businessType;
  String? businessEstDate;
  String? businessName;
  String? businessAddress;
  String? businessCountry;
  String? businessState;
  String? businessCity;
  String? businessLandlineNo;
  String? businessMobileNo;
  String? businessUserName;
  String? businessPassword;
  String? businessConfirmPassword;

  factory BusinessRegisterModel.fromJson(Map<String, dynamic> json) => BusinessRegisterModel(
        businessFirstName: json["businessFirstName"],
        businessLastName: json["businessLastName"],
        businessEmail: json["businessEmail"],
        businessType: json["businessType"],
        businessEstDate: json["businessEstDate"],
        businessName: json["businessName"],
        businessAddress: json["businessAddress"],
        businessCountry: json["businessCountry"],
        businessState: json["businessState"],
        businessCity: json["businessCity"],
        businessLandlineNo: json["businessLandlineNo"],
        businessMobileNo: json["businessMobileNo"],
        businessUserName: json["businessUserName"],
        businessPassword: json["businessPassword"],
        businessConfirmPassword: json["businessConfirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "businessFirstName": businessFirstName,
        "businessLastName": businessLastName,
        "businessEmail": businessEmail,
        "businessType": businessType,
        "businessEstDate": businessEstDate,
        "businessName": businessName,
        "businessAddress": businessAddress,
        "businessCountry": businessCountry,
        "businessState": businessState,
        "businessCity": businessCity,
        "businessLandlineNo": businessLandlineNo,
        "businessMobileNo": businessMobileNo,
        "businessUserName": businessUserName,
        "businessPassword": businessPassword,
        "businessConfirmPassword": businessConfirmPassword,
      };
}
