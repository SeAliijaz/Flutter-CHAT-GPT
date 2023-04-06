import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///APP COLORS
class AppColors {
  static const Color scaffoldBackgroundColor = Color(0xFF343541);
  static const Color cardColor = Color(0xFF444654);
}

///API CONSTANTS
class APIConstants {
  static const String baseURL = "https://api.openai.com/v1";
  static const String apiKEY =
      "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";
}

void showMessage(String msg) {
  Fluttertoast.showToast(msg: msg);
}
