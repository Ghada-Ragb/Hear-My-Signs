import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_grad/util/Binding_appEngDay.dart';
import 'package:test_grad/views/QuizScreenEngDay.dart';
import 'package:test_grad/views/ResualtScreenEngDay.dart';
import 'package:test_grad/views/WelcomeQuizEngDay.dart';


class FinalQuizEngDay extends StatelessWidget {
  const FinalQuizEngDay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding_appEngDay(),
      title: 'Flutter Quiz App',
      home: WelcomeScreenEngDay(),
      getPages: [
        GetPage(
            name: WelcomeScreenEngDay.routeName,
            page: () => WelcomeScreenEngDay()),
        GetPage(
            name: QuizScreenEngDay.routeName, page: () => QuizScreenEngDay()),
        GetPage(
            name: ResultScreenEngDay.routeName,
            page: () => ResultScreenEngDay()),
      ],
    );
  }
}
