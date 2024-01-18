import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_demo/models/user.dart';
// import '../theme/mColors.dart';
// import 'package:provider/provider.dart';

// import '../states/index.dart';
import '../widgets/index.dart';

class MyRoute extends StatefulWidget {
  const MyRoute({super.key});

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  @override
  Widget build(BuildContext context) {
    // var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心')),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: <Widget>[
            const MyTitle(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  MySetting(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
