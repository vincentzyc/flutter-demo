import 'package:flutter/material.dart';
import '../theme/mColors.dart';

class MySetting extends StatelessWidget {
  MySetting({super.key});

  final List<Map<String, dynamic>> settings = [
    {'title': '个人资料', 'icon': Icons.person},
    {'title': '隐私设置', 'icon': Icons.lock},
    {'title': '通知管理', 'icon': Icons.notifications},
    {'title': '帮助与反馈', 'icon': Icons.help},
    {'title': '关于我们', 'icon': Icons.info},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: settings.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 1,
            indent: 0,
            color: mColors.gray_ss,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(settings[index]['icon']),
              title: Text(settings[index]['title']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (index == 4) {
                  Navigator.of(context).pushNamed('aboutPage');
                  return;
                }
                showToast(context, '这是提示文字哦~ 当前索引：${index + 1}');
              },
            );
          },
        ),
      ],
    );
  }

// 新增一个toast弹出提示函数
  void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
