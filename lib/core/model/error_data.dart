// To parse this JSON data, do
//
//     final errorData = errorDataFromJson(jsonString);

import 'dart:convert';

ErrorData errorDataFromJson(String str) => ErrorData.fromJson(json.decode(str));

String errorDataToJson(ErrorData data) => json.encode(data.toJson());

class ErrorData {
  ErrorData({
    this.code,
    this.message,
    this.reference,
  });

  String? code;
  String? message;
  String? reference;

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        code: json["Code"],
        message: json["Message"],
        reference: json["Reference"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
        "Reference": reference,
      };
}
