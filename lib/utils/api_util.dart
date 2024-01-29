import 'dart:convert';

import 'package:dio/dio.dart';

final dio = Dio();

const generateToken = "https://token.jetmobo.com/service/token/generate";

Future<String> getToken(data) async {
  // 获取token
  var requestBody = {
    "data": jsonEncode(data), // 待加密数据，json字符串格式
    "expireSeconds": 3600, // 过期时间，单位秒
  };

  Response response = await dio.post(generateToken, data: requestBody);

  var token = response.data['data']['token'];
  return token;
}
