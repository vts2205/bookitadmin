// To parse this JSON data, do
//
//     final addDriverListModel = addDriverListModelFromJson(jsonString);

import 'dart:convert';

AddDriverListModel addDriverListModelFromJson(String str) =>
    AddDriverListModel.fromJson(json.decode(str));

String addDriverListModelToJson(AddDriverListModel data) =>
    json.encode(data.toJson());

class AddDriverListModel {
  AddDriverListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int statusCode;
  int code;
  String message;
  List<Body> body;

  factory AddDriverListModel.fromJson(Map<String, dynamic> json) =>
      AddDriverListModel(
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
    this.id,
    this.driverId,
    this.name,
    this.email,
    this.contact,
    this.password,
    this.gender,
    this.dob,
    this.currentCarId,
    this.documentId,
    this.ownerId,
    this.ownerName,
    this.ownerNumber,
    this.location,
    this.licenseNumber,
    this.expiryDate,
    this.rentalType,
    this.ratings,
    this.fcmToken,
    this.referral,
    this.driverStatus,
    this.createdAt,
    this.updatedAt,
    this.documentDocument,
    this.currentCar,
    this.driverOwners,
  });

  int id;
  String driverId;
  String name;
  String email;
  String contact;
  String password;
  dynamic gender;
  dynamic dob;
  String currentCarId;
  String documentId;
  String ownerId;
  String ownerName;
  String ownerNumber;
  String location;
  String licenseNumber;
  String expiryDate;
  int rentalType;
  int ratings;
  String fcmToken;
  String referral;
  String driverStatus;
  DateTime createdAt;
  DateTime updatedAt;
  DocumentDocument documentDocument;
  CurrentCar currentCar;
  DriverOwners driverOwners;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        driverId: json["driver_id"],
        name: json["name"],
        email: json["email"] == null ? null : json["email"],
        contact: json["contact"],
        password: json["password"],
        gender: json["gender"],
        dob: json["dob"],
        currentCarId:
            json["current_car_id"] == null ? null : json["current_car_id"],
        documentId: json["document_id"] == null ? null : json["document_id"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        ownerName: json["owner_name"],
        ownerNumber: json["owner_number"],
        location: json["location"],
        licenseNumber: json["license_number"],
        expiryDate: json["expiry_date"],
        rentalType: json["rental_type"],
        ratings: json["ratings"],
        fcmToken: json["fcm_token"],
        referral: json["referral"],
        driverStatus: json["driver_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        documentDocument: DocumentDocument.fromJson(json["document_document"]),
        currentCar: CurrentCar.fromJson(json["current_car"]),
        driverOwners: DriverOwners.fromJson(json["driver_owners"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "driver_id": driverId,
        "name": name,
        "email": email == null ? null : email,
        "contact": contact,
        "password": password,
        "gender": gender,
        "dob": dob,
        "current_car_id": currentCarId == null ? null : currentCarId,
        "document_id": documentId == null ? null : documentId,
        "owner_id": ownerId == null ? null : ownerId,
        "owner_name": ownerName,
        "owner_number": ownerNumber,
        "location": location,
        "license_number": licenseNumber,
        "expiry_date": expiryDate,
        "rental_type": rentalType,
        "ratings": ratings,
        "fcm_token": fcmToken,
        "referral": referral,
        "driver_status": driverStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "document_document": documentDocument.toJson(),
        "current_car": currentCar.toJson(),
        "driver_owners": driverOwners.toJson(),
      };
}

class CurrentCar {
  CurrentCar({
    this.frontImage,
    this.chaseImage,
    this.rcFront,
    this.rcBack,
    this.insurance,
    this.fc,
  });

  String frontImage;
  String chaseImage;
  String rcFront;
  String rcBack;
  String insurance;
  String fc;

  factory CurrentCar.fromJson(Map<String, dynamic> json) => CurrentCar(
        frontImage: json["front_image"] == null ? null : json["front_image"],
        chaseImage: json["chase_image"] == null ? null : json["chase_image"],
        rcFront: json["rc_front"] == null ? null : json["rc_front"],
        rcBack: json["rc_back"] == null ? null : json["rc_back"],
        insurance: json["insurance"] == null ? null : json["insurance"],
        fc: json["fc"] == null ? null : json["fc"],
      );

  Map<String, dynamic> toJson() => {
        "front_image": frontImage == null ? null : frontImage,
        "chase_image": chaseImage == null ? null : chaseImage,
        "rc_front": rcFront == null ? null : rcFront,
        "rc_back": rcBack == null ? null : rcBack,
        "insurance": insurance == null ? null : insurance,
        "fc": fc == null ? null : fc,
      };
}

class DocumentDocument {
  DocumentDocument({
    this.profilePic,
    this.aadharFront,
    this.aadharBack,
    this.licenseFront,
    this.licenseBack,
  });

  String profilePic;
  String aadharFront;
  String aadharBack;
  String licenseFront;
  String licenseBack;

  factory DocumentDocument.fromJson(Map<String, dynamic> json) =>
      DocumentDocument(
        profilePic: json["profile_pic"] == null ? null : json["profile_pic"],
        aadharFront: json["aadhar_front"] == null ? null : json["aadhar_front"],
        aadharBack: json["aadhar_back"] == null ? null : json["aadhar_back"],
        licenseFront:
            json["license_front"] == null ? null : json["license_front"],
        licenseBack: json["license_back"] == null ? null : json["license_back"],
      );

  Map<String, dynamic> toJson() => {
        "profile_pic": profilePic == null ? null : profilePic,
        "aadhar_front": aadharFront == null ? null : aadharFront,
        "aadhar_back": aadharBack == null ? null : aadharBack,
        "license_front": licenseFront == null ? null : licenseFront,
        "license_back": licenseBack == null ? null : licenseBack,
      };
}

class DriverOwners {
  DriverOwners({
    this.aadharFront,
    this.aadharBack,
    this.panCard,
    this.passbook,
    this.rentalAgreement1,
    this.rentalAgreement2,
  });

  String aadharFront;
  String aadharBack;
  String panCard;
  String passbook;
  String rentalAgreement1;
  String rentalAgreement2;

  factory DriverOwners.fromJson(Map<String, dynamic> json) => DriverOwners(
        aadharFront: json["aadhar_front"] == null ? null : json["aadhar_front"],
        aadharBack: json["aadhar_back"] == null ? null : json["aadhar_back"],
        panCard: json["pan_card"] == null ? null : json["pan_card"],
        passbook: json["passbook"] == null ? null : json["passbook"],
        rentalAgreement1: json["rental_agreement1"] == null
            ? null
            : json["rental_agreement1"],
        rentalAgreement2: json["rental_agreement2"] == null
            ? null
            : json["rental_agreement2"],
      );

  Map<String, dynamic> toJson() => {
        "aadhar_front": aadharFront == null ? null : aadharFront,
        "aadhar_back": aadharBack == null ? null : aadharBack,
        "pan_card": panCard == null ? null : panCard,
        "passbook": passbook == null ? null : passbook,
        "rental_agreement1": rentalAgreement1 == null ? null : rentalAgreement1,
        "rental_agreement2": rentalAgreement2 == null ? null : rentalAgreement2,
      };
}
