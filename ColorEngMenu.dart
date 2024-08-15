import 'package:flutter/material.dart';
import 'package:test_grad/model/ArabicModel.dart';
import 'package:test_grad/views/IntroEnglish.dart';


class ColorsEngMenu extends StatefulWidget {
  @override
  State<ColorsEngMenu> createState() => _ColorsEngMenuState();
}

class _ColorsEngMenuState extends State<ColorsEngMenu> {
  List<ArabicModel> ColorArabicList = [
    ArabicModel(
        image: "assets/images/ColorEng/black-webp.png", text: "Black🖤"),
    ArabicModel(image: "assets/images/ColorEng/blue-webp.png", text: "Blue💙"),
    ArabicModel(
        image: "assets/images/ColorEng/green-webp.png", text: "Green💚"),
    ArabicModel(
        image: "assets/images/ColorEng/orange-webp.png", text: "Orange🧡"),
    ArabicModel(image: "assets/images/ColorEng/red-webp.png", text: "Red❤"),
    ArabicModel(image: "assets/images/ColorEng/pink-webp.png", text: "Rose💗"),
    ArabicModel(
        image: "assets/images/ColorEng/violet-webp.png", text: "Violet💜"),
    ArabicModel(
        image: "assets/images/ColorEng/white-webp.png", text: "White🤍"),
    ArabicModel(
        image: "assets/images/ColorEng/yellow-webp.png", text: "Yellow💛")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 248, 253),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 10,
          shadowColor: Color.fromARGB(255, 245, 240, 240),
          title: const Text(
            "                Colors",
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
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home_Page_English())),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SizedBox(
            height: 490,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: _buildListItem,
              itemCount: ColorArabicList.length,
            ),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    ArabicModel NumArabic = ColorArabicList[index];
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 7.4,
        child: Card(
          color: Color.fromARGB(255, 205, 205, 205),
          elevation: 12,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  NumArabic.image,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: MediaQuery.of(context).size.height / 2.8,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  NumArabic.text,
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
