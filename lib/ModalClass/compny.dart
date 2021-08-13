// To parse this JSON data, do
//
//     final compny = compnyFromJson(jsonString);

import 'dart:convert';

Compny compnyFromJson(String str) => Compny.fromJson(json.decode(str));

String compnyToJson(Compny data) => json.encode(data.toJson());

class Compny {
  Compny({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<Datum> data;
  String message;

  factory Compny.fromJson(Map<String, dynamic> json) => Compny(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}
