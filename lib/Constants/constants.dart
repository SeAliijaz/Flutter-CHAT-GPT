import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

void showMessage(String msg) => Fluttertoast.showToast(msg: msg);
