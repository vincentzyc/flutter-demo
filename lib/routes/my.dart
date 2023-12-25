import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/models/user.dart';
import '../theme/mColors.dart';
import 'package:provider/provider.dart';

import '../states/index.dart';

class MyRoute extends StatefulWidget {
  const MyRoute({super.key});

  @override
  _MyRouteState createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  Widget build(BuildContext context) {
    // var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心')),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(children: <Widget>[
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
                      const SizedBox(
                        width: 15,
                      ),
                      const Image(
                        image: AssetImage(("assets/image/test.jpg")),
                        width: 50,
                        height: 50,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 5),
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
                              "连接你的网络世界",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )
                        ]),
                      ))
                    ],
                  ),
                ],
              ),
            )
          ])),
    );
  }

  void _onLogin() async {
    // 验证表单字段
    if ((_formKey.currentState as FormState).validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUsername(_unameController.text);
      Navigator.of(context).pop();
    }
  }
}
