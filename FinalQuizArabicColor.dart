import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_grad/util/Binding_appColor.dart';
import 'package:test_grad/views/QuizScreenArabicColor.dart';
import 'package:test_grad/views/ResualtScreenArabicColor.dart';
import 'package:test_grad/views/WelcomeQuizArabicColor.dart';


class FinalQuizColor extends StatelessWidget {
  const FinalQuizColor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsAppColor(),
      title: 'Flutter Quiz App',
      home: WelcomeScreenArabicColor(),
      getPages: [
        GetPage(
            name: WelcomeScreenArabicColor.routeName,
            page: () => WelcomeScreenArabicColor()),
        GetPage(
            name: QuizScreenArabicColor.routeName,
            page: () => QuizScreenArabicColor()),
        GetPage(
            name: ResultScreenArabicColor.routeName,
            page: () => ResultScreenArabicColor()),
      ],
    );
  }
}
