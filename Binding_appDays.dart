import 'package:get/get.dart';
import 'package:test_grad/controller/QuizArabicDays.dart';

class BilndingsAppDays implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizArabicDays());
  }
}
