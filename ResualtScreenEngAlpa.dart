import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_grad/controller/QuizEngAlpa.dart';
import 'package:test_grad/widgets/CustomButton.dart';


class ResultScreenEngAlpa extends StatelessWidget {
  const ResultScreenEngAlpa({Key? key}) : super(key: key);
  static const routeName = '/result_screen5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F1ED),
        body: Stack(
          children: [
            Center(
              child: GetBuilder<QuizEngAlap>(
                init: Get.find<QuizEngAlap>(),
                builder: (controller) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                        ),
                        child: Text(
                          'Congratulation',
                          style:
                              Theme.of(context).textTheme.displaySmall!.copyWith(
                                    color: const Color(0xFF649192),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Text(
                        controller.name,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: const Color(0xFF649192),
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your Score is',
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: const Color(0xFF649192),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${controller.scoreResult.round()} /100',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: const Color(0xFF649192),
                              //fontFamily: 'Lobster',
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          onPressed: () => controller.startAgain(),
                          text: 'Start Again'),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.0,
                          height: MediaQuery.of(context).size.height / 2.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/finalImage.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
