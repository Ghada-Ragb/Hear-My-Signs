import 'package:get/get.dart';
import 'package:test_grad/controller/QuizEngNum.dart';

class Binding_appNumEng implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizEngNum());
  }
}
