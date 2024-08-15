import 'package:flutter/material.dart';
import 'package:test_grad/model/ArabicModel.dart';
import 'package:test_grad/views/IntroEnglish.dart';


class NumEng extends StatefulWidget {
  const NumEng({super.key});

  @override
  State<NumEng> createState() => _NumEngState();
}

class _NumEngState extends State<NumEng> {
  List<ArabicModel> NumEngList = [
    ArabicModel(image: "assets/images/NumEngNew/zero.jpg", text: "Zero(0)"),
    ArabicModel(image: "assets/images/NumEngNew/one.jpg", text: "One(1)"),
    ArabicModel(image: "assets/images/NumEngNew/two.jpg", text: "Two(2)"),
    ArabicModel(image: "assets/images/NumEngNew/three.jpg", text: "Three(3)"),
    ArabicModel(image: "assets/images/NumEngNew/four.jpg", text: "Four(4)"),
    ArabicModel(image: "assets/images/NumEngNew/five.jpg", text: "Five(5)"),
    ArabicModel(image: "assets/images/NumEngNew/six.jpg", text: "Six(6)"),
    ArabicModel(image: "assets/images/NumEngNew/seven.jpg", text: "Seven(7)"),
    ArabicModel(image: "assets/images/NumEngNew/eight.jpg", text: "Eight(8)"),
    ArabicModel(image: "assets/images/NumEngNew/nine.jpg", text: "Nine(9)"),
    ArabicModel(image: "assets/images/NumEngNew/ten.jpg", text: "Ten(10)"),
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
            "                 Numbers",
            style: TextStyle(
              //fontFamily: 'Lobster',
              fontSize: 32,
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
              itemCount: NumEngList.length,
            ),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    ArabicModel NumArabic = NumEngList[index];
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
/* final List<NumEngModel> categories2 = const [
    NumEngModel(image: "assets/images/NumbersEng/one.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/two.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/three.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/four.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/five.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/six.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/seven.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/eight.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/nine.jpg"),
    NumEngModel(image: "assets/images/NumbersEng/ten.jpg"),
  ];

SizedBox(
        height: 620.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories2.length,
          itemBuilder: (context, index) {
            return NumEngCards(
              category2: categories2[index],
            );
          },
        ),
      ),*/
