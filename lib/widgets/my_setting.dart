import 'package:flutter/material.dart';
import '../theme/mColors.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('设置'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showToast(context, '这是提示文字哦~');
                },
              ),
            ),
          ],
        ),
        // 添加分割线
        const Divider(
          height: 3,
          indent: 0,
          color: mColors.text_gray,
        ),
      ],
    );
  }

// 新增一个toast弹出提示函数
  void showToast(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
