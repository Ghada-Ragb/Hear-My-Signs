import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_grad/util/Binding_appDays.dart';
import 'package:test_grad/views/QuizScreenArabicDays.dart';
import 'package:test_grad/views/ResualtScreenArabicDays.dart';
import 'package:test_grad/views/WelcomeQuizArabicDays.dart';


class FinalQuizDays extends StatelessWidget {
  const FinalQuizDays({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsAppDays(),
      title: 'Flutter Quiz App',
      home: WelcomeScreenArabicDays(),
      getPages: [
        GetPage(
            name: WelcomeScreenArabicDays.routeName,
            page: () => WelcomeScreenArabicDays()),
        GetPage(
            name: QuizScreenArabicDays.routeName,
            page: () => QuizScreenArabicDays()),
        GetPage(
            name: ResultScreenArabicDays.routeName,
            page: () => ResultScreenArabicDays()),
      ],
    );
  }
}
