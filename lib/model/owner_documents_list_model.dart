// To parse this JSON data, do
//
//     final ownerDocumentsListModel = ownerDocumentsListModelFromJson(jsonString);

import 'dart:convert';

OwnerDocumentsListModel ownerDocumentsListModelFromJson(String str) =>
    OwnerDocumentsListModel.fromJson(json.decode(str));

String ownerDocumentsListModelToJson(OwnerDocumentsListModel data) =>
    json.encode(data.toJson());

class OwnerDocumentsListModel {
  OwnerDocumentsListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int statusCode;
  int code;
  String message;
  List<Body> body;

  factory OwnerDocumentsListModel.fromJson(Map<String, dynamic> json) =>
      OwnerDocumentsListModel(
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
    this.aadharFront,
    this.aadharBack,
    this.panCard,
    this.passbook,
    this.rentalAgreement1,
    this.rentalAgreement2,
    this.driverDriverName,
    this.driverDriverContact,
    this.driverDriverDriverId,
  });

  String aadharFront;
  String aadharBack;
  String panCard;
  dynamic passbook;
  dynamic rentalAgreement1;
  dynamic rentalAgreement2;
  String driverDriverName;
  String driverDriverContact;
  String driverDriverDriverId;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        aadharFront: json["aadhar_front"],
        aadharBack: json["aadhar_back"],
        panCard: json["pan_card"],
        passbook: json["passbook"],
        rentalAgreement1: json["rental_agreement1"],
        rentalAgreement2: json["rental_agreement2"],
        driverDriverName: json["driver_driver.name"],
        driverDriverContact: json["driver_driver.contact"],
        driverDriverDriverId: json["driver_driver.driver_id"],
      );

  Map<String, dynamic> toJson() => {
        "aadhar_front": aadharFront,
        "aadhar_back": aadharBack,
        "pan_card": panCard,
        "passbook": passbook,
        "rental_agreement1": rentalAgreement1,
        "rental_agreement2": rentalAgreement2,
        "driver_driver.name": driverDriverName,
        "driver_driver.contact": driverDriverContact,
        "driver_driver.driver_id": driverDriverDriverId,
      };
}
