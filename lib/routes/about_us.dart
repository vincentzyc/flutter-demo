import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_demo/models/user.dart';
import '../theme/mColors.dart';
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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center, // 主轴（垂直）方向的对齐方式
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 公司名称
              ListTile(
                title: Text('公司名称'),
                trailing: Text(
                  '这是公司名称',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 1,
                indent: 0,
                color: mColors.gray_ss,
              ),
              // SizedBox(height: 8.0), // 添加垂直间距
              // 版本号
              ListTile(
                title: Text('版本号'),
                trailing: Text(
                  '1.0.0',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
