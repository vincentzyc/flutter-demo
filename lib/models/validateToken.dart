// To parse this JSON data, do
//
//     final validateToken = validateTokenFromMap(jsonString);

import 'dart:convert';

ValidateToken validateTokenFromMap(String str) =>
    ValidateToken.fromMap(json.decode(str));

String validateTokenToMap(ValidateToken data) => json.encode(data.toMap());

class ValidateToken {
  bool success;
  String code;
  String message;
  Data? data; // 使用可空类型 Data?

  ValidateToken({
    required this.success,
    required this.code,
    required this.message,
    this.data, // 将 data 声明为可空类型
  });

  factory ValidateToken.fromMap(Map<String, dynamic> json) => ValidateToken(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? Data.fromMap(json["data"])
            : null, // 使用条件表达式处理可能为 null 的情况
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data?.toMap(), // 使用条件访问运算符 ?. 处理可空类型
      };
}

class Data {
  String? data; // 使用可空类型 String?

  Data({
    required this.data,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "data": data,
      };
}
