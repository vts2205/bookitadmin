// To parse this JSON data, do
//
//     final subAdminListModel = subAdminListModelFromJson(jsonString);

import 'dart:convert';

SubAdminListModel subAdminListModelFromJson(String str) =>
    SubAdminListModel.fromJson(json.decode(str));

String subAdminListModelToJson(SubAdminListModel data) =>
    json.encode(data.toJson());

class SubAdminListModel {
  SubAdminListModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory SubAdminListModel.fromJson(Map<String, dynamic> json) =>
      SubAdminListModel(
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
    this.passwordText,
    this.designation,
    this.image,
    this.status,
    this.createdAt,
    this.password,
  });

  int id;
  String name;
  String email;
  String phonenumber;
  String passwordText;
  String designation;
  String image;
  int status;
  DateTime createdAt;
  String password;

  factory UserValue.fromJson(Map<String, dynamic> json) => UserValue(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        passwordText: json["password_text"],
        designation: json["designation"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "password_text": passwordText,
        "designation": designation,
        "image": image,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "password": password == null ? null : password,
      };
}
