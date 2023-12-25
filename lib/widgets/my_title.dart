import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import '../theme/mColors.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        color: mColors.text_blue,
      ),
      Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: const Image(
                    image: AssetImage(("assets/image/test.jpg")),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: const Column(children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "您好，欢迎您",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "这是个人中心页面",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ]),
                ))
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
