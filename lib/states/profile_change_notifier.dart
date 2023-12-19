// import '../index.dart';

// class ProfileChangeNotifier extends ChangeNotifier {
// Profile get _profile => Global.profile;

// @override
// void notifyListeners() {
//   Global.saveProfile(); //保存Profile变更
//   super.notifyListeners(); //通知依赖的Widget更新
// }
// }

import 'package:flutter/material.dart';

// class UserModel extends ChangeNotifier {
//   User? user;
//   String userName = '';

//   // APP是否登录(如果有用户信息，则证明登录过)
//   bool get isLogin => userName != '';

//   //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
//   void setUser(User? user) {
//     user = user;
//     // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
//     notifyListeners();
//   }

//   void setUserName(String userName) {
//     userName = userName;
//     // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
//     notifyListeners();
//   }
// }
class UserProvider with ChangeNotifier {
  String _username = '';

  String get username => _username;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }
}
