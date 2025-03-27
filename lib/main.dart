import 'package:flutter/material.dart';
import 'package:fotmob/screens/main_page.dart';
import 'package:fotmob/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black,
      ),
      home: const MyHomePage(),
    );
  }
}
