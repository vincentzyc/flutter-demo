import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/models/ipaddress.dart';
import 'package:flutter_demo/utils/toast_util.dart';
// import 'dart:convert';

final dio = Dio();

Future<String> getHttp() async {
  // final response = await dio.get('https://dart.dev');

  // var response = await dio.get('https://pv.sohu.com/cityjson');
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
    showLoadingDialog('Loading data...');
    String newIpCity = await getHttp(); // 执行异步操作
    hideLoadingDialog();
    setState(() {
      ipCity = newIpCity; // 同步更新状态
      print(ipCity);
    });
  }

  void showLoadingDialog(String loadingText) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingWidget(loadingText: loadingText);
      },
    );
  }

  void hideLoadingDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingWidget extends StatelessWidget {
  final String loadingText;

  const LoadingWidget({super.key, this.loadingText = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            loadingText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
