import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_color.dart';

Future<dynamic> showToast({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? ColorLight.primary,
    textColor: textColor ?? Colors.white,
  );
}
