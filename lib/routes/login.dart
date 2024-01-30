// import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/services.dart';
import 'package:flutter_demo/utils/api_util.dart';
// import 'package:flutter_demo/models/user.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../states/index.dart';

// final dio = Dio();

class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false;
  final GlobalKey _formKey = GlobalKey<FormState>();
  final bool _nameAutoFocus = true;

  // @override
  // void initState() {
  // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
  // _unameController.text = Global.profile.lastLogin ?? "";
  // if (_unameController.text.isNotEmpty) {
  //   _nameAutoFocus = false;
  // }
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名',
                    prefixIcon: Icon(Icons.person),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[\\s]')),
                  ],
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v == null || v.trim().isNotEmpty ? null : '用户名不能为空';
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '密码',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp('[\\s]')),
                ],
                //校验密码（不能为空）
                validator: (v) {
                  // if (v == null || v.trim().isNotEmpty) return '请输入密码';
                  return v!.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        // 文字大小
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20),
                        )),
                    onPressed: () => _onLogin(context),
                    child: const Text("登录"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<String> getToken() async {
  //   // 获取token
  //   var formData = {
  //     "username": _unameController.text,
  //     "password": _pwdController.text
  //   };
  //   var requestBody = {
  //     "data": jsonEncode(formData), // 待加密数据，json字符串格式
  //     "expireSeconds": 3600, // 过期时间，单位秒
  //   };

  //   Response response = await dio.post(generateToken, data: requestBody);

  //   var token = response.data['data']['token'];
  //   return token;
  // }

  void _onLogin(context) async {
    // 先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      var formData = {
        "username": _unameController.text,
        "password": _pwdController.text
      };
      String token = await getToken(formData);

      // 存储 token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);

      // UserModel userModel = Provider.of<UserModel>(context, listen: false);
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      //  验证通过
      userProvider.setUsername(_unameController.text);
      Navigator.of(context).pop();
    }
  }
}
