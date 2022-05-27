// To parse this JSON data, do
//
//     final carDocumentsListModel = carDocumentsListModelFromJson(jsonString);

import 'dart:convert';

CarDocumentsListModel carDocumentsListModelFromJson(String str) =>
    CarDocumentsListModel.fromJson(json.decode(str));

String carDocumentsListModelToJson(CarDocumentsListModel data) =>
    json.encode(data.toJson());

class CarDocumentsListModel {
  CarDocumentsListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int statusCode;
  int code;
  String message;
  List<Body> body;

  factory CarDocumentsListModel.fromJson(Map<String, dynamic> json) =>
      CarDocumentsListModel(
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
    this.frontImage,
    this.chaseImage,
    this.rcFront,
    this.rcBack,
    this.insurance,
    this.fc,
    this.driverName,
    this.driverContact,
    this.driverDriverId,
  });

  String frontImage;
  String chaseImage;
  String rcFront;
  String rcBack;
  String insurance;
  dynamic fc;
  String driverName;
  String driverContact;
  String driverDriverId;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        frontImage: json["front_image"],
        chaseImage: json["chase_image"],
        rcFront: json["rc_front"],
        rcBack: json["rc_back"],
        insurance: json["insurance"],
        fc: json["fc"],
        driverName: json["driver.name"],
        driverContact: json["driver.contact"],
        driverDriverId: json["driver.driver_id"],
      );

  Map<String, dynamic> toJson() => {
        "front_image": frontImage,
        "chase_image": chaseImage,
        "rc_front": rcFront,
        "rc_back": rcBack,
        "insurance": insurance,
        "fc": fc,
        "driver.name": driverName,
        "driver.contact": driverContact,
        "driver.driver_id": driverDriverId,
      };
}
