// To parse this JSON data, do
//
//     final driverListModel = driverListModelFromJson(jsonString);

import 'dart:convert';

DriverListModel driverListModelFromJson(String str) =>
    DriverListModel.fromJson(json.decode(str));

String driverListModelToJson(DriverListModel data) =>
    json.encode(data.toJson());

class DriverListModel {
  DriverListModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory DriverListModel.fromJson(Map<String, dynamic> json) =>
      DriverListModel(
        success: json["success"],
        userValue: List<UserValue>.from(
            json["userValue"].map((x) => UserValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userValue": List<dynamic>.from(userValue.map((x) => x.toJson())),
      };
}

class UserValue {
  UserValue({
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.location,
    this.status,
    this.createdAt,
  });

  int id;
  String name;
  String email;
  String phonenumber;
  String location;
  int status;
  DateTime createdAt;

  factory UserValue.fromJson(Map<String, dynamic> json) => UserValue(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        location: json["location"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "location": location,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
      };
}
