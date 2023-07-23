import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

late final String userId;
late final String userName;
late final String userEmail;

showToast(String msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFF1188FF),
      textColor: Colors.white
  );
}

Future<bool> checkConnection()async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    else{
      return false;
    }
  }
  on SocketException {
    return false;
  }
}
