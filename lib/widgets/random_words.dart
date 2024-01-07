import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'dart:convert';

final dio = Dio();

void getHttp() async {
  // final response = await dio.get('https://dart.dev');

  // var response = await dio.get('https://pv.sohu.com/cityjson');
  var response = await dio.get('https://restapi.amap.com/v3/ip?parameters');
  print(response);

}

class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => getHttp(), // 执行getHttp操作
        child: Text(wordPair.toString()),
      ),
    );
  }
}
