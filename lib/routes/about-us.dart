import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_demo/models/user.dart';
// import '../theme/mColors.dart';
// import 'package:provider/provider.dart';

// import '../states/index.dart';
// import '../widgets/index.dart';

class AboutUsRoute extends StatefulWidget {
  const AboutUsRoute({super.key});

  @override
  State<AboutUsRoute> createState() => _AboutUsRouteState();
}

class _AboutUsRouteState extends State<AboutUsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('关于我们')),
      body: const Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 公司名称
            Text(
              '公司名称',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0), // 添加垂直间距
            // 版本号
            Text(
              '版本号 1.0.0',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            // 其他关于我们的信息可以继续添加
            // 其他内容
          ],
        ),
      ),
    );
  }
}
