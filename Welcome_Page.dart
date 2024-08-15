import 'package:flutter/material.dart';
import 'package:test_grad/views/IntroArabic.dart';
import 'package:test_grad/views/IntroEnglish.dart';
import 'package:test_grad/views/QuizEng.dart';
import 'package:test_grad/views/Welcome_Page2.dart';
import 'package:test_grad/widgets/learn_cardE.dart';


class Welcome_Page extends StatefulWidget {
  const Welcome_Page({super.key});

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
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
          "                Lectures",
          style: TextStyle(
            //fontFamily: 'Lobster',
            fontSize: 30,
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
          /*onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ())),*/
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return buildMobileLayout(context);
          } else if (constraints.maxWidth <= 1200) {
            return buildTabletLayout(context);
          } else {
            return buildDesktopLayout(context);
          }
        },
      ),
    );
  }
}

Widget buildMobileLayout(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 200),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Welcome_Page2()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 237, 158, 62),
            minimumSize: const Size(150, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Text(
            "Arabic",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.0,
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/NewMain/Logo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        height: 35,
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
                                builder: (context) => Home_Page_English()));
                      },
                      child: LearnCardE(
                        image: 'assets/images/NewMain/ic_twotone-menu-book.jpg',
                        label: 'Learn',
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QuizEng()));
                      },
                      child: LearnCardE(
                        image: 'assets/images/NewMain/Vector.jpg',
                        label: 'Quiz',
                        left: 45.0,
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
  );
}

Widget buildTabletLayout(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 230),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home_Page_Arabic()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 237, 158, 62),
            minimumSize: const Size(150, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Text(
            "Arabic",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.0,
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/NewMain/Logo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        height: 35,
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
                                builder: (context) => Home_Page_English()));
                      },
                      child: LearnCardE(
                        image: 'assets/images/NewMain/ic_twotone-menu-book.jpg',
                        label: 'Learn',
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QuizEng()));
                      },
                      child: LearnCardE(
                        image: 'assets/images/NewMain/Vector.jpg',
                        label: 'Quiz',
                        left: 45.0,
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
  );
}

Widget buildDesktopLayout(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 230),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home_Page_Arabic()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 237, 158, 62),
            minimumSize: const Size(150, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Text(
            "Arabic",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 1.0,
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/NewMain/Logo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        height: 35,
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
                                builder: (context) => Home_Page_English()));
                      },
                      child: LearnCardE(
                        image: 'assets/images/NewMain/ic_twotone-menu-book.jpg',
                        label: 'Learn',
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QuizEng()));
                      },
                      child: LearnCardE(
                        image: 'assets/images/NewMain/Vector.jpg',
                        label: 'Quiz',
                        left: 45.0,
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
  );
}
