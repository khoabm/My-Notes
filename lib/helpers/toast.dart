import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showError(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.red,
      webShowClose: true,
      fontSize: 16.0);
}

void showSuccess(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 0, 255, 47),
      webShowClose: true,
      fontSize: 16.0);
}
