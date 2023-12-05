// import 'package:provider/provider.dart';

import '../index.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false;
  // final GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  // void initState() {
  //   // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
  //   _unameController.text = Global.profile.lastLogin ?? "";
  //   if (_unameController.text.isNotEmpty) {
  //     _nameAutoFocus = false;
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // key: _formKey,
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
                //校验密码（不能为空）
                validator: (v) {
                  return v == null || v.trim().isNotEmpty ? null : '密码必填';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    // textColor: Colors.white,
                    child: const Text('登录'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法
    print('登录');
    Navigator.of(context).pop();
    // if ((_formKey.currentState as FormState).validate()) {
    //   // 验证通过
    //   if ((_formKey.currentState as FormState).validate()) {
    //     // showLoading(context);
    //     User? user;
    //     try {
    //       user = await Git(context)
    //           .login(_unameController.text, _pwdController.text);
    //       // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
    //       Provider.of<UserModel>(context, listen: false).user = user;
    //     } on DioError catch (e) {
    //       //登录失败则提示
    //       if (e.response?.statusCode == 401) {
    //         showToast('账号或密码不正确');
    //       } else {
    //         showToast(e.toString());
    //       }
    //     } finally {
    //       // 隐藏loading框
    //       Navigator.of(context).pop();
    //     }
    //     //登录成功则返回
    //     if (user != null) {
    //       Navigator.of(context).pop();
    //     }
    //   }
    // }
  }
}