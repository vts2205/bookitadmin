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
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.passwordText,
    this.createdAt,
  });

  int id;
  String name;
  String email;
  String phonenumber;
  String passwordText;
  DateTime createdAt;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        passwordText: json["password_text"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "password_text": passwordText,
        "createdAt": createdAt.toIso8601String(),
      };
}
