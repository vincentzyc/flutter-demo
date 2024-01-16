import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/divide_line.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => AboutPageViewState();
}

class AboutPageViewState extends State<AboutPage> {
  String version = "0.0.1";

  @override
  void initState() {
    super.initState();
    getversion();
  }

  getversion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4490f6),
        elevation: 0,
        title: const Text("关于我们"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFFf0f0f0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Image(
                width: 110,
                height: 110,
                image: AssetImage(("assets/image/icon1.png"))),
            const SizedBox(
              height: 10,
            ),
            Text(
              "版本号：$version",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF323232),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    child: Row(
                      children: [
                        const Expanded(
                            child:
                                Text("官方电话", style: TextStyle(fontSize: 12))),
                        Text("400-697-0288",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[400]))
                      ],
                    ),
                  ),
                  const DivideLine(mmargin: 20),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    child: Row(
                      children: [
                        const Expanded(
                            child:
                                Text("合作方式", style: TextStyle(fontSize: 12))),
                        Text("intercom_hltx@163.com",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[400]))
                      ],
                    ),
                  ),
                  const DivideLine(mmargin: 20),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    child: Row(
                      children: [
                        const Expanded(
                            child:
                                Text("公司地址", style: TextStyle(fontSize: 12))),
                        Text(
                          "广东省广州市",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[400]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
