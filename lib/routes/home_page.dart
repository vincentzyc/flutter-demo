import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

// import '../models/user.dart';
import '../states/index.dart';
import '../widgets/index.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key, required this.title});

  final String title;

  @override
  // _HomeRouteState createState() => _HomeRouteState();
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // UserModel userModel = Provider.of<UserModel>(context);
    final userProvider = Provider.of<UserProvider>(context);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: userProvider.username == ''
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('您还未登录, 请先登录',
                        // 下边距30
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          // 下边距30
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 55.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              // 文字大小
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 20),
                              )),
                          child: const Text("去登录"),
                          onPressed: () =>
                              Navigator.of(context).pushNamed("login"),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).
                  //
                  // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
                  // action in the IDE, or press "p" in the console), to see the
                  // wireframe for each widget.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextButton(
                      child: const Text("open login page"),
                      onPressed: () => Navigator.of(context).pushNamed("login"),
                      // onPressed: () async {
                      //   //导航到新路由
                      //   var result = await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return const NewRoute(
                      //         text: "我是上个页面的传参哦~",
                      //       );
                      //     }),
                      //   );
                      //   // ignore: avoid_print
                      //   print("路由返回值: $result");
                      // },
                    ),
                    const RandomWords(),
                    Builder(builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "用户名: ${userProvider.username}",
                          style: const TextStyle(
                            // 文本的字体大小20，颜色红色
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }),
                    // Image.asset('assets/image/test.jpg', width: 100.0)
                    Image.network(
                        'https://static.jetmobo.com/image/content-h5/20220414/1649923427680.jpg',
                        width: 300.0)
                  ],
                ),
        ),
        floatingActionButton: userProvider.username == ''
            ? null
            : FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: MediaQuery.removePadding(
//         context: context,
//         // DrawerHeader consumes top MediaQuery padding.
//         removeTop: true,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             _buildHeader(), //构建抽屉菜单头部
//             Expanded(child: _buildMenus()), //构建功能菜单
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Consumer<UserModel>(
//       builder: (BuildContext context, UserModel value, Widget? child) {
//         return GestureDetector(
//           child: Container(
//             color: Theme.of(context).primaryColor,
//             padding: const EdgeInsets.only(top: 40, bottom: 20),
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: ClipOval(
//                     // 如果已登录，则显示用户头像；若未登录，则显示默认头像
//                     child: value.isLogin
//                         ? gmAvatar(value.user!.avatar_url, width: 80)
//                         : Image.asset(
//                             "imgs/avatar-default.png",
//                             width: 80,
//                           ),
//                   ),
//                 ),
//                 Text(
//                   value.isLogin ? value.user!.login : '登录',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           onTap: () {
//             if (!value.isLogin) Navigator.of(context).pushNamed("login");
//           },
//         );
//       },
//     );
//   }

//   // 构建菜单项
//   Widget _buildMenus() {
//     return Consumer<UserModel>(
//       builder: (BuildContext context, UserModel userModel, Widget? child) {
//         return ListView(
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.color_lens),
//               title: const Text('主题'),
//               onTap: () => Navigator.pushNamed(context, "themes"),
//             ),
//             ListTile(
//               leading: const Icon(Icons.language),
//               title: const Text('语言'),
//               onTap: () => Navigator.pushNamed(context, "language"),
//             ),
//             if (userModel.isLogin)
//               ListTile(
//                 leading: const Icon(Icons.power_settings_new),
//                 title: const Text('退出登录'),
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (ctx) {
//                       //退出账号前先弹二次确认窗
//                       return AlertDialog(
//                         content: const Text('是否退出登录?'),
//                         actions: <Widget>[
//                           TextButton(
//                             child: const Text('取消'),
//                             onPressed: () => Navigator.pop(context),
//                           ),
//                           TextButton(
//                             child: const Text('确认'),
//                             onPressed: () {
//                               //该赋值语句会触发MaterialApp rebuild
//                               userModel.user = null;
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
