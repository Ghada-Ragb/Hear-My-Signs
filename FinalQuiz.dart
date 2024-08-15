import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_grad/util/Binding_app.dart';
import 'package:test_grad/views/QuizArabicScreen.dart';
import 'package:test_grad/views/ResultScreenArabicQuiz.dart';
import 'package:test_grad/views/WelcomeQuizArabic.dart';


class FinalQuiz extends StatelessWidget {
  const FinalQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsApp(),
      title: 'Flutter Quiz App',
      home: WelcomeScreen(),
      getPages: [
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
        GetPage(name: QuizScreen.routeName, page: () => QuizScreen()),
        GetPage(name: ResultScreen.routeName, page: () => ResultScreen()),
      ],
    );
  }
}
