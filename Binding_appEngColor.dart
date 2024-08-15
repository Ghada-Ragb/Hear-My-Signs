import 'package:get/get.dart';
import 'package:test_grad/controller/QuizEngColor.dart';

class Binding_appEngColor implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizEngColor());
  }
}
