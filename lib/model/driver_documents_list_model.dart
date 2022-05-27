// To parse this JSON data, do
//
//     final driverDocumentsListModel = driverDocumentsListModelFromJson(jsonString);

import 'dart:convert';

DriverDocumentsListModel driverDocumentsListModelFromJson(String str) =>
    DriverDocumentsListModel.fromJson(json.decode(str));

String driverDocumentsListModelToJson(DriverDocumentsListModel data) =>
    json.encode(data.toJson());

class DriverDocumentsListModel {
  DriverDocumentsListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int statusCode;
  int code;
  String message;
  List<Body> body;

  factory DriverDocumentsListModel.fromJson(Map<String, dynamic> json) =>
      DriverDocumentsListModel(
        statusCode: json["statusCode"],
        code: json["code"],
        message: json["message"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "code": code,
        "message": message,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    this.profilePic,
    this.aadharFront,
    this.aadharBack,
    this.licenseFront,
    this.licenseBack,
    this.driverName,
    this.driverContact,
    this.driverDriverId,
  });

  String profilePic;
  String aadharFront;
  String aadharBack;
  String licenseFront;
  String licenseBack;
  String driverName;
  String driverContact;
  String driverDriverId;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        profilePic: json["profile_pic"],
        aadharFront: json["aadhar_front"],
        aadharBack: json["aadhar_back"],
        licenseFront: json["license_front"],
        licenseBack: json["license_back"],
        driverName: json["driver.name"],
        driverContact: json["driver.contact"],
        driverDriverId: json["driver.driver_id"],
      );

  Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "aadhar_front": aadharFront,
        "aadhar_back": aadharBack,
        "license_front": licenseFront,
        "license_back": licenseBack,
        "driver.name": driverName,
        "driver.contact": driverContact,
        "driver.driver_id": driverDriverId,
      };
}
