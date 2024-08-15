import 'package:get/get.dart';
import 'package:test_grad/controller/QuizArabicColor.dart';

class BilndingsAppColor implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizArabicColor());
  }
}
