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
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: AppColors.lightGray,
        ),
        iconTheme: const IconThemeData(color: AppColors.lightGray),
      ),
      home: const MyHomePage(),
    );
  }
}
