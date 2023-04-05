import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/Constants/constants.dart';
import 'package:flutter_chat_gpt/Screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///title
      title: 'CHAT-GPT'.toUpperCase(),

      ///debugShowCheckedModeBanner
      debugShowCheckedModeBanner: false,

      ///theme
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
            color: AppColors.cardColor,
          )),

      ///home
      home: ChatScreen(),
    );
  }
}
