import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_grad/util/Binding_appEngNum.dart';
import 'package:test_grad/views/QuizScreenEngNum.dart';
import 'package:test_grad/views/ResualtScreenEngNum.dart';
import 'package:test_grad/views/WelcomeQuizEngNum.dart';


class FinalQuizEngNum extends StatelessWidget {
  const FinalQuizEngNum({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding_appNumEng(),
      title: 'Flutter Quiz App',
      home: WelcomeScreenEngNum(),
      getPages: [
        GetPage(
            name: WelcomeScreenEngNum.routeName,
            page: () => WelcomeScreenEngNum()),
        GetPage(
            name: QuizScreenEngNum.routeName, page: () => QuizScreenEngNum()),
        GetPage(
            name: ResultScreenEngNum.routeName,
            page: () => ResultScreenEngNum()),
      ],
    );
  }
}
