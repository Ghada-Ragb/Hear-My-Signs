import 'package:get/get.dart';
import 'package:test_grad/controller/QuizArabicNum.dart';

class BilndingsAppNum implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizArabicNum());
  }
}
