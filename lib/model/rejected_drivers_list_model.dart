// To parse this JSON data, do
//
//     final rejectedDriversListModel = rejectedDriversListModelFromJson(jsonString);

import 'dart:convert';

RejectedDriversListModel rejectedDriversListModelFromJson(String str) =>
    RejectedDriversListModel.fromJson(json.decode(str));

String rejectedDriversListModelToJson(RejectedDriversListModel data) =>
    json.encode(data.toJson());

class RejectedDriversListModel {
  RejectedDriversListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int statusCode;
  int code;
  String message;
  Body body;

  factory RejectedDriversListModel.fromJson(Map<String, dynamic> json) =>
      RejectedDriversListModel(
        statusCode: json["statusCode"],
        code: json["code"],
        message: json["message"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "code": code,
        "message": message,
        "body": body.toJson(),
      };
}

class Body {
  Body({
    this.approvedDrivers,
  });

  List<ApprovedDriver> approvedDrivers;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        approvedDrivers: List<ApprovedDriver>.from(
            json["approvedDrivers"].map((x) => ApprovedDriver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "approvedDrivers":
            List<dynamic>.from(approvedDrivers.map((x) => x.toJson())),
      };
}

class ApprovedDriver {
  ApprovedDriver({
    this.name,
    this.driverId,
    this.contact,
    this.ownerName,
    this.ownerNumber,
    this.location,
    this.licenseNumber,
    this.expiryDate,
    this.referral,
  });

  String name;
  String driverId;
  String contact;
  String ownerName;
  String ownerNumber;
  String location;
  String licenseNumber;
  String expiryDate;
  String referral;

  factory ApprovedDriver.fromJson(Map<String, dynamic> json) => ApprovedDriver(
        name: json["name"],
        driverId: json["driver_id"],
        contact: json["contact"],
        ownerName: json["owner_name"],
        ownerNumber: json["owner_number"],
        location: json["location"],
        licenseNumber: json["license_number"],
        expiryDate: json["expiry_date"],
        referral: json["referral"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "driver_id": driverId,
        "contact": contact,
        "owner_name": ownerName,
        "owner_number": ownerNumber,
        "location": location,
        "license_number": licenseNumber,
        "expiry_date": expiryDate,
        "referral": referral,
      };
}
