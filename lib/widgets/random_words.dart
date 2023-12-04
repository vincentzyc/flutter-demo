import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
   // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}