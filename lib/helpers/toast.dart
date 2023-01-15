import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// void showError(String msg) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       textColor: Colors.white,
//       backgroundColor: Colors.red,
//       webShowClose: true,
//       fontSize: 16.0);
// }

void showError(String msg, BuildContext context) {
  FToast fToast = FToast();
  fToast.init(context);
  return fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Color.fromARGB(255, 255, 0, 0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.clear,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              msg,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      toastDuration: const Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 100.0,
          right: 16.0,
          child: child,
        );
      });
}
