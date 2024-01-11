import 'package:flutter/material.dart';

class LoadingDialog {
  static BuildContext? _dialogContext;

  static void open(BuildContext context, String loadingText) {
    _dialogContext = context;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16.0),
                  Text(
                    loadingText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void close() {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
      _dialogContext = null;
    }
  }
}
