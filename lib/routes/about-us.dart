import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/models/user.dart';
import '../theme/mColors.dart';
import 'package:provider/provider.dart';

import '../states/index.dart';
import '../widgets/index.dart';

class AboutUsRoute extends StatefulWidget {
  const AboutUsRoute({super.key});

  @override
  _AboutUsRouteState createState() => _AboutUsRouteState();
}

class _AboutUsRouteState extends State<AboutUsRoute> {
  @override
  Widget build(BuildContext context) {
    // var gm = GmLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('关于我们')),
        body: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: <Widget>[
                // 版本号，公司名称
              ],
            )));
  }
}
