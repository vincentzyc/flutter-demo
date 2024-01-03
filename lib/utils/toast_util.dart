import 'package:fluttertoast/fluttertoast.dart';
import '../theme/mColors.dart';

void mToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: mColors.light_grey,
    textColor: mColors.text_black,
    fontSize: 16.0,
  );
}

void mToastLong(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: mColors.light_grey,
    textColor: mColors.text_black,
    fontSize: 16.0,
  );
}
