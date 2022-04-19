// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    this.success,
    this.userValue,
  });

  bool success;
  UserValue userValue;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json["success"],
        userValue: UserValue.fromJson(json["userValue"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userValue": userValue.toJson(),
      };
}

class UserValue {
  UserValue({
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.createdAt,
  });

  int id;
  String name;
  String email;
  String phonenumber;
  DateTime createdAt;

  factory UserValue.fromJson(Map<String, dynamic> json) => UserValue(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "createdAt": createdAt.toIso8601String(),
      };
}
