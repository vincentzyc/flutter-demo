import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/divide_line.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => AboutPageViewState();
}

class AboutPageViewState extends State<AboutPage> {
  String version = "1.0.0";

  @override
  void initState() {
    super.initState();
    // getversion();
  }

  // getversion () async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   version = packageInfo.version;
  //   setState(() {

  //   });
  // }

  // #docregion webview_widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF4490f6),
        elevation: 0,
        title: Text("关于我们"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFf0f0f0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            const Image(
                width: 110,
                height: 110,
                image: AssetImage(("assets/image/icon1.png"))),
            SizedBox(
              height: 10,
            ),
            Text(
              "版本号：" + version,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF323232),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                Text("官方电话", style: TextStyle(fontSize: 12))),
                        Text("400-697-0288",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[400]))
                      ],
                    ),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                  ),
                  DivideLine(mmargin: 20),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            child:
                                Text("合作方式", style: TextStyle(fontSize: 12))),
                        Text("intercom_hltx@163.com",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[400]))
                      ],
                    ),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                  ),
                  // DivideLine(mmargin: 20),
                  // Container(
                  //   child: Row(
                  //     children: [Expanded(child: Text("公司地址",style: TextStyle(fontSize: 12))), Text("广东省广州市天河区棠下智汇Park-E303",style: TextStyle(fontSize: 12,color: Colors.grey[400]),)],
                  //   ),
                  //   padding: EdgeInsets.only(
                  //       top: 15, bottom: 15, left: 20, right: 20),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
// #enddocregion webview_widget
}
