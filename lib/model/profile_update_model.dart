// To parse this JSON data, do
//
//     final profileUpdateModel = profileUpdateModelFromJson(jsonString);

import 'dart:convert';

ProfileUpdateModel profileUpdateModelFromJson(String str) =>
    ProfileUpdateModel.fromJson(json.decode(str));

String profileUpdateModelToJson(ProfileUpdateModel data) =>
    json.encode(data.toJson());

class ProfileUpdateModel {
  ProfileUpdateModel({
    this.success,
    this.message,
    this.values,
  });

  bool success;
  String message;
  Values values;

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateModel(
        success: json["success"],
        message: json["message"],
        values: Values.fromJson(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "values": values.toJson(),
      };
}

class Values {
  Values({
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

  factory Values.fromJson(Map<String, dynamic> json) => Values(
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
