import 'package:get/get.dart';
import 'package:test_grad/controller/QuizEngDay.dart';

class Binding_appEngDay implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizEngDay());
  }
}
