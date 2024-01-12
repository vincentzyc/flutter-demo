import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/models/ipaddress.dart';
import 'package:flutter_demo/utils/toast_util.dart';
import 'package:flutter_demo/widgets/loading.dart';
// import 'dart:convert';

final dio = Dio();

Future<String> getHttp() async {
  Response response = await dio.get('https://www.ip.cn/api/index?ip&type=0');

  IpAddress ipAddress = ipAddressFromJson(response.toString());

  mToast(ipAddress.address);
  return ipAddress.address;
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  String ipCity = '';

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _updateIpCity(); // 执行异步操作，并在操作完成后更新状态
        },
        child: Text(ipCity != '' ? ipCity : wordPair.toString()),
      ),
    );
  }

  Future<void> _updateIpCity() async {
    // 添加loading动画
    LoadingDialog.open(context, '数据加载中...');
    String newIpCity = await getHttp(); // 执行异步操作
    LoadingDialog.close();
    setState(() {
      ipCity = newIpCity; // 同步更新状态
      print(ipCity);
    });
  }
}
