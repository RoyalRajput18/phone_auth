import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void changeScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

// request here
void changeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false);
}

void popScreen(BuildContext context) {
  Navigator.pop(context);
}

void showToast({String message, BuildContext context}) {
  print(message);
  Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}
