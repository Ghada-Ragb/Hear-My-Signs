import 'package:get/get.dart';
import 'package:test_grad/controller/QuizArabicAlpa.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizArabicAlap());
  }
}
