import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_grad/model/QuestionArabic.dart';
import 'package:test_grad/views/ResualtScreenEngColor.dart';
import 'package:test_grad/views/WelcomeQuizEngColor.dart';


class QuizEngColor extends GetxController {
  String name = '';
  //question variables
  int get countOfQuestion => _questionsList.length;
  final List<QuestionArabicModel> _questionsList = [
    QuestionArabicModel(
        id: 1,
        question: "assets/images/ColorEng/black-webp.png",
        answer: 1,
        options: ["Blue", "Black", "Green"]),
    QuestionArabicModel(
        id: 2,
        question: "assets/images/ColorEng/blue-webp.png",
        answer: 2,
        options: ['White', 'Red', 'Blue']),
    QuestionArabicModel(
        id: 3,
        question: "assets/images/ColorEng/green-webp.png",
        answer: 1,
        options: ["Orange", "Green", "Yellow"]),
    QuestionArabicModel(
        id: 4,
        question: "assets/images/ColorEng/orange-webp.png",
        answer: 0,
        options: ["Orange", "Yellow", "White"]),
    QuestionArabicModel(
        id: 5,
        answer: 2,
        question: "assets/images/ColorEng/pink-webp.png",
        options: ["Black", "Red", "Pink"]),
    QuestionArabicModel(
        id: 6,
        question: "assets/images/ColorEng/red-webp.png",
        answer: 1,
        options: ["White", "Red", "Blue"]),
    QuestionArabicModel(
        id: 7,
        question: "assets/images/ColorEng/violet-webp.png",
        answer: 1,
        options: ["Yellow", "Violet", "pink"]),
    QuestionArabicModel(
        id: 8,
        question: "assets/images/ColorEng/white-webp.png",
        answer: 2,
        options: ["Orange", "Red", "White"]),
    QuestionArabicModel(
        id: 9,
        question: "assets/images/ColorEng/yellow-webp.png",
        answer: 1,
        options: ["White", "Yellow", "Black"]),
  ];

  List<QuestionArabicModel> get questionsList => [..._questionsList];

  bool _isPressed = false;

  bool get isPressed => _isPressed; //To check if the answer is pressed

  double _numberOfQuestion = 1;

  double get numberOfQuestion => _numberOfQuestion;

  int? _selectAnswer;

  int? get selectAnswer => _selectAnswer;

  int? _correctAnswer;

  int _countOfCorrectAnswers = 0;

  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};

  //page view controller
  late PageController pageController;

  //timer
  Timer? _timer;

  final maxSec = 15;

  final RxInt _sec = 15.obs;

  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //get final score
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  void checkAnswer(QuestionArabicModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreenEngColor.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  //het right and wrong icon
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void resetTimer() => _sec.value = maxSec;

  void stopTimer() => _timer!.cancel();
  //call when start again quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(WelcomeScreenEngColor.routeName);
  }
}
