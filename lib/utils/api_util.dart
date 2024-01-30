import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';

import '../models/index.dart';

final dio = Dio();

const generateTokenUrl = "https://token.jetmobo.com/service/token/generate";

const validateTokenUrl = 'https://token.jetmobo.com/service/token/validate';

Future<String> getToken(data) async {
  // 获取token
  var requestBody = {
    "data": jsonEncode(data), // 待加密数据，json字符串格式
    "expireSeconds": 3600, // 过期时间，单位秒
  };

  Response response = await dio.post(generateTokenUrl, data: requestBody);

  var token = response.data['data']['token'];
  return token;
}

Future<dynamic> checkToken(String token) async {
  var requestBody = {
    "token": token,
  };
  Response response = await dio.post(validateTokenUrl, data: requestBody);
  ValidateToken validateToken = ValidateToken.fromMap(response.data);
  if (validateToken.code != '0000') return false;
  String str = validateToken.data?.data ?? '';
  return jsonDecode(str);
}
