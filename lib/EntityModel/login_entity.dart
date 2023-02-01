// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
     this.code,
     this.message,
    this.data,
  });

  int? code;
  String? message;
  dynamic data;


  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    code: json["code"],
    message: json["message"],
    data: json["data"]==null?null:Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
     this.accessToken,
     this.userId,
  });

  String? accessToken;
  int? userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "user_id": userId,
  };
}
