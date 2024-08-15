import 'package:get/get.dart';
import 'package:test_grad/controller/QuizEngAlpa.dart';

class Binding_appAlpaEng implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizEngAlap());
  }
}
