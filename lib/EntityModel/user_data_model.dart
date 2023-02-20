

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    required this.code,
    required this.message,
    this.data,
  });

  int code;
  String message;
  Data? data;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.countryNationality,
    required this.countryResident,
    required this.email,
    required this.rollNumber,
    required this.organisationName,
    required this.role,
    required this.password,
    required this.createdBy,
    required this.updatedBy,
    required this.isActive,
    required this.emailVerified,
  });

  int id;
  String firstName;
  String lastName;
  int dob;
  String gender;
  String countryNationality;
  String countryResident;
  String email;
  String rollNumber;
  String organisationName;
  String role;
  String password;
  String createdBy;
  String updatedBy;
  bool isActive;
  bool emailVerified;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dob: json["dob"],
    gender: json["gender"],
    countryNationality: json["country_nationality"],
    countryResident: json["country_resident"],
    email: json["email"],
    rollNumber: json["roll_number"],
    organisationName: json["organisation_name"],
    role: json["role"],
    password: json["password"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    isActive: json["is_active"],
    emailVerified: json["email_verified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "dob": dob,
    "gender": gender,
    "country_nationality": countryNationality,
    "country_resident": countryResident,
    "email": email,
    "roll_number": rollNumber,
    "organisation_name": organisationName,
    "role": role,
    "password": password,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "is_active": isActive,
    "email_verified": emailVerified,
  };
}