import 'package:flutter/material.dart';
import 'package:test_grad/views/AlpaEng.dart';
import 'package:test_grad/views/ColorEngMenu.dart';
import 'package:test_grad/views/DaysEngMenu.dart';
import 'package:test_grad/views/NumEng.dart';
import 'package:test_grad/views/Welcome_Page.dart';
import 'package:test_grad/widgets/learn_cardE.dart';


class Home_Page_English extends StatelessWidget {
  const Home_Page_English({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 10,
        shadowColor: Color.fromARGB(255, 245, 240, 240),
        title: const Text(
          "                Learn",
          style: TextStyle(
            //fontFamily: 'Lobster',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 139, 71, 14),
          ),
        ),
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
          ),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Welcome_Page())),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 0.1,
            height: MediaQuery.of(context).size.height / 2.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/NewMain/Simplification.jpg"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NumEng()));
                          },
                          child: LearnCardE(
                            image: 'assets/images/NewMain/Simplification2.jpg',
                            label: 'Numbers',
                            color: const Color(0xFF649192),
                            left: 8.0,
                            ontap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ColorsEngMenu()));
                          },
                          child: LearnCardE(
                            image: 'assets/images/NewMain/Simplification4.jpg',
                            label: 'Colors',
                            left: 30.0,
                            color: const Color(0xFF649192),
                            ontap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DayEngMenu()));
                          },
                          child: LearnCardE(
                            image: 'assets/images/NewMain/Simplification4.jpg',
                            label: 'Days',
                            color: const Color(0xFF649192),
                            left: 40.0,
                            ontap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Alpa_Eng()));
                          },
                          child: LearnCardE(
                            image: 'assets/images/NewMain/Simplification5.jpg',
                            label: 'Letters',
                            left: 30.0,
                            color: const Color(0xFF649192),
                            ontap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
